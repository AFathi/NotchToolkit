//
//  UIScreen+NotchFrame.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

public extension UIScreen {
    private func setNotchFrame(orientation:deviceOrientation, mode:notchMode) -> CGRect {
        var notchScale: CGFloat {
            switch mode {
            case .statusBar:
                if self.bounds.size.width > self.bounds.size.height {
                    return self.bounds.size.height/1.8
                }else{
                    return self.bounds.size.width/1.8
                }
            case .noStatusBar:
                if self.bounds.size.width > self.bounds.size.height {
                    return self.bounds.size.height/1.5
                }else{
                    return self.bounds.size.width/1.5
                }
            }
        }
        
        switch orientation {
        case .portrait:
            return CGRect(x: self.bounds.width/2, y: 0, width: notchScale, height: 0)
        case .landscapeLeft:
            return CGRect(x: 0, y: self.bounds.height/2, width: 0, height: notchScale)
        case .landscapeRight:
            return CGRect(x: 0, y: self.bounds.height/2, width: 0, height: notchScale)
        }
    }
    
    /**
     `portraitNotch` is a rectangle that returns the notch frame when **deviceOrientation** is `portrait`.
     */
    public var portraitNotch: CGRect {
        return setNotchFrame(orientation: .portrait, mode: .statusBar)
    }
    /**
     `landscapeLeftNotch` is a rectangle that returns the notch frame when **deviceOrientation** is `landscapeLeft`.
     */
    public var landscapeLeftNotch: CGRect {
        return setNotchFrame(orientation: .landscapeLeft, mode: .statusBar)
    }
    /**
     `landscapeRightNotch` is a rectangle that returns the notch frame when **deviceOrientation** is `landscapeRight`.
     */
    public var landscapeRightNotch: CGRect {
        return setNotchFrame(orientation: .landscapeRight, mode: .statusBar)
    }
    
    //Wider frame for .noStatusBar mode
    /**
     `widePortraitNotch` is a rectangle that returns a wider notch frame when **deviceOrientation** is `portrait`.
     */
    public var widePortraitNotch: CGRect {
        return setNotchFrame(orientation: .portrait, mode: .noStatusBar)
    }
    /**
     `wideLandscapeLeftNotch` is a rectangle that returns a wider notch frame when **deviceOrientation** is `landscapeLeft`.
     */
    public var wideLandscapeLeftNotch: CGRect {
        return setNotchFrame(orientation: .landscapeLeft, mode: .noStatusBar)
    }
    /**
     `wideLandscapeRightNotch` is a rectangle that returns a wider notch frame when **deviceOrientation** is `landscapeRight`.
     */
    public var wideLandscapeRightNotch: CGRect {
        return setNotchFrame(orientation: .landscapeRight, mode: .noStatusBar)
    }

}
