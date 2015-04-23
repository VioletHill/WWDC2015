//
//  QFSkillViewController.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFSkillViewController: UIViewController, QFPieChartDelegate {

    @IBOutlet weak var pieChart: QFPieChart!
    
    override func viewDidLoad() {
        
        pieChart.delegate = self
        pieChart.startDraw()
        
        self.view.backgroundColor = UIColor.appGreenColor()
        self.pieChart.backgroundColor = UIColor.clearColor()
    }
    
    func percentageOfPieChart(pieChart: QFPieChart) -> Int {
        return 50
    }
}
