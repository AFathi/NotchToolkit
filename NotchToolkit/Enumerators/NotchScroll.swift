//
//  NotchScroll.swift
//  NotchToolbar
//
//  Created by Ahmed Bekhit on 9/25/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

/**
 Types of NotchToolbar scrolling directions.
 
 `alwaysHorizontal` sets scrolling direction to horizontal with all **deviceOriention** types.
 
 `alwaysVertical` sets scrolling direction to vertical with all **deviceOriention** types.

 `auto` sets scrolling direction to vertical when **deviceOriention** is `portrait` and horizontal when **deviceOriention** is `landscape`.
*/

public enum notchScroll {
    /**
     `alwaysHorizontal` sets scrolling direction to horizontal with all **deviceOriention** types.
     */
    case alwaysHorizontal
    /**
     `alwaysVertical` sets scrolling direction to vertical with all **deviceOriention** types.
     */
    case alwaysVertical
    /**
     `auto` sets scrolling direction to vertical when **deviceOriention** is `portrait` and horizontal when **deviceOriention** is `landscape`.
     */
    case auto
}
