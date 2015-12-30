//
//  Alerts.swift
//  GreatStuff
//
//  Created by Yaroslav Arsenkin on 30.12.15.
//  Copyright © 2015 Iaroslav Arsenkin. All rights reserved.
//

import UIKit

public class Alerts {
    
    public class func errorAlertWithMessage(message: String, title: String = "Error") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            alert.dismissViewControllerAnimated(true, completion: nil)
        })
        alert.addAction(OKAction)
        
        return alert
    }
    
}
