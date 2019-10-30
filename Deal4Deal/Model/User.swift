//
//  User.swift
//  Deal4Deal
//
//  Created by IMac on 9/25/19.
//  Copyright © 2019 IMac. All rights reserved.

import Foundation
import SwiftyJSON
struct User {
    var firstName : String
    var lastName : String
    var countryId : Int
     var userId : Int
    var email : String
    var country : Country
    var phone : String
    var isVerify : Int
    var level : Int
    var purchasePoint : Int
    var totalPoint : Int
    var code : String
    var updated : String
    var created : String
    var token : String
    var countryName : String
    var password : String
  
}

struct Country {
    var nameAr : String
    var nameEn : String
    var imageUrl : String
    var code : String
    var countryId : Int
}






