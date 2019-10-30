//
//  UserDefault .swift
//  Deal4Deal
//
//  Created by IMac on 9/30/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import Foundation
class LocalData : UserDefaults {
     static let share = LocalData()
    
    func SaveUerInfoInUserDefault (user : User?) {
      UserDefaults.standard.set( "Bearer \(String(describing: user?.token))"  , forKey: "User_Token")
        UserDefaults.standard.set(user?.countryId, forKey: "User_CountryId")
        UserDefaults.standard.set(user?.email, forKey: "User_Email")
        UserDefaults.standard.set(user?.password, forKey: "User_Password")
        
    }
  func isUserLoggedInUserDefualt(islogged : Bool){
     UserDefaults.standard.set(islogged, forKey: "isUserLoggedIn")
  }
    
    func  tokenFormUserDefault ()-> String {
        return UserDefaults.standard.string(forKey: "User_Token") ?? ""
    }
    func emailFromUserDefault () -> String {
         return UserDefaults.standard.string(forKey: "User_Email") ?? ""
    }
    func passwordFromUserDefault () -> String {
        return UserDefaults.standard.string(forKey: "User_Password") ?? ""
    }
  func isUserLoggedInFromUSerDefault ()-> Bool {
     return UserDefaults.standard.bool(forKey: "isUserLoggedIn")
  }
    



}
//UserDefaults.standard.set("Anand", forKey: "name")
//Retrieving String
//let name = UserDefaults.standard.string(forKey: “name”) ?? “”
