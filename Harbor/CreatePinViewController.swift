//
//  CreatePinViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

// for some reason, pins 2 and 3 are switched

class CreatePinViewController: UIViewController {
    
    let pinString = NSMutableString(string: "")
    
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
    
    internal lazy var oneButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "1")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("onePressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var twoButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
    
        let attrString = NSMutableAttributedString(string: "2")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("twoPressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var threeButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "3")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("threePressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var fourButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "4")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("fourPressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var fiveButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "5")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("fivePressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var sixButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "6")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("sixPressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var sevenButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "7")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("sevenPressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var eightButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "8")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("eightPressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var nineButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "9")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("ninePressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
    }()
    
    internal lazy var zeroButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 35
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        loginButton.tintColor = UIColor.darkGrayColor()
        
        let attrString = NSMutableAttributedString(string: "0")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 30)!, range: NSMakeRange(0, attrString.length))
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        loginButton.addTarget(self, action: Selector("zeroPressed"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        return loginButton
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

        sizeButtons()
        layoutButtons()
    }

    func sizeButtons() {
        oneButton.sizeToWidth(70)
        oneButton.sizeToHeight(70)
        
        twoButton.sizeToWidth(70)
        twoButton.sizeToHeight(70)
        
        threeButton.sizeToWidth(70)
        threeButton.sizeToHeight(70)
        
        fourButton.sizeToWidth(70)
        fourButton.sizeToHeight(70)
        
        fiveButton.sizeToWidth(70)
        fiveButton.sizeToHeight(70)
        
        sixButton.sizeToWidth(70)
        sixButton.sizeToHeight(70)
        
        sevenButton.sizeToWidth(70)
        sevenButton.sizeToHeight(70)
        
        eightButton.sizeToWidth(70)
        eightButton.sizeToHeight(70)
        
        nineButton.sizeToWidth(70)
        nineButton.sizeToHeight(70)
        
        zeroButton.sizeToWidth(70)
        zeroButton.sizeToHeight(70)
    }
    
    
    func layoutButtons() {
        
        oneButton.positionBelowItem(pinUnfilledimageView, offset: 40)
        twoButton.positionBelowItem(pinUnfilledimageView, offset: 40)
        threeButton.positionBelowItem(pinUnfilledimageView, offset: 40)
        
        fourButton.positionBelowItem(oneButton, offset: 20)
        fiveButton.positionBelowItem(oneButton, offset: 20)
        sixButton.positionBelowItem(oneButton, offset: 20)
        
        sevenButton.positionBelowItem(fourButton, offset: 20)
        eightButton.positionBelowItem(fourButton, offset: 20)
        nineButton.positionBelowItem(fourButton, offset: 20)
        
        zeroButton.positionBelowItem(sevenButton, offset: 20)
        
        
        twoButton.centerHorizontallyInSuperview()
        fiveButton.centerHorizontallyInSuperview()
        eightButton.centerHorizontallyInSuperview()
        zeroButton.centerHorizontallyInSuperview()
        
        oneButton.positionToTheLeftOfItem(twoButton, offset: 20)
        threeButton.positionToTheRightOfItem(twoButton, offset: 20)
        
        fourButton.positionToTheLeftOfItem(fiveButton, offset: 20)
        sixButton.positionToTheRightOfItem(fiveButton, offset: 20)
        
        sevenButton.positionToTheLeftOfItem(eightButton, offset: 20)
        nineButton.positionToTheRightOfItem(eightButton, offset: 20)

    }
    
    func fillCorrectPin() {
        if (pinString.length == 1) {
            pinUnfilledimageView.addSubview(pinFilledimageView)
            pinFilledimageView.pinToEdgesOfSuperview()
        }
        else if (pinString.length == 2) {
            pinUnfilled3imageView.addSubview(pinFilled3imageView)
            pinFilled3imageView.pinToEdgesOfSuperview()
        }
        else if (pinString.length == 3) {
            pinUnfilled2imageView.addSubview(pinFilled2imageView)
            pinFilled2imageView.pinToEdgesOfSuperview()
        }
        else {
            pinUnfilled4imageView.addSubview(pinFilled4imageView)
            pinFilled4imageView.pinToEdgesOfSuperview()
            
            if let user = PFUser.currentUser() {
                user["pin"] = pinString
            }
            PFUser.currentUser()?.saveInBackground()
            if (PFUser.currentUser()?.objectForKey("pin") != nil) {
                if let isMentor = PFUser.currentUser()?.objectForKey("isMentor") {
                    if (isMentor as! Bool == true) {
                        // is Mentor
                        self.navigationController?.pushViewController(MessagesViewController(), animated: true)
                    }
                }
                else {
                    // is Mentee
                    // TODO: if messages exist, direct push to MessagesViewController.
                    self.navigationController?.pushViewController(MenteeGuideViewController(), animated: true)
                }
            }
        }
    }
    
    func onePressed() {
        if (pinString.length < 4) {
            pinString.appendString("1")
            fillCorrectPin()
        }
    }
    
    func twoPressed() {
        if (pinString.length < 4) {
            pinString.appendString("2")
            fillCorrectPin()
        }
    }
    
    func threePressed() {
        if (pinString.length < 4) {
            pinString.appendString("3")
            fillCorrectPin()
        }
    }
    
    func fourPressed() {
        if (pinString.length < 4) {
            pinString.appendString("4")
            fillCorrectPin()
        }
    }
    
    func fivePressed() {
        if (pinString.length < 4) {
            pinString.appendString("5")
            fillCorrectPin()
        }
    }
    
    func sixPressed() {
        if (pinString.length < 4) {
            pinString.appendString("6")
            fillCorrectPin()
        }
    }
    
    func sevenPressed() {
        if (pinString.length < 4) {
            pinString.appendString("7")
            fillCorrectPin()
        }
    }
    
    func eightPressed() {
        if (pinString.length < 4) {
            pinString.appendString("8")
            fillCorrectPin()
        }
    }
    
    func ninePressed() {
        if (pinString.length < 4) {
            pinString.appendString("9")
            fillCorrectPin()
        }
    }
    
    func zeroPressed() {
        if (pinString.length < 4) {
            pinString.appendString("0")
            fillCorrectPin()
        }
    }

}
