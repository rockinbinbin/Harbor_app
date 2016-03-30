//
//  MessageTableViewCell.swift
//  Harbor
//
//  Created by Robin Mehta on 3/29/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    internal lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = .Center
        titleLabel.lineBreakMode = .ByWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.font = titleLabel.font.fontWithSize(24)
        self.contentView.addSubview(titleLabel)
        return titleLabel
    }()
    
    internal lazy var detail: UILabel = {
        let detail = UILabel()
        detail.textColor = UIColor.grayColor()
        detail.textAlignment = .Center
        detail.lineBreakMode = .ByWordWrapping
        detail.numberOfLines = 0
        detail.font = detail.font.fontWithSize(16)
        self.contentView.addSubview(detail)
        return detail
    }()
    
    var imgView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutViews()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func layoutViews() {
        self.contentView.addSubview(imgView)
        
        imgView.pinToLeftEdgeOfSuperview(offset: 10)
        imgView.centerVerticallyInSuperview()
        imgView.sizeToWidth(50)
        imgView.sizeToHeight(50)
        imgView.contentMode = .ScaleAspectFill
        
        titleLabel.positionToTheRightOfItem(imgView, offset: 10)
        titleLabel.pinToTopEdgeOfSuperview(offset: 20)
        
        detail.positionToTheRightOfItem(imgView, offset: 10)
        detail.positionBelowItem(titleLabel, offset: 10)
        
    }
    
    public func useImage(image: UIImage) {
        imgView.image = image
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
