//
//  HomeViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/9/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: UIViewController {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var campaignCollectionView: UICollectionView!
    @IBOutlet weak var CampaignItemsCollectionView: UICollectionView!
    
    // Campaign Titles
    let campaignsTitles = ["Open","Soon","Sold","Winners"]
    let campaignTitlesDescriptions = ["Hundreds of\nwinners\nand growing!","Get free ipoints on\nevery purchase you\nmake","Earn 100 ipoints\nand start\nshopping!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        campaignCollectionView.allowsMultipleSelection = false
        CampaignItemsCollectionView.register(UINib(nibName: "CampaignCell", bundle: .main),forCellWithReuseIdentifier: "CampaignCell")

    }
    
}
extension HomeViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Home")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView {
          return 3
        } else {
            if collectionView == CampaignItemsCollectionView {
                return campaignsTitles.count
            } else {
                return 4
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
        let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        sliderCell.sliderImage.image = UIImage(named: "home-slider\(indexPath.row + 1)")
            let sliderText = NSMutableAttributedString(string: campaignTitlesDescriptions[indexPath.row])
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            sliderText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, sliderText.length))
            sliderText.addAttribute(.foregroundColor, value: UIColor.white, range: NSMakeRange(0, sliderText.length))
           sliderCell.sliderText.attributedText = sliderText
        return sliderCell
        } else if collectionView == campaignCollectionView {
         let campaignTitleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CampaignTitleCell", for: indexPath) as! CampaignTitleCell

         campaignTitleCell.campaignLabel.text = campaignsTitles[indexPath.row]
         return campaignTitleCell
        } else {
          let campaignCell = CampaignItemsCollectionView.dequeueReusableCell(withReuseIdentifier: "CampaignCell", for: indexPath) as! CampaignCell
            return campaignCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == campaignCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! CampaignTitleCell
            cell.layer.borderColor = UIColor.red.cgColor
            cell.layer.borderWidth = 1
            cell.campaignLabel.textColor = UIColor.red
        }
        
        if collectionView == CampaignItemsCollectionView {
            print("hi")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == campaignCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! CampaignTitleCell
            cell.layer.borderWidth = 0
            cell.campaignLabel.textColor = UIColor.gray
        }
    }
    
}



