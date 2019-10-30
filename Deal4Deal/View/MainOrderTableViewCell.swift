//
//  MainOrderTableViewCell.swift
//  Deal4Deal
//
//  Created by IMac on 10/7/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class MainOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var tblInsideTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MainOrderTableViewCell  {
   
    func setTableViewDataSource <D : UITableViewDataSource & UITableViewDelegate>(_ datsourcDeleget : D , forRow: Int) {
        tblInsideTableView.delegate = datsourcDeleget
        tblInsideTableView.dataSource = datsourcDeleget
        tblInsideTableView.reloadData()
        
    }
        
  
   
}
