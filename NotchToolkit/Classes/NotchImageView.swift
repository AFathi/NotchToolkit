//
//  NotchImageView.swift
//  NotchToolkit
//
//  Created by Ahmed Bekhit on 11/1/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

/**
 *NotchToolkit* is a framework for iOS that allow developers use the iPhones X notch space in creative ways.
 
 - Author: Ahmed Fathi Bekhit
 * [Github](http://github.com/AFathi)
 * [Website](http://ahmedbekhit.com)
 * [Twitter](http://twitter.com/iAFapps)
 * [Email](mailto:me@ahmedbekhit.com)
 */
public class NotchImageView: NotchBar {
    // MARK: - Public objects
    
    /// This delegate is required to detect toolbar actions & automatically resize the NotchBar when device orientation is changed.
    public var delegate:NotchToolbarDelegate?
    
    /// This allows you to enable NotchToolbar only for iPhone X. Default is false.
    public var onlyFor10:Bool = false
    /// Configure printing bar height
    public var printBarHeight:CGFloat = 3
    /// Configure printing color
    public var printBarColor:UIColor = .cyan
    /// Configure image loading duration intervals
    public var durationIntervals:TimeInterval = 0.8
    
    // MARK: - Private Objects
    private var recentOrientation: deviceOrientation!
    private var imageView:UIImageView = UIImageView()
    private var notchImage:UIImage?
    private var printerBar:UIView = UIView()
    private var isShown:Bool = false
    private var isLoaded:Bool = false
    
    /// Initialize
    public init() {
        super.init(frame: CGRect.zero)
    }
    /// Initialize with a UIImage
    public init(image: UIImage?) {
        super.init(frame: CGRect.zero)
        notchImage = image
        self.bgColor = .clear
        self.animationInterval = 0.1
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- Methods
extension NotchImageView {
    /// This method is required to prepare the NotchImageView in your view controller.
    public func prepare(in vc:UIViewController) {
        NotificationCenter.default.addObserver(vc, selector: #selector(delegate?.deviceDidRotate), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        if onlyFor10 && !UIScreen.main.isiPhone10 {
            print("NotchToolbar: If you want to enable NotchToolBar on this device please add this line to your code\nNotchToolBar().onlyFor10 = false")
        }else{
            recentOrientation = .portrait
            imageView = UIImageView(frame: CGRect(x:0, y:0, width:self.bounds.width, height:self.bounds.height))
            imageView.center = CGPoint(x:(self.bounds.width)*0.5, y:-(self.bounds.height*0.5))
            imageView.backgroundColor = .clear
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.draw(.corner, position: .bottom, curve: self.curve)
            if let img = notchImage {
                imageView.image = img
            }
            self.addSubview(imageView)
            
            printerBar = UIView(frame: CGRect(x:0, y:0, width:self.bounds.width, height:printBarHeight))
            printerBar.center = CGPoint(x:self.bounds.width*0.5, y:-(self.bounds.height*0.5))
            printerBar.backgroundColor = printBarColor.withAlphaComponent(0.4)
            printerBar.layer.shadowColor = printBarColor.cgColor
            printerBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
            printerBar.layer.shadowOpacity = 1.0
            self.addSubview(printerBar)
            
            vc.view.addSubview(self)
        }
    }
    /// Loads image view from notch with animation
    public func load() {
        self.isVisible = true
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.4, options: [.autoreverse, .repeat], animations: {
            self.printerBar.center = CGPoint(x:self.self.bounds.width*0.5, y:(self.self.bounds.height))
        })
        
        autoResize()
        isShown = true
        updateBounds(orientation: recentOrientation)
    }
    /// Removes image view from superview
    public func remove() {
        self.self.removeFromSuperview()
        self.removeFromSuperview()
    }
    /// This function is required to be called from the `deviceDidRotate` delegate function.
    public func autoResize() {
        switch UIDevice.current.orientation {
        case .portrait:
            recentOrientation = .portrait
            self.refresh(orientation: .portrait)
            self.updateBounds(orientation: .portrait)
        case .portraitUpsideDown:
            self.refresh(orientation: recentOrientation)
            self.updateBounds(orientation: recentOrientation)
        case .landscapeLeft:
            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.height {
                recentOrientation = .landscapeLeft
                self.refresh(orientation: .landscapeLeft)
                self.updateBounds(orientation: .landscapeLeft)
            }
        case .landscapeRight:
            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.height {
                recentOrientation = .landscapeRight
                self.refresh(orientation: .landscapeRight)
                self.updateBounds(orientation: .landscapeRight)
            }
        case .faceDown:
            self.refresh(orientation: recentOrientation)
            self.updateBounds(orientation: recentOrientation)
        case .faceUp:
            self.refresh(orientation: recentOrientation)
            self.updateBounds(orientation: recentOrientation)
        case .unknown:
            self.refresh(orientation: recentOrientation)
            self.updateBounds(orientation: recentOrientation)
        }
    }
    
    private func updateBounds(orientation: deviceOrientation) {
        var xPos = (self.bounds.width*0.5)
        var yPos = (self.bounds.height*0.5)
        switch orientation {
        case .landscapeLeft :
            xPos = (!isShown) ? -(self.bounds.width*0.5) : (self.bounds.width*0.5)
        case .landscapeRight:
            xPos = (!isShown) ? (self.bounds.width*1.5) : (self.bounds.width*0.5)
        case .portrait:
            yPos = (!isShown) ? -(self.bounds.height*0.5) : (self.bounds.height*0.5)
        }

        imageView.bounds = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        if self.isLoaded{
            self.self.frame = UIScreen.main.bounds
            self.imageView.frame = self.self.frame
            self.self.draw(.corner, position: .bottom, curve: 0)
            self.imageView.draw(.corner, position: .bottom, curve: 0)
            return
        }
        
        UIView.animate(withDuration: self.durationIntervals, animations: {
            self.imageView.center = CGPoint(x:xPos, y:yPos)
        })
        if self.isShown {
            UIView.animate(withDuration: 0.4, delay: self.durationIntervals, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveLinear, animations: {
                self.self.frame = UIScreen.main.bounds
                self.imageView.frame = self.self.frame
                self.draw(.corner, position: .bottom, curve: 0)
                self.imageView.draw(.corner, position: .bottom, curve: 0)
                self.printerBar.alpha = 0
            }){ done in
                self.isLoaded = true
                self.printerBar.layer.removeAllAnimations()
            }
        }
    }
}
