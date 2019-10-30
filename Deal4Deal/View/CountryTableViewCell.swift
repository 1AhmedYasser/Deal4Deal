//
//  CountryTableViewCell.swift
//  Deal4Deal
//
//  Created by IMac on 9/25/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import Kingfisher
class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var name: NSLayoutConstraint!
    @IBOutlet weak var countryImage: UIImageView!
   
    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
   
    func ConfigCell (country : Country) {
      let url = URL(string:NetWorkManger.share.baseURLforImage + country.imageUrl)
        countryName.text = country.nameEn
        countryImage.kf.setImage(with: url)
       
    }

}

