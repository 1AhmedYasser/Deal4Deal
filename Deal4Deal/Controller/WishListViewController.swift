//
//  WishListViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/8/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController,UITableViewDataSource , UITableViewDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.register(UINib(nibName: "MainCell", bundle: nil)
        , forCellReuseIdentifier: "MainCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }

}
