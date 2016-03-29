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

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ParseManagerFetchMentorsDelegate {
    
    var mentors : NSArray?
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.textColor = UIColor.darkGrayColor()
        welcomeLabel.font = welcomeLabel.font.fontWithSize(24)
        
        let attrString = NSMutableAttributedString(string: "Looking for Mentors?")
        //attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Light", size: 24)!, range: NSMakeRange(0, attrString.length))
//        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
        welcomeLabel.attributedText = attrString
        welcomeLabel.textAlignment = .Center
        
        self.view.addSubview(welcomeLabel)
        return welcomeLabel
    }()
    
    private lazy var chooseMentorLabel: UILabel = {
        let chooseMentorLabel = UILabel()
        chooseMentorLabel.textColor = UIColor.darkGrayColor()
        chooseMentorLabel.numberOfLines = 0
        chooseMentorLabel.font = chooseMentorLabel.font.fontWithSize(15)
        
        let attrString = NSMutableAttributedString(string: "Our mentors are here to help! Choose someone to get started. 😊💃")
        //attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Light", size: 15)!, range: NSMakeRange(0, attrString.length))
        //        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
        chooseMentorLabel.attributedText = attrString
        chooseMentorLabel.textAlignment = .Center
        
        self.view.addSubview(chooseMentorLabel)
        return chooseMentorLabel
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2-10, height: 250)
        
        // Data source; delegate
        let collectionView: UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        
        collectionView.dataSource  = self
        collectionView.delegate = self
        
        self.view.addSubview(collectionView)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBarHidden = false
        setNavBar()
        
        welcomeLabel.centerHorizontallyInSuperview()
        welcomeLabel.pinToTopEdgeOfSuperview(offset: 20)
        
        chooseMentorLabel.centerHorizontallyInSuperview()
        chooseMentorLabel.positionBelowItem(welcomeLabel, offset: 15)
        chooseMentorLabel.sizeToWidth(self.view.frame.size.width - 50)
        
        collectionView.positionBelowItem(chooseMentorLabel, offset: 20)
        collectionView.pinToLeftEdgeOfSuperview()
        collectionView.pinToRightEdgeOfSuperview()
        collectionView.sizeToHeight(self.view.frame.size.height / 1.5)
        
        collectionView.registerClass(MentorCollectionViewCell.self, forCellWithReuseIdentifier: "mentorCell")
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
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: - CollectionView Datasource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let mentors = mentors {
            return mentors.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellId = "mentorCell"
        let cell : MentorCollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as? MentorCollectionViewCell
        
        if let mentors = mentors {
            if (indexPath.row < mentors.count) {
                
                let mentor = mentors[indexPath.row] as! PFObject
                
                cell?.titleLabel.text = mentor.objectForKey("Username") as? String
                cell?.detail.text = mentor.objectForKey("tags") as? String
                
                if let imgObj = mentor.objectForKey("picture") {
                    let file : PFFile = (imgObj as? PFFile)!
                    
                    file.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
                        if (data != nil) {
                            UIView.animateWithDuration(0.3, animations: { () -> Void in
                                let img : UIImage = UIImage(data: data!)!
                                cell?.image.image = img
                            })
                        }
                    })
                }
            }
        }
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row < mentors?.count) {
            let vc = MentorProfileViewController()
            vc.mentor = mentors?.objectAtIndex(indexPath.row) as? PFObject
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func didFetchMentorsWithObjects(objects: [AnyObject]!) {
        mentors = NSArray()
        mentors = objects
        collectionView.reloadData()
    }
    
}
