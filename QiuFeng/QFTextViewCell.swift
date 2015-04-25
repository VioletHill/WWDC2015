//
//  QFTextViewCell.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/25/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFTextViewCell: UITableViewCell {
    

    @IBOutlet weak var introLabel: UITextView!
    
    func heightForText(str: String)-> CGFloat {
        self.introLabel.text = str
        self.introLabel?.font = UIFont.systemFontOfSize(16)
        self.introLabel?.textColor = UIColor.whiteColor()
        let size = self.introLabel.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.width - 20, CGFloat(FLT_MAX)))
        return size.height
    }
    
    
}
