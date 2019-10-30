//
//  extension.swift
//  Deal4Deal
//
//  Created by IMac on 10/2/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import Foundation
import  UIKit

extension UIView {
    func shadow() {
        self.layer.cornerRadius = 25
        self.clipsToBounds = false
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
extension String {
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    
}
