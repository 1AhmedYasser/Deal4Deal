//
//  ApiManger.swift
//  Deal4Deal
//
//  Created by IMac on 9/24/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//typealias MessageResponseOrError = (String?,errorString?) ->Void
enum ApiPath: String {
    case login = "/clients/login"
    case register = "/clients/register"
    case country  = "/countries"
    case forgotPassword = "clients/forget_password"
    case setting = "/settings"
    case currency = "/currencies"
}


class NetWorkManger {
    
    static var  share : NetWorkManger  = NetWorkManger()
    
    let header = ["Content-Type": "application/json", "accept": "application/json" ,"Accept-Language": "en"]
    let headerToken = ["Content-Type": "application/json", "accept": "application/json", "Authorization": "\(LocalData.share.tokenFormUserDefault())" ]
    let baseURL  = "http://deal4deal.app/deal4deal_backend/public/api"
    let baseURLforImage = "http://deal4deal.app/deal4deal_backend/public/"
    
    func signUP (firstname : String , lastname: String , countryId: Int , phone: String , email : String , password: String, passwordConfirm : String ,invitationCode : String? ,completion: @escaping (User?,_ _errorString : String?) -> Void  ) {
        
      
        let params: [String: Any] = ["first_name": firstname,
                                     "last_name" : lastname,
                                     "country_id" : countryId,
                                     "phone_number" : phone,
                                     "password" : password,
                                     "password_confirmation" :passwordConfirm,
                                     "email":email]
        print("************ \(params)")
        let url = NetWorkManger.share.baseURL + ApiPath.register.rawValue
        Alamofire.request(url, method: .post
            , parameters: params , encoding: JSONEncoding.default, headers: header).responseJSON {(response)-> Void  in
                switch response.result {
                case .failure(let error) :
                    completion( nil , error.localizedDescription)
               
                case .success(let value):
                    let json = JSON(value)
                    let data = json["data"]
                    let status = json["success"]
                    if status.boolValue == true {
                        let countryData = data["country"]
                        let country = Country(nameAr: countryData["name_ar"].stringValue, nameEn: countryData["name_en"].stringValue, imageUrl: countryData[""].stringValue, code: countryData["code"].stringValue, countryId: countryData["id"].intValue)
                        let user = User(firstName: data ["first_name"].stringValue , lastName: data["last_name"].stringValue,
                                        countryId: data ["country_id"].intValue , userId: data ["id"].intValue,
                                        email: data ["email"].stringValue, country: country, phone: data ["phone_number"].stringValue, isVerify: data ["is_verify"].intValue, level: data ["level_id"].intValue, purchasePoint: data ["purchase_points"].intValue, totalPoint: data ["total_points"].intValue, code: data ["code"].stringValue, updated: data ["first_name"].stringValue, created: data ["created_at"].stringValue, token: data ["token"].stringValue, countryName: data ["first_name"].stringValue, password: data["password"].stringValue)
                        
                        completion(user , nil)
                    } else {
                        let message = data["message"].stringValue
                        completion(nil , message)
                    }
 
                }
                
        }
    }
    
    
    func login (email : String , password : String , completion: @escaping (User?,_ errorMessage : String?) -> Void ) {
        
        let url = NetWorkManger.share.baseURL + ApiPath.login.rawValue
        
        let params: [String: Any] = ["email":email,"password" : password]
        Alamofire.request(url, method: .post
            , parameters: params , encoding: JSONEncoding.default, headers: header).responseJSON {(response)-> Void  in
                switch response.result {
                case .failure(let error) :
                    completion( nil , error.localizedDescription)
                case .success(let value):
                
                    let json = JSON(value)
                    let status = json["success"]
                    if status.boolValue == true {
                        
                        let data = json["data"]
                        let countryData = data["country"]
                        let country = Country(nameAr: countryData["name_ar"].stringValue, nameEn: countryData["name_en"].stringValue, imageUrl: countryData["image"].stringValue, code: countryData["code"].stringValue, countryId: countryData["id"].intValue)
                        let user = User(firstName: data ["first_name"].stringValue , lastName: data["last_name"].stringValue,
                                        countryId: data ["country_id"].intValue , userId: data ["id"].intValue,
                                        email: data ["email"].stringValue, country: country, phone: data ["phone_number"].stringValue, isVerify: data ["is_verify"].intValue, level: data ["level_id"].intValue, purchasePoint: data ["purchase_points"].intValue, totalPoint: data ["total_points"].intValue, code: data ["code"].stringValue, updated: data ["first_name"].stringValue, created: data ["created_at"].stringValue, token: data ["token"].stringValue, countryName: data ["first_name"].stringValue, password: data["password"].stringValue)
                        
                        completion(user , nil)
                        
                        
                    }else {
                         let message = json["message"].stringValue
                          completion( nil , message)
                    }
                    
                }
        }
    }
    
    
    
    
    
    
    // Mark :- GetAllCountries
    func getAllCountries( completion: @escaping ([Country]?) -> Void) {
        let urlString = NetWorkManger.share.baseURL + ApiPath.country.rawValue
        var allCountries = [Country]()
        Alamofire.request(urlString, headers: header).responseJSON { response in
            
            switch response.result {
            case  .success(let value) :
                let json = JSON(value)
                let data = json["data"].array?.forEach({ (country) in
                    let countryObj = Country(nameAr: country["name_ar"].stringValue, nameEn: country["name_en"].stringValue, imageUrl: country["image"].stringValue, code: country["code"].stringValue, countryId: country["id"].intValue)
                    
                    allCountries.append(countryObj)
                })
                completion(allCountries)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
            
        }
    }
    func getAllCurrencies( completion: @escaping ([Currency]?, _ errorString : String?  ) -> Void) {
        let urlString = NetWorkManger.share.baseURL + ApiPath.currency.rawValue
        var allCurrenncies = [Currency]()
        Alamofire.request(urlString, headers: header).responseJSON { response in
            
            switch response.result {
            case  .success(let value) :
                let json = JSON(value)
                let status = json["success"]
                if status.boolValue == true {
                    let data = json["data"].array?.forEach({ (currency) in
                        let countryObj = Currency(id: currency["id"].intValue, name: currency["name"].stringValue)
                    allCurrenncies.append(countryObj)
                    })
                    }else {
                    let message = json["message"].stringValue
                    completion( nil , message)}
  
                completion(allCurrenncies , nil)
            case .failure(let error):
               
                completion(nil,error.localizedDescription)
            }
            
        }
    }
    
    
    
    
    
    func forgotPassword (email :String , completion :@escaping (( _ message : String?,_ errorString : String?) -> Void)) {
        let urlString = NetWorkManger.share.baseURL + ApiPath.forgotPassword.rawValue
        let params: [String: Any] = ["email":email]
        Alamofire.request("http://deal4deal.app/deal4deal_backend/public/api/clients/forget_password", method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response)
            in
            switch response.result {
            case  .success(let value) :
                let json = JSON(value)
                let data = json["data"]
                let status = json["success"]
                if status.boolValue == true {
                    let message = data["message"].stringValue
                    completion(message , nil)
                }else {
                    let message = data["message"].stringValue
                    completion(nil , message)
                }

            case .failure(let error):
            completion(error.localizedDescription ,nil)
            }
        }
        
    }
    
    
    
    func getSetting( completion: @escaping (Setting?) -> Void) {
        let urlString = NetWorkManger.share.baseURL + ApiPath.setting.rawValue
         var settingArr = [Setting]()
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                
                _ = json["data"].array?.forEach({ (setting) in
                    let setting = Setting(video: setting["video"].stringValue, facebook: setting["facebook"].stringValue, instgram: setting["instgram"].stringValue, linkedIn: setting["linked_in"].stringValue, twitter: setting["twitter"].stringValue)
                    settingArr.append(setting)

                })
                 completion(settingArr.first)
          
            case .failure(_):
                completion(nil)
            }
            
        }
    
    }

}
