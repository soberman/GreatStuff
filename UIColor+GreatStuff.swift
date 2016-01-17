//
//  UIColor+GreatStuff.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 17.01.16.
//  Copyright © 2016 Iaroslav Arsenkin. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public func gs_colorWithRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
}