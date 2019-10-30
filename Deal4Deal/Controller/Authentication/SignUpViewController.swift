//
//  SignUpViewController.swift
//  Deal4Deal
//
//  Created by IMac on 9/19/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: MyCustomTextField!
    @IBOutlet weak var lastNameTextField: MyCustomTextField!
    @IBOutlet weak var countryButton: RoundButton!
    @IBOutlet weak var phoneCodeTextField: MyCustomTextField!
    @IBOutlet weak var phoneTextField: MyCustomTextField!
    @IBOutlet weak var emailTextField: MyCustomTextField!
    @IBOutlet weak var passwordTextField: MyCustomTextField!
    @IBOutlet weak var confirmePasswordTextField: MyCustomTextField!
    @IBOutlet weak var invitationTextField: MyCustomTextField!
    var  countryId : Int = 0
    let loader = Loader()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         print(LocalData.share.emailFromUserDefault())
        
      }
    
    @IBAction func selectCountry(_ sender: Any) {
      
        let countryVC = self.storyboard!.instantiateViewController(withIdentifier: "CountryTableViewController") as! CountryTableViewController
          countryVC.countryCallback = { (countrySelected) in
            self.countryButton.setTitle(countrySelected.nameEn, for: .normal)
            self.countryId = countrySelected.countryId
        
        }

      self.navigationController?.pushViewController(countryVC, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        // Go To Login Screen
     let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    @IBAction func singUp(_ sender: Any) {
           sinup()
    }
  
    private func sinup() {
        if isValide() {
            loader.LoaderStartAnimation(self)
            NetWorkManger.share.signUP(firstname: firstNameTextField.text!, lastname: lastNameTextField.text! , countryId: countryId, phone:phoneCodeTextField.text! + phoneTextField.text! , email: emailTextField.text!, password: passwordTextField.text!, passwordConfirm: confirmePasswordTextField.text!, invitationCode: invitationTextField.text){ user, error  in
                if error == nil {
                    self.loader.stopAnimation()
                     self.goToHomeScreen()
                }else{
                    self.loader.stopAnimation()
                    self.alertWithTitleAndMessage(title: "Error", Message: error ?? "Failed" )
                }
            
            }
        }else{
          self.alertWithTitleAndMessage(title: "Validation Error", Message: "Enter empty Field")
          
        }
       
    }
   
    private func isValide() -> Bool {
        if firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty || emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || confirmePasswordTextField.text!.isEmpty  || phoneTextField.text!.isEmpty || phoneCodeTextField.text!.isEmpty || countryId == nil  {
             return false
        }
        return true
    }
    
    

 
   
    
    
    
    
    // Validation
    
    private func isFirstNameValid ()-> Bool? {
        return firstNameTextField.text!.count  > 0 || firstNameTextField.text!.count < 100
        
    }
    private func isLastNameValid ()-> Bool? {
        return lastNameTextField.text!.count  > 0 || lastNameTextField.text!.count < 100
    }
  
    private func isValidCountry () -> Bool {
        return countryId != nil
    }
    
    private func isCountryCodeValid() -> Bool  {
        if let phoneCodeTextField  = phoneCodeTextField.text?.count  {
            return phoneCodeTextField > 0 && phoneCodeTextField < 4
        }
        return false
    }
    
    private func isValidEmail()-> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with:emailTextField.text )
    }
    private func isValidPassword() -> Bool {
        if let password = passwordTextField.text?.count {
            return password > 0 && password < 20
        }
        return false
    }
    private func isValidConfirmePassword() -> Bool {
        if let password = confirmePasswordTextField.text?.count {
            return password > 0 && password < 20
        }
        return false
    }
    private func isValidMatchPassword() -> Bool {
        if let password = passwordTextField.text ,let confirmePassword = confirmePasswordTextField.text {
            return password == confirmePassword
        }
        return false
    }
  
  private func goToHomeScreen() {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBareViewController") as? TabBarViewController
    self.navigationController?.pushViewController(vc!, animated: true)
  }
}
