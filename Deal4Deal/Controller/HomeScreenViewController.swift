//
//  HomeScreenViewController.swift
//  Deal4Deal
//
//  Created by IMac on 10/28/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeScreenViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var navBar: ButtonBarView!
    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        self.loadDesign()
        super.viewDidLoad()
        scrollView.contentSize.width = 1.0
        videoView.configure(url: "http://deal4deal.ae/deal4deal_backend/public/videos/Mov_bbb.mp4")
        videoView.isLoop = true
        videoView.play()
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let homeChild = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
        let productsChild = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ProductsVC")
        return [homeChild,productsChild]
    }
    
    func loadDesign(){
        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = .red
        self.settings.style.buttonBarBackgroundColor = .white
        self.settings.style.buttonBarItemBackgroundColor = .white
        self.settings.style.selectedBarBackgroundColor = .red
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 2.0
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = .red
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 0
        self.settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.black
            newCell?.label.textColor = UIColor.red
            
        }
      }
    }


