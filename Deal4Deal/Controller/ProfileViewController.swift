//
//  ProfileViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/2/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var personalView: UIView!
    
    @IBOutlet weak var shareView: UIView!
    
    @IBOutlet weak var settingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        personalView.shadow()
        shareView.shadow()
        settingView.shadow()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}
