//
//  DeviceOrientation.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

/**
 Types of the device orientation used to resize the NotchBar.
 
 `portrait` When the device's notch is on the top.
 
 `landscapeLeft` When the device's notch is on the left.
 
 `landscapeRight` When the device's notch is on the right.

 */
public enum deviceOrientation {
    /**
     `portrait` When the device's notch is on the top.
     */
    case portrait
    /**
     `landscapeLeft` When the device's notch is on the left.
     */
    case landscapeLeft
    /**
     `landscapeRight` When the device's notch is on the right.
     */
    case landscapeRight
}
