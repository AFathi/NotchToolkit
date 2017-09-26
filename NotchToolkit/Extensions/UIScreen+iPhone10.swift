//
//  UIScreen+iPhone10.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit
public extension UIScreen {
    /**
     `isiPhone10` is a boolean that returns if the device is iPhone X or not.
     */
    public var isiPhone10: Bool {
        return self.nativeBounds.size == CGSize(width: 1125, height: 2436)
    }
}
