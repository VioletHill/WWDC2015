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
    
    func heightForText(_ str: String)-> CGFloat {
        self.introLabel.text = str
        self.introLabel?.font = UIFont.systemFont(ofSize: 16)
        self.introLabel?.textColor = UIColor.white
        let size = self.introLabel.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 20, height: CGFloat(FLT_MAX)))
        return size.height
    }
    
    
}
