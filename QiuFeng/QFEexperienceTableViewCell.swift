//
//  QFEexperienceTableViewCell.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFEexperienceTableViewCell: UITableViewCell {

   
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var timeNode: UIView!
    @IBOutlet weak var timeNodeLime: UIView!
    
    
//    override func observeValue(forKeyPath keyPath: String, of object: Any, change: [AnyHashable: Any], context: UnsafeMutableRawPointer) {
////        if keyPath == "alpha" {
////            setTimeNodeAlpha(alpha)
////        }
//    }
    
    override func awakeFromNib() {
      //  self.addObserver(self, forKeyPath: "alpha", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    func setCellWithExperience(_ experience: QFExperience) {
        if experience.year == 0 {
            timeNode.isHidden = true
        }
        else {
            timeNode.isHidden = false
        }
        monthLabel.text = experience.month
        eventLabel.text = experience.event
    }
    
    func setCellAlpha(_ alpha: CGFloat) {
        let alphaValue = max(0, alpha)
        self.monthLabel.alpha = alphaValue
        self.eventLabel.alpha = alphaValue
        self.monthLabel.font = UIFont.boldSystemFont(ofSize: 14 + alpha * 4);
        setTimeNodeAlpha(alphaValue)
    }
    
    func setTimeNodeAlpha(_ alpha: CGFloat) {
        //255 123 35
        let color = UIColor(red: ((255-255)*alpha+255)/255, green: ((123-255)*alpha+255)/255, blue: ((35-255)*alpha+255)/255 , alpha: alpha)
        self.timeNode.backgroundColor = color
        self.timeNode.layer.borderUIColor = UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
    }
}
