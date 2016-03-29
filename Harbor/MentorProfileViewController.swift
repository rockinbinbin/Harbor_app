//
//  MentorProfileViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class MentorProfileViewController: UIViewController {
    
    var mentor : PFObject?
    
    internal lazy var startChat: UIButton = {
        let startChatGo = UIButton(type: .RoundedRect)
        startChatGo.layer.cornerRadius = 0
        startChatGo.backgroundColor = UIColor.whiteColor()
        startChatGo.layer.borderWidth = 0
        startChatGo.layer.borderColor = UIColor.whiteColor().CGColor
        startChatGo.tintColor = blueColor
        startChatGo.titleLabel?.font = startChatGo.titleLabel?.font.fontWithSize(20)
        
        let attrString = NSMutableAttributedString(string: "START CHAT")
        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
//        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!, range: NSMakeRange(0, attrString.length))
        startChatGo.setAttributedTitle(attrString, forState: .Normal)
        self.view.addSubview(startChatGo)
        startChatGo.addTarget(self, action: Selector("startChatPressed"), forControlEvents: .TouchUpInside)
        return startChatGo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        startChat.centerInSuperview()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startChatPressed() {
        // navigate to chat view
        self.navigationController?.pushViewController(HomepointChat(), animated: true)
    }
}
