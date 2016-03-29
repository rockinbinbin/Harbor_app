//
//  MainViewViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

let teal = UIColor(red:0.02, green:0.9, blue:0.81, alpha:1.0)

// if you don't have a mentor chat yet, here is a TableViewController of mentors to choose from

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ParseManagerFetchMentorsDelegate {
    
    var mentors : NSArray?
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBarHidden = false
        setNavBar()
        
        tableView.pinToTopEdgeOfSuperview(offset: 20)
        tableView.pinToLeftEdgeOfSuperview()
        tableView.pinToRightEdgeOfSuperview()
        tableView.sizeToHeight(self.view.frame.size.height / 1.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        ParseManager1.getInstance().fetchMentorsdelegate = self
        ParseManager1.getInstance().fetchMentors()
        
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.translucent = false
        let logo = UIImage(named: "navBarLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.barTintColor = teal
    }

    // MARK: - Tableview Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let mentors = mentors {
            return mentors.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "mentorCell"
        var cell: MentorTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? MentorTableViewCell
        
        //cell?.layoutSubviews()
        
        if cell == nil {
            cell = MentorTableViewCell()
            cell?.selectionStyle = .None
        }
        
        if let mentors = mentors {
        if (indexPath.row < mentors.count) {
            
            let mentor = mentors[indexPath.row] as! PFObject
            
            cell?.titleLabel.text = mentor.objectForKey("Username") as? String
            cell?.detail.text = mentor.objectForKey("shortDescription") as? String
        }
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    func didFetchMentorsWithObjects(objects: [AnyObject]!) {
        mentors = NSArray()
        mentors = objects
        tableView.reloadData()
    }
    
}
