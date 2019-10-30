//
//  LanguageAndCurrencyViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/23/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class LanguageAndCurrencyViewController: UIViewController,UIActionSheetDelegate {
    
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    
    @IBOutlet weak var currencyButton: UIButton!
    
    @IBOutlet weak var arabicButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
   
    
    
     var currencyArr = [Currency]()
     var currencyId : Int?
     var language: String?
    //create action sheet
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonIsUnSelected(englishButton)
        buttonIsUnSelected(arabicButton)
        currencyButton.titleLabel?.text = "Select Currency"
        
        
        NetWorkManger.share.getAllCurrencies { ( currencies
            , error) in
            if error == nil {
                self.currencyArr = currencies!
            }else {
                self.alertWithTitleAndMessage(title: "Error", Message: error ?? "")
            }
            
        }
    }
    
    @IBAction func selectCurrency(_ sender: Any) {
        let actionSheet = UIActionSheet(title: nil, delegate: self as! UIActionSheetDelegate, cancelButtonTitle: nil, destructiveButtonTitle: nil)
        //for each value in array
        for value in currencyArr{
            //add a button
            actionSheet.addButton(withTitle: value.name as String)
        }
        //display action sheet
        actionSheet.show(in: self.view)
        
    }
    
    @IBAction func selectEnglish(_ sender: Any) {
        buttonIsUnSelected(arabicButton)
        buttonIsSelected(englishButton)
        englishLabel.textColor = #colorLiteral(red: 0.9505452514, green: 0.23347947, blue: 0.1932060421, alpha: 1)
        arabicLabel.textColor = #colorLiteral(red: 0.458770752, green: 0.4588538408, blue: 0.4587655067, alpha: 1)
        language = "en"
        
    }
  
    @IBAction func selectArabic(_ sender: Any) {
        buttonIsUnSelected(englishButton)
        buttonIsSelected(arabicButton)
        englishLabel.textColor =  #colorLiteral(red: 0.458770752, green: 0.4588538408, blue: 0.4587655067, alpha: 1)
        arabicLabel.textColor = #colorLiteral(red: 0.9505452514, green: 0.23347947, blue: 0.1932060421, alpha: 1)
          language = "ar"
    }
    
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int){
        let action : String = currencyArr[buttonIndex].name
        self.currencyButton.titleLabel?.text = action
        self.currencyId = currencyArr[buttonIndex].id
        print(action)
    }
    
    
    func buttonIsSelected (_ button : UIButton) {
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor =  UIColor.lightGray.cgColor
        button.layer.backgroundColor = UIColor.lightGray.cgColor
        
        
    }
    func buttonIsUnSelected (_ button : UIButton) {
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor =  UIColor.lightGray.cgColor
        button.layer.backgroundColor = UIColor.white.cgColor
    }
    
    
    
    @IBAction func setLanguageAndCurrency(_ sender: Any) {
        if currencyId != nil {
             // save in User Default
        }else {
            self.alertWithTitleAndMessage(title: "Error", Message: "Please Select Currency")
        }
        if language != nil {
            // Save in Use Default
        } else {
            self.alertWithTitleAndMessage(title: "Error", Message: "Please Select Language ")
        }
    }
    
}
