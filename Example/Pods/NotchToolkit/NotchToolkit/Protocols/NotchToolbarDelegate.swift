//
//  NotchToolbarDelegate.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/25/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit
/**
 This delegate is required to detect toolbar actions & automatically resize the NotchBar when device orientation is changed.
 */
@objc public protocol NotchToolbarDelegate {
    /**
     This delegate function detects when the device orientation changes. Calling **autoResize()** function inside this delegate is **required**.
     */
    func deviceDidRotate()
    /**
     This delegate function allows you to detect which toolbar icon was selected.
     */
    func didTapToolIcon(_ tools: UICollectionView, toolIndex:IndexPath, section: Int, row: Int)
}
