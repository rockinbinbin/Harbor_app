//
//  MessagesViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

// whether mentor or mentee, should show tableView of all ongoing conversations.

class MessagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setNavBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.translucent = false
        let logo = UIImage(named: "navBarLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.barTintColor = teal
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: - Tableview Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "messageCell"
        var cell: MessageTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? MessageTableViewCell

        if cell == nil {
            cell = MessageTableViewCell()
            cell?.selectionStyle = .None
        }
        
        if (indexPath.row == 0) {
            cell?.imgView.image = UIImage(named: "wallet")
            
            let attrString = NSMutableAttributedString(string: "PAYMENT METHOD")
            attrString.addAttribute(NSKernAttributeName, value: 2, range: NSMakeRange(0, attrString.length))
            attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "Lato-Regular", size: 13)!, range: NSMakeRange(0, attrString.length))
            
            cell!.titleLabel.attributedText = attrString
            
            let attrString2 = NSMutableAttributedString(string: "APPLE PAY")
            attrString2.addAttribute(NSKernAttributeName, value: 2, range: NSMakeRange(0, attrString2.length))
            attrString2.addAttribute(NSFontAttributeName, value: UIFont(name: "Lato-Regular", size: 13)!, range: NSMakeRange(0, attrString2.length))
            
            cell!.detail.attributedText = attrString2
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }

}