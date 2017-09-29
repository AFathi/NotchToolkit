//
//  NotchBar.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit
public class NotchBar: UIView {
    /**
     This allows you to choose between statusBar & noStatusBar modes.
     */
    public var mode:notchMode = .statusBar
    /**
     This allows you to set the height of the NotchBar.
     */
    public var height:CGFloat = 250
    /**
     This allows you to set the background color of the NotchBar.
     */
    public var bgColor:UIColor = .black
    /**
     This allows you to set the corner radii of the NotchBar.
     */
    public var curve:CGFloat = 35
    /**
     This allows you to initially set the NotchBar visibility.
     */
    public var isVisible:Bool = false
    /**
     This allows you to set the animation show/hide & rotation animation time interval of the NotchBar.
     */
    public var animationInterval:TimeInterval = 0.3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        create()
    }
    
    var scale:CGFloat!
    var multiplier:CGFloat!
    func create() {
        switch mode {
        case .statusBar:
            scale = UIScreen.main.portraitNotch.width
            multiplier = UIScreen.main.multiplier
        case .noStatusBar:
            scale = UIScreen.main.widePortraitNotch.width
            multiplier = UIScreen.main.multiplierWide
        }
        self.bounds = CGRect(x: 0, y: 0, width: scale, height: height)
        self.center = CGPoint(x: UIScreen.main.portraitNotch.origin.x, y: (self.bounds.height/2))
        self.backgroundColor = bgColor
        self.addOvalOrCorner(type: .corner, position: .bottom, curve: curve)
        self.layer.masksToBounds = true
        self.alpha = isVisible ? 1 : 0
    }
    
    /**
     This function is used to resize the NotchBar when device orientation is changed.
     */
    public func refresh(orientation:deviceOrientation) {
        let subtrehend = isVisible ? 0 : self.bounds.height
        
        switch mode {
        case .statusBar:
            scale = UIScreen.main.portraitNotch.width
            multiplier = UIScreen.main.multiplier
        case .noStatusBar:
            scale = UIScreen.main.widePortraitNotch.width
            multiplier = UIScreen.main.multiplierWide
        }
        
        switch orientation {
        case .portrait:
            UIView.animate(withDuration: animationInterval, animations: {
                self.bounds = CGRect(x: 0, y: 0, width: self.scale, height: self.height)
                self.center = CGPoint(x: UIScreen.main.portraitNotch.origin.x, y: (self.bounds.height/2) - subtrehend)
                self.backgroundColor = self.bgColor
                self.addOvalOrCorner(type: .corner, position: .bottom, curve: self.curve)
                self.alpha = self.isVisible ? 1 : 0
            })
        case .landscapeLeft:
            UIView.animate(withDuration: animationInterval, animations: {
                self.bounds = CGRect(x: 0, y: 0, width: self.height, height: self.scale)
                self.center = CGPoint(x: (self.bounds.height*(self.multiplier*self.height)) - subtrehend, y: UIScreen.main.landscapeLeftNotch.origin.y)
                self.backgroundColor = self.bgColor
                self.addOvalOrCorner(type: .corner, position: .right, curve: self.curve)
                self.alpha = self.isVisible ? 1 : 0
            })
        case .landscapeRight:
            UIView.animate(withDuration: animationInterval, animations: {
                self.bounds = CGRect(x: 0, y: 0, width: self.height, height: self.scale)
                self.center = CGPoint(x: (UIScreen.main.bounds.width-self.bounds.height*(self.multiplier*self.height)) + subtrehend, y: UIScreen.main.landscapeRightNotch.origin.y)
                self.backgroundColor = self.bgColor
                self.addOvalOrCorner(type: .corner, position: .left, curve: self.curve)
                self.alpha = self.isVisible ? 1 : 0
            })
        }
    }

}
