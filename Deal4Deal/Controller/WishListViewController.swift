//
//  WishListViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/8/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import AnimatableReload
import EmptyDataSet_Swift

class WishListViewController: UIViewController {
  
    
    @IBOutlet weak var wishlistCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   showEmptyResultMessage(show: true)
        wishlistCollectionView.register(UINib(nibName: "CampaignCell", bundle: .main),forCellWithReuseIdentifier: "CampaignCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AnimatableReload.reload(collectionView: self.wishlistCollectionView, animationDirection: "down")
    }
    
    func showEmptyResultMessage(show: Bool) {
        if show {
            wishlistCollectionView.emptyDataSetView { (view) in
                view.image(UIImage(named: "EmptyHeart")).detailLabelString(NSAttributedString(string: "You have no items in your wishlist")).shouldFadeIn(true).verticalSpace(63)
            }
        }else {
            wishlistCollectionView.emptyDataSetView { (view) in
                view.detailLabelString(NSAttributedString(string: ""))
                
            }
        }
    }
}

extension WishListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let wishCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CampaignCell", for: indexPath) as! CampaignCell
        return wishCell
    }
    
    
    
}
