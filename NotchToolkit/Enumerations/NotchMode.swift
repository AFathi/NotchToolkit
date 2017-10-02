//
//  NotchMode.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

/**
 Modes of the NotchBar based on status bar visibility.
*/
public enum notchMode {
/**
     This mode sets the width of the NotchBar as the iPhone's X notch width.
 */
    case statusBar
/**
     This mode sets a wider width to display more content. Recommended for full landscape apps and when status bar is hidden.
 */
    case noStatusBar
}
