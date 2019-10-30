//
//  TicketCell.swift
//  Deal4Deal
//
//  Created by IMac on 10/27/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit

class TicketCell: UICollectionViewCell {
    
    @IBOutlet weak var statusIndicator: UIView!
    @IBOutlet weak var quantityIndicator: UIProgressView!
    
    @IBOutlet weak var ticketNumber: UILabel!
    @IBOutlet weak var ticketImage: UIImageView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var winPrizeLabel: UILabel!
    @IBOutlet weak var soldQuantity: UILabel!
    @IBOutlet weak var totalQuantity: UILabel!
    
    override func awakeFromNib() {
       quantityIndicator.transform = quantityIndicator.transform.scaledBy(x: 1, y: 4)
        quantityIndicator.layer.cornerRadius = 4
        quantityIndicator.clipsToBounds = true
        
        let winLabel = "\(self.winLabel.text!)"
        let redRange = (winLabel as NSString).range(of: "win")
        let grayRange = (winLabel as NSString).range(of: "Get a chance to")
        let attributedText = NSMutableAttributedString(string: winLabel)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: redRange)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: grayRange)
        self.winLabel.attributedText = attributedText
        setupCardEffect()
        self.statusIndicator.layer.cornerRadius =  statusIndicator.bounds.width / 2
    }
}

class TicketCellHeader: UICollectionViewCell {
    
}
