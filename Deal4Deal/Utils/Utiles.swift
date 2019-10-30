//
//  Utiles.swift
//  Deal4Deal
//
//  Created by IMac on 9/22/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import Foundation
import UIKit

class MyCustomTextField : UITextField {
    let padding = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.borderStyle = .none
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.borderWidth = 1.0
   
    }
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func drawPlaceholder(in rect: CGRect) {
        
        let color = #colorLiteral(red: 0.137254902, green: 0.1215686275, blue: 0.1254901961, alpha: 1)
        
        if (placeholder?.responds(to: #selector(NSString.draw(in:withAttributes:))))! {
            
            let fontS = UIFont.systemFont(ofSize: 14)
            
            let attributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: fontS] as [NSAttributedString.Key : Any]
            
            let boundingRect: CGRect = placeholder!.boundingRect(with: rect.size, options: [], attributes: attributes, context: nil)
            
            placeholder?.draw(at: CGPoint(x: 0, y: (rect.size.height / 2) - boundingRect.size.height / 2), withAttributes: attributes)
        }
        
    }
}


class RoundButton: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 5
    }
}

class CustomeShadowUiTextField : UITextField {
      
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      self.layer.cornerRadius = 10
      self.clipsToBounds = false
      self.layer.shadowOpacity = 0.25
      self.layer.shadowOffset = CGSize(width: 0, height: 3)
      
    }

}

class DealNavigationController : UINavigationController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        navigationBar.barStyle = UIBarStyle.black
        navigationBar.tintColor = UIColor.yellow
    
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        
        let image = UIImage(named: "Logo")
        imageView.image = image
        
       
        navigationItem.titleView = imageView
    
    }
    
    
 
    
}

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor(red: 81 / 255, green: 155 / 255, blue: 22 / 255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        
        let image = UIImage(named: "Logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    private func imageView(imageName: String) -> UIImageView {
        let logo = UIImage(named: imageName)
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        logoImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return logoImageView
    }
    
    func barImageView(imageName: String) -> UIBarButtonItem {
        return UIBarButtonItem(customView: imageView(imageName: imageName))
    }
    
    func barButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    
    
    
    
}

