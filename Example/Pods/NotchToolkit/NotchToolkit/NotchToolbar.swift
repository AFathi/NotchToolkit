//
//  NotchToolbar.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

/**
 *NotchToolkit* is a light-weight framework for iOS that allow developers use the iPhone's X notch space in creative ways.
 
 - Author: Ahmed Fathi Bekhit
 * [Github](http://github.com/AFathi)
 * [Website](http://ahmedbekhit.com)
 * [Twitter](http://twitter.com/iAFapps)
 * [Email](mailto:me@ahmedbekhit.com)
 */
public class NotchToolbar: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    /**
     This delegate is required to detect toolbar actions & automatically resize the NotchBar when device orientation is changed.
     */
    public var delegate:NotchToolbarDelegate?
    /**
     This provides you options to customize NotchBar.
     */
    public var notch:NotchBar = NotchBar()
    /**
     This gives you options to change the NotchToolbar scrolling directions. Default is auto.
     */
    public var scrollMode:notchScroll = .auto
    
    /**
     This allows you to enable NotchToolbar only for iPhone X. Default is false.
     */
    public var onlyFor10:Bool = false
    /**
     This is the collection view that loads the toolList.
     */
    public var tools:UICollectionView?
    /**
     This allows you to set the tool icon size. Default is 60x60
     */
    public var toolIconSize:CGSize = CGSize(width: 60, height: 60)
    /**
     This allows you to customize the collection view edge insets.
     */
    public var toolIconsInsets:UIEdgeInsets = UIEdgeInsetsMake(5, 35, 5, 35)
    /**
     This is the array of the tool icons in the NotchToolbar. You may only use String & UIImage types.
     */
    public var toolList:[Any?] = ["🤓", "😊", "🙄", "👩‍🔬", "👨‍💻"]
    /**
     This allows you to customize the tools title font.
     */
    public var toolsTitleFont:UIFont = UIFont(name:"Avenir-Medium", size: 45)!
    /**
     This allows you to customize the tools title color.
     */
    public var toolsTitleColor:UIColor = .white
    
    public var toolsFlow = UICollectionViewFlowLayout()

    /**
     This function is required to initialize the NotchToolbar.
     */
    public func initializeToolbar(_ vc:UIViewController) {
        NotificationCenter.default.addObserver(vc, selector: #selector(delegate?.deviceDidRotate), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        if onlyFor10 && !UIScreen.main.isiPhone10 {
            print("NotchToolbar: If you want to enable NotchToolBar on this device please add this line to your code\nNotchToolBar().onlyFor10 = false")
        }else{
            switch scrollMode {
            case .alwaysHorizontal:
                toolsFlow.scrollDirection = .horizontal
            case .alwaysVertical:
                toolsFlow.scrollDirection = .vertical
            default:
                break
            }
            tools = UICollectionView(frame: CGRect(x:0, y:0, width:notch.bounds.width, height:notch.bounds.height), collectionViewLayout: toolsFlow)
            tools?.register(NotchToolCell.self, forCellWithReuseIdentifier: "toolCell")
            tools?.delegate = self
            tools?.dataSource = self
            tools?.contentOffset = CGPoint(x: 0, y: 0)
            tools?.backgroundColor = .clear
            tools?.setContentOffset(CGPoint.zero, animated: false)
            notch.addSubview(tools!)
            vc.view.addSubview(notch)
        }
    }
    
    /**
     This function allows you to show and hide the NotchToolbar.
     */
    public func showOrHide() {
        notch.isVisible = notch.isVisible ? false : true
        autoResize()
    }
}

//MARK:- NotchToolbarDelegates
extension NotchToolbar {
    /**
     This function is required to be called from the `deviceDidRotate` delegate function.
     */
    public func autoResize() {
        var offsetPoint:CGPoint! = CGPoint.zero
        if UIScreen.main.bounds.size.width > UIScreen.main.bounds.height {
            switch scrollMode {
            case .auto:
                offsetPoint = CGPoint(x:-(pow(toolIconsInsets.top, 2.4)),y:0)
                toolsFlow.scrollDirection = .horizontal
            case .alwaysVertical:
                offsetPoint = CGPoint(x:-(pow(toolIconsInsets.top, 2.4)),y:0)
            default:
                break
            }
        }else{
            switch scrollMode {
            case .auto:
                offsetPoint = CGPoint(x:0,y:-(pow(toolIconsInsets.top, 2.4)))
                toolsFlow.scrollDirection = .vertical
            case .alwaysVertical:
                offsetPoint = CGPoint(x:0,y:-(pow(toolIconsInsets.top, 2.4)))
            default:
                break
            }
        }
        
        switch UIDevice.current.orientation {
        case .portrait:
            notch.refresh(orientation: .portrait)
            tools?.bounds = CGRect(x: 0, y: 0, width: notch.bounds.size.width, height: notch.bounds.size.height)
            tools?.center = CGPoint(x: notch.bounds.size.width/2, y: notch.bounds.size.height/2)
            tools?.reloadData()
            tools?.setContentOffset(offsetPoint, animated: false)
        case .portraitUpsideDown:
            //no changes
            break
        case .landscapeLeft:
            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.height {
                notch.refresh(orientation: .landscapeLeft)
                tools?.bounds = CGRect(x: 0, y: 0, width: notch.bounds.size.width, height: notch.bounds.size.height)
                tools?.center = CGPoint(x: notch.bounds.size.width/2, y: notch.bounds.size.height/2)
                tools?.reloadData()
                tools?.setContentOffset(offsetPoint, animated: false)
            }
        case .landscapeRight:
            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.height {
                notch.refresh(orientation: .landscapeRight)
                tools?.bounds = CGRect(x: 0, y: 0, width: notch.bounds.size.width, height: notch.bounds.size.height)
                tools?.center = CGPoint(x: notch.bounds.size.width/2, y: notch.bounds.size.height/2)
                tools?.reloadData()
                tools?.setContentOffset(offsetPoint, animated: false)
            }
        default:
            break
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toolList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:NotchToolCell = collectionView.dequeueReusableCell(withReuseIdentifier: "toolCell", for: indexPath as IndexPath) as! NotchToolCell
        if let text = toolList[indexPath.row] as? String {
            cell.setTitle(text, font: toolsTitleFont, color: toolsTitleColor)
        }else if let image = toolList[indexPath.row] as? UIImage {
            cell.setIcon(image)
        }

        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return toolIconSize
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapToolIcon(collectionView, toolIndex: indexPath, section: indexPath.section, row: indexPath.row)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return toolIconsInsets
    }
}
