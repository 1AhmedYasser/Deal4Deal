//
//  FinshedOrdersViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/7/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class FinshedOrdersViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate {
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 101 {
            return 10
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 101 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainOrderTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OrderTableViewCell
            return cell
            
            
        }
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 101 {
            return 500
        }else {
            return 150
        }
    }

}
