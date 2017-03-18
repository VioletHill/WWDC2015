//
//  QFProjectViewController.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFProjectViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.appDarkGrayColor()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    let baseUrl = "itms-apps://itunes.apple.com/app/id"
    
    @IBAction func tjfaIconPress(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: (baseUrl + "904654597"))!)
    }
    
    @IBAction func snakeIconPress(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: (baseUrl + "828815846"))!)
    }
    @IBAction func tingyuanIconPress(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "iPad Application", message: "This Application Only Support iPad", preferredStyle: .alert)
        let action =  UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.dismiss(animated: true, completion: nil)
        })
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
}
