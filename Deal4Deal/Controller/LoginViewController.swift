//
//  LoginViewController.swift
//  Deal4Deal
//
//  Created by IMac on 9/29/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: MyCustomTextField!
    @IBOutlet weak var passwordTextField: MyCustomTextField!
    @IBOutlet weak var keepLogin: UIButton!
   
      var isKeepLogin :Bool = false
    
      let loader =  Loader()
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        
        self.navigationController?.isNavigationBarHidden = true
   
    
//    if  LocalData.share.isUserLoggedInFromUSerDefault() == true{
//      goToHomeScreen()
//    }
    NetWorkManger.share.getSetting { setting
        in
        print(setting?.video)
    }
    
    
    
    keepLogin.layer.borderWidth = 2
    keepLogin.layer.cornerRadius = 5
    keepLogin.layer.borderColor =  UIColor.darkGray.cgColor
    keepLogin.layer.backgroundColor = isKeepLogin ? UIColor.darkGray.cgColor : UIColor.clear.cgColor

       
    }
    
  @IBAction func keepMeLogged(_ sender: Any) {
    isKeepLogin = !isKeepLogin
    
    keepLogin.layer.backgroundColor = isKeepLogin ? UIColor.darkGray.cgColor : UIColor.clear.cgColor
    
    
    
  }

    
    
    @IBAction func forgotPassword(_ sender: Any) {
       GoToForgotPassWordScreen()
    }
    
    @IBAction func goToSinUp(_ sender: Any) {
        let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
  
    @IBAction func login(_ sender: Any) {
  
        
        
     
        if isValide() {
            loader.LoaderStartAnimation(self)
        if isKeepLogin == true {
          LocalData.share.isUserLoggedInUserDefualt(islogged: true)
        }
            NetWorkManger.share.login(email:userNameTextField.text! , password: passwordTextField.text!) { (user,error) in
             
                if error == nil {
                    self.loader.stopAnimation()
                    LocalData.share.SaveUerInfoInUserDefault(user: user)
                    self.goToHomeScreen()
                }else{
                     self.loader.stopAnimation()
                     self.alertWithTitleAndMessage(title:"Error", Message: error ?? "Failed" )
                    
                }
                
            }
            
        } else {
            // Allert Pop With Validat USer TetField
        self.alertWithTitleAndMessage(title: "Alert", Message: "Please Enter Data in  empty Field ")
            
        }
        
    }
    
    func isValide ()-> Bool {
        if userNameTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            return false
        }
        return true
    }
    
  

 private func goToHomeScreen() {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBareViewController") as? TabBarViewController
    self.navigationController?.pushViewController(vc!, animated: true)
  }
    private func GoToForgotPassWordScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    
    
    
    
}
