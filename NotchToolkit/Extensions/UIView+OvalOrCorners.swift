//
//  UIView+OvalOrCorners.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

public extension UIView {
    /**
     **UIView.addOvalOrCorner(type,position,curve,customBounds)** is a UIView extension that allows you add ovals and rounded corners to a UIView.
     - For type `oval`, set `curve` from 1.0 - 10.0.
     - For type `corner`, `curve` is the radius size.
     - Check `curveType` & `curvePosition` for more info.
     */
    public func addOvalOrCorner(type:curveType, position:curvePosition, curve:CGFloat?, customBounds:CGRect? = nil) {
        let offset:CGFloat = self.frame.size.width/curve!
        var bounds:CGRect!
        var viewBounds:CGRect!
        var viewPath:UIBezierPath!
        
        if let finalBounds = customBounds {
            bounds = finalBounds
        }else{
            bounds = self.bounds
        }
        
        switch type {
        case .oval:
            var ovalBounds:CGRect!
            switch position {
            case .right:
                ovalBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y - offset / 2, width:bounds.size.width , height:bounds.size.height + offset)
                viewBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width/2, height: bounds.size.height)
                
                let ovalPath = UIBezierPath(ovalIn: ovalBounds)
                viewPath = UIBezierPath(rect: viewBounds)
                viewPath.append(ovalPath)
                break
            case .left:
                ovalBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y - offset / 2, width:bounds.size.width , height:bounds.size.height + offset)
                viewBounds = CGRect(x: bounds.origin.x+bounds.size.width/2, y: bounds.origin.y, width: bounds.size.width/2, height: bounds.size.height)
                
                let ovalPath = UIBezierPath(ovalIn: ovalBounds)
                viewPath = UIBezierPath(rect: viewBounds)
                viewPath.append(ovalPath)
                break
            case .top:
                ovalBounds = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width:bounds.size.width + offset, height:bounds.size.height)
                viewBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y + bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)
                
                let ovalPath = UIBezierPath(ovalIn: ovalBounds)
                viewPath = UIBezierPath(rect: viewBounds)
                viewPath.append(ovalPath)
                break
            case .bottom:
                ovalBounds = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width:bounds.size.width + offset, height:bounds.size.height)
                viewBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
                
                let ovalPath = UIBezierPath(ovalIn: ovalBounds)
                viewPath = UIBezierPath(rect: viewBounds)
                viewPath.append(ovalPath)
                break
            case .horizontalSides:
                ovalBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y - offset / 2, width:bounds.size.width , height:bounds.size.height + offset)
                viewBounds = CGRect(x: bounds.origin.x+bounds.size.width, y: bounds.origin.y+bounds.size.height, width: bounds.size.width, height: bounds.size.height)
                
                let ovalPath = UIBezierPath(ovalIn: ovalBounds)
                viewPath = UIBezierPath(rect: viewBounds)
                viewPath.append(ovalPath)
                break
            case .verticalSides:
                ovalBounds = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width:bounds.size.width + offset, height:bounds.size.height)
                viewBounds = CGRect(x: bounds.origin.x+bounds.size.width, y: bounds.origin.y+bounds.size.height, width: bounds.size.width, height: bounds.size.height)
                
                let ovalPath = UIBezierPath(ovalIn: ovalBounds)
                viewPath = UIBezierPath(rect: viewBounds)
                viewPath.append(ovalPath)
                break
            case .all:
                viewPath = UIBezierPath(ovalIn: self.bounds)
                break
            }
            break
        case .corner:
            switch position {
            case .right:
                
                viewPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width:curve!, height:curve!))
                break
            case .left:
                viewPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width:curve!, height:curve!))
                break
            case .top:
                viewPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width:curve!, height:curve!))
                break
            case .bottom:
                viewPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width:curve!, height:curve!))
                break
            case .all:
                viewPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width:curve!, height:curve!))
                break
            default:
                break
            }
            break
        }
        if let path = viewPath {
            let shapeLayer: CAShapeLayer = CAShapeLayer()
            shapeLayer.frame = bounds
            shapeLayer.path = path.cgPath
            self.layer.mask = shapeLayer
        }
    }
}
