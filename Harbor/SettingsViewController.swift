//
//  SettingsViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/30/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    internal lazy var logoutButton: UIButton = {
        let logoutButton = UIButton(type: .RoundedRect)
        logoutButton.layer.cornerRadius = 0
        logoutButton.backgroundColor = UIColor.whiteColor()
        logoutButton.layer.borderWidth = 0
        logoutButton.layer.borderColor = UIColor.whiteColor().CGColor
        logoutButton.tintColor = blueColor
        logoutButton.titleLabel?.font = logoutButton.titleLabel?.font.fontWithSize(20)

        logoutButton.setTitle("Log Out", forState: .Normal)
        self.view.addSubview(logoutButton)
        logoutButton.addTarget(self, action: Selector("logoutPressed"), forControlEvents: .TouchUpInside)
        return logoutButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setNavBar()
        
        logoutButton.centerInSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.barTintColor = teal;
        self.navigationController?.navigationBar.translucent = false;
        self.navigationController?.navigationBar.hidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let navLabel = UILabel()
        navLabel.textColor = UIColor.whiteColor()
        navLabel.backgroundColor = UIColor.clearColor()
        navLabel.textAlignment = .Center
        navLabel.font = UIFont(name: "AvenirNext-Medium", size: 21)
        self.navigationItem.titleView = navLabel
        navLabel.text = "Settings"
        navLabel.sizeToFit()
        
        let barButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("donePressed"))
    }

    func donePressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logoutPressed() {
        PFUser.logOut()
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
