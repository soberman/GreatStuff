//
//  String+GreatStuff.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 12.01.16.
//  Copyright © 2016 Iaroslav Arsenkin. All rights reserved.
//

import Foundation

extension String {
    
    func gs_className(aClass: AnyClass) -> String {
        let classString = NSStringFromClass(aClass)
        let range = classString.rangeOfString(".",
            options: NSStringCompareOptions.CaseInsensitiveSearch,
            range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex),
            locale: nil)
        return classString.substringFromIndex(range!.endIndex)
    }
    
}
