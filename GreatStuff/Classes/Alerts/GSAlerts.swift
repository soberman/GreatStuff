//
//  Alerts.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 30.12.15.
//  Copyright © 2015 Iaroslav Arsenkin. All rights reserved.
//  Website: http://arsenkin.com
//

import UIKit
import WatchKit

public struct GSAlerts {
    
    private init() {}
    
    public static func informationalAlertWithMessage(message: String, title: String = "") -> UIAlertController {
        return alertWithTitle(title, message: message)
    }
    
    public static func errorAlertWithMessage(message: String, title: String = "Error") -> UIAlertController {
        return alertWithTitle(title, message: message)
    }

}

// MARK: - Private

extension GSAlerts {
    
    private static func alertWithTitle(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            alert.dismissViewControllerAnimated(true, completion: nil)
        })
        alert.addAction(OKAction)
        
        return alert
    }
    
}
