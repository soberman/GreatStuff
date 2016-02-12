//
//  GSLoger.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 12.02.16.
//  Copyright © 2016 Iaroslav Arsenkin. All rights reserved.
//

import Foundation

public struct GSLoger {
    
    /**
        Formatting style of the log output. Default:
        
            "\n- __LINE__, `__METHOD__` in __FILE__:"
     
        - Note: You should use \_\_LINE\_\_ or any other formating placeholder exactly like in example.
     
     */
    public static var formattingStyle: String = "\n- __LINE__, `__METHOD__` in __FILE__:"
    
    public static func log(string: String, file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
        log(string, args: [], file: file, method: method, line: line)
    }
    
    public static func log(string: String, args: [CVarArgType], file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
        let log = String(format: string, arguments: args)
        let format = generateFormatString(file, method: method, line: line) + "\n   \(log)"
        
        print(format)
    }
    
}

private extension GSLoger {
    
    static func generateFormatString(file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) -> String {
        let fileTruncated = file.lastPathComponent
        
        let formatWithLineNumber = GSLoger.formattingStyle.stringByReplacingOccurrencesOfString("__LINE__", withString: "\(line)")
        let formatWithMethod = formatWithLineNumber.stringByReplacingOccurrencesOfString("__METHOD__", withString: method)
        let formatWithFile = formatWithMethod.stringByReplacingOccurrencesOfString("__FILE__", withString: fileTruncated)
        
        return formatWithFile
    }
    
}