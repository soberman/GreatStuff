//
//  Alerts.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 30.12.15.
//  Copyright © 2015 Iaroslav Arsenkin. All rights reserved.
//  Website: http://arsenkin.com
//

import UIKit

public struct GSAlerts {
    
    private init() {}
    
    public static func informationalAlertWithMessage(message: String, title: String = "") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            alert.dismissViewControllerAnimated(true, completion: nil)
        })
        alert.addAction(OKAction)
        
        return alert
    }
    
    public static func closedQuestionAlertWithMessage(message: String, title: String = "", yesHandler: ((UIAlertAction) -> Void)?, noHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let YESAction = UIAlertAction(title: "Yes", style: .Default, handler: yesHandler)
        let NOAction = UIAlertAction(title: "No", style: .Cancel, handler: noHandler)
        alert.addAction(YESAction)
        alert.addAction(NOAction)
        
        return alert
    }

}
