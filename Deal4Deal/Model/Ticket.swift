////
////  Ticket.swift
////  Deal4Deal
////
////  Created by IMac on 10/16/19.
////  Copyright © 2019 IMac. All rights reserved.
////
//
import Foundation

struct Ticket {
    let id, ticketNumber, clientId, campaingId, orderDetailsId : Int
    let isValid, earlyBaird : Bool
    let clientName : String
    let campaign : Campaign
    let client : Client
    init(campaign : Campaign ,client : Client,id : Int , ticketNumber: Int ,clientId : Int , campaingId : Int ,orderDetailsId : Int ,
         clientName : String ,earlyBaird : Bool ,isValid : Bool ) {
        self.client = client
        self.campaign = campaign
        self.id = id
        self.ticketNumber = ticketNumber
        self.clientId = clientId
        self.campaingId = campaingId
        self.orderDetailsId = orderDetailsId
        self.clientName =  clientName
        self.earlyBaird = earlyBaird
        self.isValid = isValid
    }
    
    
}

struct Campaign {
    let totalNumber , soldNumber   :Int
    let status, image , productName , prizename   : String
    let product  : Product
    let prize : Prize
    init(soldNumber : Int, totalNumber :Int ,prizename : String, productName : String, image :String,  status : String ,prize : Prize , product : Product    ) {
        self.soldNumber = soldNumber
        self.totalNumber = totalNumber
        self.prizename = prizename
        self.productName = productName
        self.image = image
        self.status = status
        self.prize = prize
        self.product = product
        
    }
}
struct Client {
    
}
struct Product {
    let category    : Category
    let categoryId  : Int
    let imageURL    : String
    let name        : String
    let description : String
   
    
}
struct Prize  {
     let product : Product
     let specification  : Specification
}

struct Category {
  
}

struct Specification {
    let name : String
    let value : String
  }

//{
//        "id": 20,
//        "name_en": "test bakr bakr",
//        "name_ar": "test bakr bakr",
//        "description_en": "<p>test bakr bakr</p>",
//        "description_ar": "<p>test bakr bakr</p>",
//        "category_id": 1,
//        "image": "images/prizes/69722967_484987855631383_748649822310891520_n.jpg",
//        "published": 1,
//        "created_at": "2019-09-17 12:47:04",
//        "updated_at": "2019-09-17 12:47:04",
//        "deleted_at": null,
//        "name": "cash",
//        "published_text": "Yes",
//        "category_text": "category1",
//        "category": {
//        "id": 1,
//        "name_en": "category1",
//        "name_ar": "قسم1",
//        "description_en": "desc1",
//        "description_ar": "وصف1",
//        "type_id": 2,
//        "image": "images/sliders/service.PNG",
//        "mobile_icon": "images/sliders/69874994_2366894683526350_6720412014692270080_n.jpg",
//        "published": 1,
//        "created_at": "2019-09-15 06:40:28",
//        "updated_at": "2019-09-15 07:10:12",
//        "deleted_at": null,
//        "name": "category11",
//        "published_text": "Yes",
//        "type_text": "prize",
//        "type": {
//        "id": 2,
//        "name_en": "prize",
//        "name_ar": "جائزه",
//        "created_at": "2019-09-15 09:24:14",
//        "updated_at": "2019-09-15 09:24:14",
//        "deleted_at": null
//        }
//        }
//        }











//"id": 14,
//"name_en": "Smtel P20 - 5.5-inch 8GB Dual SIM 3G Mobile Phone - Gold",
//"name_ar": "Smtel P20 - 5.5-inch 8GB Dual SIM 3G Mobile Phone - Gold",
//"description_en": "8MP Back Camera\r\n\r\nTake great high-resolutions photos and capture smooth video, with superb clarity and rich colors, with the 8MP rear camera.\r\n2.0MP Front Camera\r\nVideo chat is clear and captivating with Vision's front camera.",
//"description_ar": "8MP Back Camera\r\n\r\nTake great high-resolutions photos and capture smooth video, with superb clarity and rich colors, with the 8MP rear camera.\r\n\r\n2.0MP Front Camera\r\nVideo chat is clear and captivating with Vision's front camera.",
//"category_id": 9,
//"quantity": 20,
//"image": "images/products/1.jpg",
//"points": 5,
//"published": 1,
//"featured": 1,
//"created_at": "2019-10-15 19:12:30",
//"updated_at": "2019-10-15 19:12:30",
//"deleted_at": null,
//"name": "Smtel P20 - 5.5-inch 8GB Dual SIM 3G Mobile Phone - Gold",
//"category_text": "Mobile",
//"published_text": "Yes",
//"featured_text": "Yes",






