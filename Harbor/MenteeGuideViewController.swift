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
        
        logoimageView.positionBelowItem(welcomeLabel, offset: 20)
        logoimageView.centerHorizontallyInSuperview()
    }
}
