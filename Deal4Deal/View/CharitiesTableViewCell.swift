//
//  CharitiesTableViewCell.swift
//  Deal4Deal
//
//  Created by IMac on 10/6/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class CharitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var charitesImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
