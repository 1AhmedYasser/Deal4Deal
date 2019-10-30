//
//  IntorViewController.swift
//  Deal4Deal
//
//  Created by IMac on 9/19/19.
//  Copyright © 2019 IMac. All rights reserved.
// Cool
import UIKit
import NVActivityIndicatorView
class IntroViewController: UIViewController,UIScrollViewDelegate  {
 
   
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
   
    @IBOutlet weak var getStaredButton: UIButton!
    
    var slides:[Slide] = [];
     
    override func viewDidLoad() {
    
      
      
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        getStaredButton.layer.cornerRadius = 10
        scrollView.contentSize.height = 1.0
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func getStarted(_ sender: Any) {
 
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
       
        setupSlideScrollView(slides: slides)
    }
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "intro1")
        slide1.labelTitle.text = "Shopping Fun"
        slide1.labelDes.text = "Choose from a wide variety of products (clothing, cars, real estate…) with ease."
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "intro2")
        slide2.labelTitle.text = "Free Vouchers & Prizes"
        slide2.labelDes.text = "When you purchase a product you can get free vouchers to enter the prize draw"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "intro3")
        slide3.labelTitle.text = "Collect Points"
        slide3.labelDes.text = "Deal 4 Deal gives you points when you buy products so you can buy more"
        
      
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }

}
