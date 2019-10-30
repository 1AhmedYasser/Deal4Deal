//
//  CharitiesViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/6/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class CharitiesViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Must be Dynamic Height 
        return 500
    }

}
