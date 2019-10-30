//
//  UIView+Extension.swift
//  Deal4Deal
//
//  Created by IMac on 10/8/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import Foundation
import UIKit


//extension UIView {
//    @IBInspectable
//    var cornerRadius: CGFloat  {
//        get {
//            return self.layer.cornerRadius
//        }
//        set {
//             self.layer.cornerRadius = newValue
//             //self.roundCorners()
//        }
//    }
//  
//    
//    
//    
//    
//    public func roundCorners() {
//        self.layer.cornerRadius = cornerRadius
//        self.layer.borderColor = #colorLiteral(red: 0.4666131139, green: 0.4666974545, blue: 0.4666077495, alpha: 0.06255501761)
//        self.clipsToBounds = true
//        self.layer.masksToBounds = true
//    }
//    
//
//  
//  
//  
//}

extension UIViewController {
  func alertWithTitleAndMessage(title : String, Message : String){
    let alert = UIAlertController(title: title, message: Message, preferredStyle: UIAlertController.Style.alert)
    // add an action (button)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    // show the alert
    self.present(alert, animated: true, completion: nil)
  }
}

