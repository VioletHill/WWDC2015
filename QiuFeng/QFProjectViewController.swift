//
//  QFProjectViewController.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFProjectViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.appDarkGrayColor()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    let baseUrl = "itms-apps://itunes.apple.com/app/id"
    
    @IBAction func tjfaIconPress(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: (baseUrl + "904654597"))!)
    }
    
    @IBAction func snakeIconPress(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: (baseUrl + "828815846"))!)
    }
    @IBAction func tingyuanIconPress(sender: AnyObject) {
        let alertView = UIAlertController(title: "iPad Application", message: "This Application Only Support iPad", preferredStyle: .Alert)
        let action =  UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in self.dismissViewControllerAnimated(true, completion: nil)
        })
        alertView.addAction(action)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
}
