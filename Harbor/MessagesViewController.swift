//
//  MessagesViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

// whether mentor or mentee, should show tableView of all ongoing conversations.

class MessagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ParseManagerLoadMessagesDelegate {
    
    public var messages : [PFObject]?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollEnabled = false
        tableView.hidden = false
        tableView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(tableView)
        return tableView
    }()
    
    internal lazy var findNewMentors: UIButton = {
        let findNewMentors = UIButton(type: .RoundedRect)
        findNewMentors.layer.cornerRadius = 20
        findNewMentors.backgroundColor = teal
        findNewMentors.layer.borderWidth = 0
        findNewMentors.layer.borderColor = UIColor.whiteColor().CGColor
        findNewMentors.tintColor = UIColor.whiteColor()
        findNewMentors.titleLabel?.font = findNewMentors.titleLabel?.font.fontWithSize(18)
        
        let attrString = NSMutableAttributedString(string: "Find New Mentors")
        
        findNewMentors.setAttributedTitle(attrString, forState: .Normal)
        self.view.addSubview(findNewMentors)
        findNewMentors.addTarget(self, action: Selector("findNewMentorsPressed"), forControlEvents: .TouchUpInside)
        return findNewMentors
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setNavBar()
        
        tableView.pinToTopEdgeOfSuperview()
        tableView.pinToLeftEdgeOfSuperview()
        tableView.pinToRightEdgeOfSuperview()
        tableView.sizeToHeight(400)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (messages == nil) {
            ParseManager1.getInstance().loadMessagesDelegate = self
            
            if let isMentor = PFUser.currentUser()?.objectForKey("isMentor") {
                if (isMentor as! Bool == true) {
                    // is Mentor
                    ParseManager1.getInstance().loadMessagesForMentor()
                }
                else {
                    // is Mentee
                    ParseManager1.getInstance().loadMessages()
                }
            }
            else {
                // is Mentee
                ParseManager1.getInstance().loadMessages()
            }
        }
        
        if let isMentor = PFUser.currentUser()?.objectForKey("isMentor") {
            if (isMentor as! Bool == false) {
                // is Mentee                
                findNewMentors.pinToBottomEdgeOfSuperview(offset: 20)
                findNewMentors.centerHorizontallyInSuperview()
                findNewMentors.sizeToWidth(300)
                findNewMentors.sizeToHeight(50)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavBar() {
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
        let logo = UIImage(named: "navBarLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.barTintColor = teal
        self.navigationItem.hidesBackButton = true

        let barButton = UIBarButtonItem(image: UIImage(named: "settings"), style: UIBarButtonItemStyle.Plain, target: self, action: Selector("settingsClicked"))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    // MARK: - Tableview Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let messages = messages {
            return messages.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
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
        
        if let messages = messages {
            if (indexPath.row < messages.count) {
                
                let message = messages[indexPath.row] as PFObject
                
                cell?.detail.text = message.objectForKey("lastMessage") as? String
                
                if (Utility.getInstance().checkReachabilityAndDisplayErrorMessage()) {
                    
                    var mentorOrMenteeString = "mentor"
                    if let isMentor = PFUser.currentUser()?.objectForKey("isMentor") {
                        if (isMentor as! Bool == true) {
                            // is Mentor
                            // Want to find the person you are talking to... so it's the opposite
                            mentorOrMenteeString = "user"
                        }
                        else {
                            // is Mentee
                            mentorOrMenteeString = "mentor"
                        }
                    }
                    else {
                        // is Mentee
                        mentorOrMenteeString = "mentor"
                    }
                    
                    message.objectForKey(mentorOrMenteeString)?.fetchInBackgroundWithBlock({ (object: PFObject?, error: NSError?) -> Void in
                        cell?.titleLabel.text = object?.objectForKey("username") as? String
                        
                        // fetch image
                        if let imgObj = object?.objectForKey("thumbnail") {
                            let file : PFFile = (imgObj as? PFFile)!
                            
                            file.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
                                if (data != nil) {
                                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                                        let img : UIImage = UIImage(data: data!)!
                                        cell?.useImage(img)
                                    })
                                }
                            })
                        }
                        
                    })
                }
            }
        }
     
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let message = messages![indexPath.row] as PFObject
        
        let chatVC = HomepointChat()
        chatVC.groupId = message.objectId
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    func didloadMessagesWithObjects(objects: [AnyObject]!) {
        messages = objects as? [PFObject]
        tableView.reloadData()
    }
    
    func findNewMentorsPressed() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }

    func settingsClicked() {
        self.presentViewController(SettingsViewController(), animated: true, completion: nil)
    }
}