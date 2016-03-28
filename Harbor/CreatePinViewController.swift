//
//  CreatePinViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class CreatePinViewController: UIViewController {
    
    private lazy var newView: UIView = {
        let newview = UIView()
        let gradientLayer = CAGradientLayer()
        
        let color1 = blueColor.CGColor as CGColorRef
        let color2 = seaGreenColor.CGColor as CGColorRef
        gradientLayer.colors = [color2, color1]
        gradientLayer.locations = [0.0, 0.5, 0.65, 0.75, 1.0]
        gradientLayer.type = kCAGradientLayerAxial
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1.0, 1)
        gradientLayer.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.view.layer.addSublayer(gradientLayer)
        
        self.view.addSubview(newview)
        return newview
    }()
    
    private lazy var pinFilledimageView: UIImageView = {
        let pinFilledimageView = UIImageView(image: UIImage(named: "pin-filled"))
        self.view.addSubview(pinFilledimageView)
        return pinFilledimageView
    }()
    
    private lazy var pinFilled2imageView: UIImageView = {
        let pinFilledimageView = UIImageView(image: UIImage(named: "pin-filled"))
        self.view.addSubview(pinFilledimageView)
        return pinFilledimageView
    }()
    
    private lazy var pinFilled3imageView: UIImageView = {
        let pinFilledimageView = UIImageView(image: UIImage(named: "pin-filled"))
        self.view.addSubview(pinFilledimageView)
        return pinFilledimageView
    }()
    
    private lazy var pinFilled4imageView: UIImageView = {
        let pinFilledimageView = UIImageView(image: UIImage(named: "pin-filled"))
        self.view.addSubview(pinFilledimageView)
        return pinFilledimageView
    }()
    
    private lazy var pinUnfilledimageView: UIImageView = {
        let pinUnfilledimageView = UIImageView(image: UIImage(named: "pin-unfilled"))
        self.view.addSubview(pinUnfilledimageView)
        return pinUnfilledimageView
    }()
    
    private lazy var pinUnfilled2imageView: UIImageView = {
        let pinUnfilledimageView = UIImageView(image: UIImage(named: "pin-unfilled"))
        self.view.addSubview(pinUnfilledimageView)
        return pinUnfilledimageView
    }()
    
    private lazy var pinUnfilled3imageView: UIImageView = {
        let pinUnfilledimageView = UIImageView(image: UIImage(named: "pin-unfilled"))
        self.view.addSubview(pinUnfilledimageView)
        return pinUnfilledimageView
    }()
    
    private lazy var pinUnfilled4imageView: UIImageView = {
        let pinUnfilledimageView = UIImageView(image: UIImage(named: "pin-unfilled"))
        self.view.addSubview(pinUnfilledimageView)
        return pinUnfilledimageView
    }()
    
    private lazy var setYourPinLabel: UILabel = {
        let setYourPinLabel = UILabel()
        setYourPinLabel.textColor = UIColor.whiteColor()
        let attrString = NSMutableAttributedString(string: "Set Your PIN")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 26)!, range: NSMakeRange(0, attrString.length))
        setYourPinLabel.attributedText = attrString
        setYourPinLabel.textAlignment = .Center
        self.view.addSubview(setYourPinLabel)
        return setYourPinLabel
    }()
    
    private lazy var pinDescriptionLabel: UILabel = {
        let setYourPinLabel = UILabel()
        setYourPinLabel.textColor = UIColor.whiteColor()
        let attrString = NSMutableAttributedString(string: "You use your PIN when you open Harbor.")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 16)!, range: NSMakeRange(0, attrString.length))
        setYourPinLabel.attributedText = attrString
        setYourPinLabel.textAlignment = .Center
        setYourPinLabel.numberOfLines = 0
        self.view.addSubview(setYourPinLabel)
        return setYourPinLabel
    }()
    
    private lazy var pinDescription2Label: UILabel = {
        let setYourPinLabel = UILabel()
        setYourPinLabel.textColor = UIColor.whiteColor()
        let attrString = NSMutableAttributedString(string: "This keeps your conversations safe.")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 16)!, range: NSMakeRange(0, attrString.length))
        setYourPinLabel.attributedText = attrString
        setYourPinLabel.textAlignment = .Center
        setYourPinLabel.numberOfLines = 0
        self.view.addSubview(setYourPinLabel)
        return setYourPinLabel
    }()
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        newView.pinToEdgesOfSuperview()
        
        self.navigationController?.navigationBarHidden = true
        setYourPinLabel.pinToTopEdgeOfSuperview(offset: 50)
        setYourPinLabel.centerHorizontallyInSuperview()
        
        pinDescriptionLabel.centerHorizontallyInSuperview()
        pinDescriptionLabel.positionBelowItem(setYourPinLabel, offset: 20)
        
        pinDescription2Label.centerHorizontallyInSuperview()
        pinDescription2Label.positionBelowItem(pinDescriptionLabel, offset: 5)
        
        pinUnfilled4imageView.positionBelowItem(pinDescription2Label, offset: 30)
        pinUnfilled3imageView.positionBelowItem(pinDescription2Label, offset: 30)
        pinUnfilled2imageView.positionBelowItem(pinDescription2Label, offset: 30)
        pinUnfilledimageView.positionBelowItem(pinDescription2Label, offset: 30)
        
        pinUnfilled2imageView.centerHorizontallyInSuperview(offset: 18)
        pinUnfilled3imageView.centerHorizontallyInSuperview(offset: -18)
        pinUnfilledimageView.positionToTheLeftOfItem(pinUnfilled3imageView, offset: 20)
        pinUnfilled4imageView.positionToTheRightOfItem(pinUnfilled2imageView, offset: 20)
        
        
    }

    

}
