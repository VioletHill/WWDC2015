//
//  QFEexperienceTableViewCell.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFEexperienceTableViewCell: UITableViewCell {

   
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var timeNode: UIView!
    
    func setCellWithExperience(experience: QFExperience) {
        monthLabel.text = experience.month
        eventLabel.text = experience.event
    }
}
