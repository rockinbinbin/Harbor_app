//
//  MentorTableViewCell.swift
//  Harbor
//
//  Created by Robin Mehta on 3/28/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class MentorCollectionViewCell: UICollectionViewCell {
    
    internal lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = .Left
        titleLabel.lineBreakMode = .ByWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
        self.contentView.addSubview(titleLabel)
        return titleLabel
    }()
    
    internal lazy var detail: UILabel = {
        let detail = UILabel()
        detail.textColor = UIColor.grayColor()
        detail.textAlignment = .Left
        detail.lineBreakMode = .ByWordWrapping
        detail.numberOfLines = 0
        detail.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        self.contentView.addSubview(detail)
        return detail
    }()
    
    func layoutViews() {
        titleLabel.pinToLeftEdgeOfSuperview(offset: 20)
        titleLabel.pinToTopEdgeOfSuperview(offset: 20)
        
        detail.positionBelowItem(titleLabel, offset: 20)
        detail.pinToLeftEdgeOfSuperview(offset: 20)
        detail.sizeToWidth(self.contentView.frame.size.width - 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add border
        let newView = UIView()
        newView.backgroundColor = UIColor.clearColor()
        newView.layer.borderColor = teal.CGColor
        newView.layer.borderWidth = 3
        newView.layer.cornerRadius = 3
        self.contentView.addSubview(newView)
        newView.sizeToWidth(self.contentView.frame.size.width)
        newView.sizeToHeight(self.contentView.frame.size.height)
        newView.centerInSuperview()
        
        layoutViews()
    }

}
