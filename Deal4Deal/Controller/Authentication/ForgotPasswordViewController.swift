//
//  ForgotPasswordViewController.swift
//  Deal4Deal
//
//  Created by Eng Nour Hegazy on 9/28/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
 @IBOutlet weak var email: UITextField!
  
  let loader = Loader()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  @IBAction func sendEmail(_ sender: Any) {
    
    if let email =  email.text , !email.isEmpty {
        if email.isValidEmail == true {
             loader.LoaderStartAnimation(self)
            NetWorkManger.share.forgotPassword(email: email) { (message, error) in
                if error != nil {
                     self.loader.stopAnimation()
                    self.alertWithTitleAndMessage(title: "Error", Message: error ?? "")
                }else {
                    self.loader.stopAnimation()
                    self.alertWithTitleAndMessage(title: "Sucsess", Message: message ?? "Message Sent To Your  mail")
                   // self.dismiss(animated: true, completion: nil)
                }
                
            }
        }else {
             self.alertWithTitleAndMessage(title: "Alert", Message: "Email Not Valide")
        }
    }else {
        self.alertWithTitleAndMessage(title: "Alert", Message: "Please Enter data in Empty Field")
    }
   
    
    }
   
   

}
