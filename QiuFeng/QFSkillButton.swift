//
//  QFSkillButton.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFSkillButton: UIControl, QFPieChartDelegate {
    @IBOutlet weak var pieChart: QFPieChart!
    @IBOutlet weak var languageLabel: UILabel!
    
    var percentage: Int = 0
    
    override func awakeFromNib() {
        pieChart.delegate = self
    }
    
    func percentageOfPieChart(pieChart: QFPieChart) -> Int {
        return self.percentage
    }
    
    func lineWidthOfPieChart(pieChart: QFPieChart) -> CGFloat {
        return 3
    }
}
