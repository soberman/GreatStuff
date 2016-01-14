//
//  NSHashTable+GreatStuff.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 14.01.16.
//  Copyright © 2016 Iaroslav Arsenkin. All rights reserved.
//

import Foundation

extension NSHashTable: SequenceType {
    public func generate() -> NSFastGenerator {
        return NSFastGenerator(self)
    }
}
