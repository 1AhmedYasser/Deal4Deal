//
//  HomeSliderCell.swift
//  Deal4Deal
//
//  Created by IMac on 10/30/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardEffect()
        self.sliderImage.layer.cornerRadius = 20
    }




}
class CampaignCell: UICollectionViewCell {
    
    @IBOutlet weak var campaignButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCampaignCardEffect()
        campaignButton.backgroundColor = .clear
        campaignButton.layer.cornerRadius = 5
        campaignButton.layer.borderWidth = 1
        campaignButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    func setupCampaignCardEffect() {
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }

}


extension UICollectionViewCell {
    
    func setupCardEffect() {
        self.contentView.layer.cornerRadius = 20.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
