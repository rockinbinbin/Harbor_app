//
//  MenteeGuideViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

let darkerSeaGreen = UIColor(red:0.0, green:0.69, blue:0.62, alpha:1.0)

class MenteeGuideViewController: UIViewController {
    
    private lazy var welcomeLabel: UILabel = {
        let alreadyHaveAccountLabel = UILabel()
        alreadyHaveAccountLabel.numberOfLines = 0
        alreadyHaveAccountLabel.textColor = UIColor.whiteColor()
        alreadyHaveAccountLabel.font = alreadyHaveAccountLabel.font.fontWithSize(18)
        let attrString = NSMutableAttributedString(string: "Harbor is a community designed to answer your questions about sexual health 💛")
//        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 18)!, range: NSMakeRange(0, attrString.length))
        alreadyHaveAccountLabel.attributedText = attrString
        alreadyHaveAccountLabel.textAlignment = .Center
        self.view.addSubview(alreadyHaveAccountLabel)
        return alreadyHaveAccountLabel
    }()
    
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
    
    internal lazy var letsGo: UIButton = {
        let letsGo = UIButton(type: .RoundedRect)
        letsGo.layer.cornerRadius = 20
        letsGo.backgroundColor = darkerSeaGreen
        letsGo.layer.borderWidth = 0
        letsGo.layer.borderColor = UIColor.whiteColor().CGColor
        letsGo.tintColor = UIColor.whiteColor()
        letsGo.titleLabel?.font = letsGo.titleLabel?.font.fontWithSize(18)
        
        let attrString = NSMutableAttributedString(string: "Continue to talk to a mentor →")

        letsGo.setAttributedTitle(attrString, forState: .Normal)
        self.view.addSubview(letsGo)
        letsGo.addTarget(self, action: Selector("continuePressed"), forControlEvents: .TouchUpInside)
        return letsGo
    }()
    
    internal lazy var iAppliedButton: UIButton = {
        let iAppliedButton = UIButton(type: .RoundedRect)
        iAppliedButton.layer.cornerRadius = 20
        iAppliedButton.backgroundColor = darkerSeaGreen
        iAppliedButton.layer.borderWidth = 0
        iAppliedButton.layer.borderColor = UIColor.whiteColor().CGColor
        iAppliedButton.tintColor = UIColor.whiteColor()
        iAppliedButton.titleLabel?.font = iAppliedButton.titleLabel?.font.fontWithSize(18)
        
        let attrString = NSMutableAttributedString(string: "I submitted my mentor application")
        
        iAppliedButton.setAttributedTitle(attrString, forState: .Normal)
        self.view.addSubview(iAppliedButton)
        iAppliedButton.addTarget(self, action: Selector("iAppliedPressed"), forControlEvents: .TouchUpInside)
        return iAppliedButton
    }()
    
    private lazy var mentorLabel: UILabel = {
        let mentorLabel = UILabel()
        mentorLabel.numberOfLines = 0
        mentorLabel.textColor = UIColor.whiteColor()
        mentorLabel.font = mentorLabel.font.fontWithSize(18)
        let attrString = NSMutableAttributedString(string: "Interested in giving advice instead?")

        mentorLabel.attributedText = attrString
        mentorLabel.textAlignment = .Center
        self.view.addSubview(mentorLabel)
        return mentorLabel
    }()
    
    internal lazy var linkButton: UIButton = {
        let letsGo = UIButton(type: .RoundedRect)
        letsGo.layer.cornerRadius = 0
        letsGo.backgroundColor = UIColor.clearColor()
        letsGo.layer.borderWidth = 0
        letsGo.layer.borderColor = UIColor.whiteColor().CGColor
        letsGo.tintColor = UIColor.whiteColor()
        letsGo.titleLabel?.font = letsGo.titleLabel?.font.fontWithSize(18)
        
        let attrString = NSMutableAttributedString(string: "Apply Here")
        letsGo.setAttributedTitle(attrString, forState: .Normal)
        self.view.addSubview(letsGo)
        letsGo.addTarget(self, action: Selector("linkPressed"), forControlEvents: .TouchUpInside)
        return letsGo
    }()
    
    private lazy var logoimageView: UIImageView = {
        let logoimageView = UIImageView(image: UIImage(named: "chat-img"))
        self.view.addSubview(logoimageView)
        return logoimageView
    }()
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        newView.pinToEdgesOfSuperview()
        
        self.navigationController?.navigationBarHidden = true
        welcomeLabel.centerHorizontallyInSuperview()
        welcomeLabel.pinToTopEdgeOfSuperview(offset: 50)
        welcomeLabel.sizeToWidth(self.view.frame.size.width - 50)
        
        logoimageView.positionBelowItem(welcomeLabel, offset: 20)
        logoimageView.centerHorizontallyInSuperview()
        
        letsGo.positionBelowItem(logoimageView, offset: 10)
        letsGo.centerHorizontallyInSuperview()
        letsGo.sizeToWidth(self.view.frame.size.width - 60)
        letsGo.sizeToHeight(70)
        
        linkButton.pinToBottomEdgeOfSuperview(offset: 40)
        linkButton.centerHorizontallyInSuperview()
        
        mentorLabel.positionAboveItem(linkButton, offset: 5)
        mentorLabel.centerHorizontallyInSuperview()
        mentorLabel.sizeToWidth(self.view.frame.size.width - 50)
        
    }
    
    override internal func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
        
    }
    
    func continuePressed() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    func linkPressed() {
        self.navigationController?.pushViewController(WebViewController(), animated: true)
    }
    
    func iAppliedPressed() {
        // navigate to new view with "application is being processed" text, with a logout button.
    }
}
