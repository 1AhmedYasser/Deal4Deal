//
//  setting.swift
//  Deal4Deal
//
//  Created by IMac on 10/16/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import Foundation
struct Setting {
   

    let facebook, instgram, linkedIn, twitter, video: String
  
    init(video:String ,facebook:String ,instgram:String ,linkedIn:String, twitter: String) {
      
        self.video = video
        self.facebook = facebook
        self.instgram = instgram
        self.linkedIn = linkedIn
        self.twitter = twitter
        
    }
}
