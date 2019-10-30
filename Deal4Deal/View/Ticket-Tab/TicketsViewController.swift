//
//  TicketsViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/27/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import AnimatableReload
import EmptyDataSet_Swift

class TicketsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout.minimumLineSpacing = 25
      // showEmptyResultMessage(show: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AnimatableReload.reload(collectionView: self.collectionView, animationDirection: "down")
    }
    
    func showEmptyResultMessage(show: Bool) {
        if show {
            collectionView.emptyDataSetView { (view) in
                view.image(UIImage(named: "Ticket-Active")).detailLabelString(NSAttributedString(string: "you can see your active tickets here after you have made a purchase")).shouldFadeIn(true).verticalSpace(50)
            }
        }else {
            collectionView.emptyDataSetView { (view) in
                view.detailLabelString(NSAttributedString(string: ""))
             
            }
        }
    }
    
}

extension TicketsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TicketCell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell", for: indexPath)
      
        return headerCell
        
    }
}
