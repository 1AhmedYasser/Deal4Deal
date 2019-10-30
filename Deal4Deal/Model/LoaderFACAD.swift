//
//  Loader.swift
//  Deal4Deal
//
//  Created by IMac on 10/23/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
class Loader {
    
     var loader : NVActivityIndicatorView!
    
    func LoaderStartAnimation(_ viewController: UIViewController)
    {
        let xAxis = viewController.view.center.x
        let yAxis = viewController.view.center.y // or use (view.frame.size.height / 2) // or use (faqWebView.frame.size.height / 2)
        let frame = CGRect(x: (xAxis - 22 ), y: (yAxis - 22), width: 45, height: 45)
        loader = NVActivityIndicatorView(frame: frame)
        loader.type = .lineSpinFadeLoader // add your type
        loader.color = UIColor.red // add your color
        viewController.view.addSubview(loader) // or use  webView.addSubview(activityIndicator)
        loader.startAnimating()
    }
    
    func stopAnimation () {
        loader.stopAnimating()
    }
}
