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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Product displayed")
    }
    
    
}
extension ProductsViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Products")
    }
}
