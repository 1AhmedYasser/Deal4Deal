//
//  ProductsViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/28/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ProductsViewController: UIViewController {

    @IBOutlet weak var campaignCollectionView: UICollectionView!
    @IBOutlet weak var CampaignItemsCollectionView: UICollectionView!
    
    // Campaign Titles
    let campaignsTitles = ["All","Watches","LifeStyle","Cars"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CampaignItemsCollectionView.register(UINib(nibName: "CampaignCell", bundle: .main),forCellWithReuseIdentifier: "CampaignCell")
    }
    
}
extension ProductsViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Products")
    }
}
extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == campaignCollectionView {
            return campaignsTitles.count
        } else {
         return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      if collectionView == campaignCollectionView {
            let campaignCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CampaignTitleCell", for: indexPath) as! CampaignTitleCell
            campaignCell.campaignLabel.text = campaignsTitles[indexPath.row]
            return campaignCell
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
