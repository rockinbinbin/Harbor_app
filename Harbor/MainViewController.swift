//
//  MainViewViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

let teal = UIColor(red:0.02, green:0.9, blue:0.81, alpha:1.0)

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBarHidden = false
        setNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setNavBar() {
//        let gradientLayer = CAGradientLayer()
//        
//        let color1 = blueColor.CGColor as CGColorRef
//        let color2 = seaGreenColor.CGColor as CGColorRef
//        gradientLayer.colors = [color2, color1]
//        gradientLayer.locations = [0.0, 0.5, 0.65, 0.75, 1.0]
//        gradientLayer.type = kCAGradientLayerAxial
//        gradientLayer.startPoint = CGPointMake(0, 0)
//        gradientLayer.endPoint = CGPointMake(1.0, 1)
//        gradientLayer.frame = CGRectMake(0, 0, (self.navigationController?.navigationBar.frame.size.width)!, (self.navigationController?.navigationBar.frame.size.height)!)
//        self.navigationController?.navigationBar.layer.addSublayer(gradientLayer)
//      
        self.navigationController?.navigationBar.backgroundColor = teal
        self.navigationController?.navigationBar.translucent = false
        let logo = UIImage(named: "navBarLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
    }
    

    

}
