//
//  UIScreen+NotchPositionMultiplier.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

public extension UIScreen {
    private func setMultiplier(mode:notchMode) -> CGFloat {
        switch mode {
        case .statusBar:
            return 0.0021
        case .noStatusBar:
            return 0.0017
        }
    }
    /**
     `multiplier` is a float number that's used to postion the NotchBar when **deviceOrientation** is landscape.
     */
    public var multiplier: CGFloat {
        return setMultiplier(mode: .statusBar)
    }
    /**
     `multiplierWide` is a float number that's used to postion the wide NotchBar when **deviceOrientation** is landscape.
     */
    public var multiplierWide: CGFloat {
        return setMultiplier(mode: .noStatusBar)
    }
}
