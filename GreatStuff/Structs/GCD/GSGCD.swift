//
//  GSGCD.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 12.02.16.
//  Copyright © 2016 Iaroslav Arsenkin. All rights reserved.
//

import Foundation

public struct GSGCD {
    
    /**
         Dispatches provided block after specified amount of secs.
     
         - Note: in case _queue_ is not provided, then _dispatch_get_main_queue()_ is used by default.
     */
    public static func dispatchAfter(sec: UInt64, queue: dispatch_queue_t = dispatch_get_main_queue(), block: () -> Void) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(sec * NSEC_PER_SEC)), queue, block)
    }
    
}
