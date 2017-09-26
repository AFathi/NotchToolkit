//
//  NotchToolCell.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/25/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

public class NotchToolCell: UICollectionViewCell {
    private var toolIcon : UIImageView?
    private var toolTitle : UILabel?
    
    func setIcon(_ image:UIImage?) {
        if toolIcon == nil {
            toolIcon = UIImageView()
            toolIcon?.frame = CGRect(x: 0, y:0, width: contentView.frame.width, height: contentView.frame.height)
            toolIcon?.contentMode = .scaleAspectFit
            contentView.addSubview(toolIcon!)
        }
        
        if let icon = toolIcon {
            if let img = image {
                icon.image = img
            }
            icon.isHidden = false
        }
        if let title = toolTitle {
            title.isHidden = true
        }
    }
    
    func setTitle(_ text:String, font:UIFont, color:UIColor) {
        if toolTitle == nil {
            toolTitle = UILabel()
            toolTitle?.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
            toolTitle?.font = font
            toolTitle?.textColor = color
            toolTitle?.textAlignment = .center
            contentView.addSubview(toolTitle!)
        }
        
        if let title = toolTitle {
            title.text = text
            title.isHidden = false
        }
        
        if let icon = toolIcon {
            icon.isHidden = true
        }
    }
}
