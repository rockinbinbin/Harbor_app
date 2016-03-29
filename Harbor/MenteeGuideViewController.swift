//
//  MenteeGuideViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class MenteeGuideViewController: UIViewController {
    
    private lazy var welcomeLabel: UILabel = {
        let alreadyHaveAccountLabel = UILabel()
        alreadyHaveAccountLabel.numberOfLines = 0
        alreadyHaveAccountLabel.textColor = UIColor.blackColor()
        alreadyHaveAccountLabel.font = alreadyHaveAccountLabel.font.fontWithSize(18)
        let attrString = NSMutableAttributedString(string: "Harbor is a community designed to answer your questions about sexual health 💛")
//        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 18)!, range: NSMakeRange(0, attrString.length))
        alreadyHaveAccountLabel.attributedText = attrString
        alreadyHaveAccountLabel.textAlignment = .Center
        self.view.addSubview(alreadyHaveAccountLabel)
        return alreadyHaveAccountLabel
    }()
    
    internal lazy var letsGo: UIButton = {
        let letsGo = UIButton(type: .RoundedRect)
        letsGo.layer.cornerRadius = 0
        letsGo.backgroundColor = UIColor.whiteColor()
        letsGo.layer.borderWidth = 0
        letsGo.layer.borderColor = UIColor.whiteColor().CGColor
        letsGo.tintColor = blueColor
        letsGo.titleLabel?.font = letsGo.titleLabel?.font.fontWithSize(20)
        
        let attrString = NSMutableAttributedString(string: "Continue to talk to a mentor →")
        //        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!, range: NSMakeRange(0, attrString.length))
        letsGo.setAttributedTitle(attrString, forState: .Normal)
        self.view.addSubview(letsGo)
        letsGo.addTarget(self, action: Selector("continuePressed"), forControlEvents: .TouchUpInside)
        return letsGo
    }()
    
    private lazy var mentorLabel: UILabel = {
        let mentorLabel = UILabel()
        mentorLabel.numberOfLines = 0
        mentorLabel.textColor = UIColor.blackColor()
        mentorLabel.font = mentorLabel.font.fontWithSize(18)
        let attrString = NSMutableAttributedString(string: "Interested in giving advice instead? Apply here!")
        //        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 18)!, range: NSMakeRange(0, attrString.length))
        mentorLabel.attributedText = attrString
        mentorLabel.textAlignment = .Center
        self.view.addSubview(mentorLabel)
        return mentorLabel
    }()
    
    internal lazy var linkButton: UIButton = {
        let letsGo = UIButton(type: .RoundedRect)
        letsGo.layer.cornerRadius = 0
        letsGo.backgroundColor = UIColor.whiteColor()
        letsGo.layer.borderWidth = 0
        letsGo.layer.borderColor = UIColor.whiteColor().CGColor
        letsGo.tintColor = UIColor.blueColor()
        letsGo.titleLabel?.font = letsGo.titleLabel?.font.fontWithSize(20)
        
        let attrString = NSMutableAttributedString(string: "google.com")
        //        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!, range: NSMakeRange(0, attrString.length))
        letsGo.setAttributedTitle(attrString, forState: .Normal)
        self.view.addSubview(letsGo)
        letsGo.addTarget(self, action: Selector("linkPressed"), forControlEvents: .TouchUpInside)
        return letsGo
    }()
    
    private lazy var logoimageView: UIImageView = {
        let logoimageView = UIImageView(image: UIImage(named: "seahorse-chat"))
        self.view.addSubview(logoimageView)
        return logoimageView
    }()
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBarHidden = true
        welcomeLabel.centerHorizontallyInSuperview()
        welcomeLabel.pinToTopEdgeOfSuperview(offset: 50)
        welcomeLabel.sizeToWidth(self.view.frame.size.width - 50)
        
        logoimageView.positionBelowItem(welcomeLabel, offset: 20)
        logoimageView.centerHorizontallyInSuperview()
        
        letsGo.positionBelowItem(logoimageView, offset: 30)
        letsGo.centerHorizontallyInSuperview()
        
        mentorLabel.positionBelowItem(letsGo, offset: 20)
        mentorLabel.centerHorizontallyInSuperview()
        mentorLabel.sizeToWidth(self.view.frame.size.width - 50)
        
        linkButton.positionBelowItem(mentorLabel, offset: 20)
        linkButton.centerHorizontallyInSuperview()
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
}
