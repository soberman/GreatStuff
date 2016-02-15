//
//  GSLoger.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 12.02.16.
//  Copyright © 2016 Iaroslav Arsenkin. All rights reserved.
//

import Foundation

/**
    Formatting style of the log output. Default:

    "\n- `__LINE__`, `__METHOD__` in `__FILE__`:"

    - Note: You should use `__LINE__` or any other formating placeholder exactly like in example.
*/
public var GSLogFormattingStyle: String = "\n- __LINE__, `__METHOD__` in __FILE__:"

/**
    Turns off all loggin.

    Set this property to **_true_** in case you make a Release build.
*/
public var GSLogDisableLogging = false

public func GSLog(items: Any..., file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
    if GSLogDisableLogging { return }
    
    let format = gs_generateFormatString(file, method: method, line: line)
    
    print(format)
    print(items.minimalDescrption + "\n")
}

public func GSLog(string: String, args: [CVarArgType], file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
    if GSLogDisableLogging { return }
    
    let log = String(format: string, arguments: args)
    let format = gs_generateFormatString(file, method: method, line: line) + "\n\(log)\n"
    
    print(format)
}


// MARK: - Private Methods


private func gs_generateFormatString(file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) -> String {
    let fileTruncated = file.lastPathComponent
    
    let formatWithLineNumber = GSLogFormattingStyle.stringByReplacingOccurrencesOfString("__LINE__", withString: "\(line)")
    let formatWithMethod = formatWithLineNumber.stringByReplacingOccurrencesOfString("__METHOD__", withString: method)
    let formatWithFile = formatWithMethod.stringByReplacingOccurrencesOfString("__FILE__", withString: fileTruncated)
    
    return formatWithFile
}

private extension SequenceType {
    var minimalDescrption: String {
        return map { String($0) }.joinWithSeparator(" ")
    }
}
