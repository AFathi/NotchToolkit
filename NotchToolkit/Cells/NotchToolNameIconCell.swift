//
//  NotchToolNameIconCell.swift
//  NotchToolkit
//
//  Created by Ahmed Bekhit on 9/28/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

class NotchToolNameIconCell: UICollectionViewCell {
    private var toolIcon : UIImageView?
    private var toolTitle : UILabel?
    
    func set(_ image:UIImage? = nil, text:String? = nil, font:UIFont? = nil, color:UIColor? = nil, type: toolIconTypes) {
        var titleFrame:CGRect!
        var iconFrame:CGRect!
        
        var isTitleHidden:Bool!
        var isIconHidden:Bool!
        
        switch type {
        case .image:
            titleFrame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
            iconFrame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
            isTitleHidden = true
            isIconHidden = false
        case .text:
            titleFrame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
            iconFrame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
            isTitleHidden = false
            isIconHidden = true
        case .both:
            titleFrame = CGRect(x: 0, y: contentView.frame.height*0.75, width: contentView.frame.width, height: contentView.frame.height*0.25)
            iconFrame = CGRect(x: 0, y:0, width: contentView.frame.width, height: contentView.frame.height*0.75)
            isTitleHidden = false
            isIconHidden = false
        }
        
        if toolTitle == nil {
            toolTitle = UILabel()
            toolTitle?.frame = titleFrame
            if let font = font {
                toolTitle?.font = font
            }
            if let color = color {
                toolTitle?.textColor = color
            }
            toolTitle?.textAlignment = .center
            contentView.addSubview(toolTitle!)
        }
        
        if toolIcon == nil {
            toolIcon = UIImageView()
            toolIcon?.frame = iconFrame
            toolIcon?.contentMode = .scaleAspectFit
            contentView.addSubview(toolIcon!)
        }
        if let title = toolTitle {
            if let txt = text {
                title.text = txt
            }
            title.isHidden = isTitleHidden
        }
        if let icon = toolIcon {
            if let img = image {
                icon.image = img
            }
            icon.isHidden = isIconHidden
        }
    }
}
