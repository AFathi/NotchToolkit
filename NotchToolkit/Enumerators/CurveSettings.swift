//
//  CurveSettings.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/23/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

/**
 Types of bezier paths drawn in a view.
 
 `oval` Is an oval-based bezier path.
 
 `corner` Is a rounded-rectangle-based bezier path.
 */
public enum curveType {
    /**
     `oval` Is an oval-based bezier path.
     */
    case oval
    /**
     `corner` Is a rounded-rectangle-based bezier path.
     */
    case corner
}

/**
 Position options to draw the bezier paths.
 
 `right` Draws a bezier path vertically on the right side of a view.
 - If **curveType** is `corner`, it draws a rounded rectangle corner on topRight and bottomRight of a view.
 - If **curveType** is `oval`, it draws an oval-based bezier path vertically on the right side of a view.
 
 `left` Draws a bezier path vertically on the left side of a view.
 - If **curveType** is `corner`, it draws a rounded rectangle corner on topLeft and bottomLeft of a view.
 - If **curveType** is `oval`, it draws an oval-based bezier path vertically on the left side of a view.
 
 `top` Draws a bezier path horizontally on the top side of a view.
 - If **curveType** is `corner`, it draws a rounded rectangle corner on topRight and topLeft of a view.
 - If **curveType** is `oval`, it draws an oval-based bezier path horizontally on the top side of a view.
 
 `bottom` Draws a bezier path vertically on the bottom side of a view.
 - If **curveType** is `corner`, it draws a rounded rectangle corner on bottomRight and bottomLeft of a view.
 - If **curveType** is `oval`, it draws an oval-based bezier path horizontally on the bottom side of a view.
 
 `horizontalSides` Draws an oval-based bezier path vertically on the right & left sides of a view.
 - Can only be applied when **curveType** is `oval`.

 `verticalSides` Draws an oval-based bezier path horizontally on the top & bottom sides of a view.
 - Can only be applied when **curveType** is `oval`.

 `all` Draws a bezier path on all sides of a view.
 - If **curveType** is `corner`, it draws rounded rectangle corners in topLeft, topRight, bottomLeft and bottomRight.
 - If **curveType** is `oval`, it draws a full oval shape out of the view.
 */
public enum curvePosition {
    /**
     `right` Draws a bezier path vertically on the right side of a view.
     */
    case right
    /**
     `left` Draws a bezier path vertically on the left side of a view.
     */
    case left
    /**
     `top` Draws a bezier path horizontally on the top side of a view.
     */
    case top
    /**
     `bottom` Draws a bezier path vertically on the bottom side of a view.
     */
    case bottom
    /**
     `horizontalSides` Draws an oval-based bezier path vertically on the right & left sides of a view.
     */
    case horizontalSides
    /**
     `verticalSides` Draws an oval-based bezier path horizontally on the top & bottom sides of a view.
     */
    case verticalSides
    /**
     `all` Draws a bezier path on all sides of a view.
     */
    case all
}
