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
    @IBOutlet weak var homeScroller: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScroller.contentSize.height = 1.0
        campaignCollectionView.allowsMultipleSelection = false
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
          return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
        let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        sliderCell.sliderImage.image = UIImage(named: "home-slider\(indexPath.row + 1)")
        return sliderCell
        } else if collectionView == campaignCollectionView {
         let campaignCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CampaignCell", for: indexPath) as! CampaignCell
        
         return campaignCell
        } else {
          let campaignItemCell = CampaignItemsCollectionView.dequeueReusableCell(withReuseIdentifier: "CampaignItemCell", for: indexPath)
            return campaignItemCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == campaignCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! CampaignCell
            cell.layer.borderColor = UIColor.red.cgColor
            cell.layer.borderWidth = 1
            cell.campaignLabel.textColor = UIColor.red
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == campaignCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! CampaignCell
            cell.layer.borderWidth = 0
            cell.campaignLabel.textColor = UIColor.gray
        }
    }
    
}



