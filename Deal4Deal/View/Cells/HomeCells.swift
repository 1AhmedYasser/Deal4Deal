//
//  HomeSliderCell.swift
//  Deal4Deal
//
//  Created by IMac on 10/30/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import Toast_Swift

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var sliderText: UILabel!
    @IBOutlet weak var sliderButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardEffect()
        self.sliderImage.layer.cornerRadius = 20
        self.sliderButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func seeMore(_ sender: Any) {
    }
}



class CampaignTitleCell: UICollectionViewCell {
    
 
    @IBOutlet weak var campaignLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCampaignTitleCardEffect()
    }
    
    func setupCampaignTitleCardEffect() {
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.7
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }

}

class CampaignCell: UICollectionViewCell {
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productHeader: UIView!
    @IBOutlet weak var soldQuantity: UILabel!
    @IBOutlet weak var totalQuantity: UILabel!
    @IBOutlet weak var sellingProgress: UIProgressView!
    @IBOutlet weak var productImage: UIImageView!
    
    
    // Detail View
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var productPrize: UILabel!
    @IBOutlet weak var prizeDetailsButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var discountImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCampaignCard()
    }
    
    @IBAction func share(_ sender: UIButton) {
        print("Share")
    }
    
    @IBAction func addToWishlist(_ sender: Any) {
        print("Add to wishlist")
        self.superview!.makeToast("Added Item to wishlist", duration: 1.0, position: .bottom)
    }
    @IBAction func prizeDetails(_ sender: Any) {
        print("Open Prize Details")
    }
    @IBAction func addToCart(_ sender: Any) {
        print("Added Item to cart")
        self.superview!.makeToast("Added Item to cart", duration: 1.0, position: .bottom)
    }
    
    func setupCampaignCard() {
        
        sellingProgress.transform = sellingProgress.transform.scaledBy(x: 1, y: 4)
        sellingProgress.layer.cornerRadius = 4
        sellingProgress.clipsToBounds = true

        // Setup the product Header View
        productHeader.layer.cornerRadius = 30
        productHeader.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]        
        
        // Setup the product View
        productView.layer.cornerRadius = 30
        productView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        self.productView.layer.shadowRadius = 2
        self.productView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.productView.layer.shadowOpacity = 0.5
        self.layer.shadowPath = UIBezierPath(roundedRect: self.productView.bounds, cornerRadius: 30).cgPath
        
        
        // Setup the detail view card
        self.detailsView.layer.shadowRadius = 1
        self.detailsView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.detailsView.layer.shadowOpacity = 0.3
        self.layer.shadowPath = UIBezierPath(roundedRect: self.detailsView.bounds, cornerRadius: self.detailsView.layer.cornerRadius).cgPath
        self.detailsView.layer.cornerRadius = 20.0
        self.detailsView.layer.borderColor = UIColor.blue.cgColor
        self.prizeDetailsButton.layer.cornerRadius = 5
        self.prizeDetailsButton.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.137254902, blue: 0.1490196078, alpha: 1)
        self.prizeDetailsButton.layer.borderWidth = 1
        self.addToCartButton.layer.cornerRadius = 5
    
        let winLabel = "\(self.winLabel.text!)"
        let redRange = (winLabel as NSString).range(of: "win")
        let grayRange = (winLabel as NSString).range(of: "Get a chance to")
        let attributedText = NSMutableAttributedString(string: winLabel)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: redRange)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: grayRange)
        self.winLabel.attributedText = attributedText
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

