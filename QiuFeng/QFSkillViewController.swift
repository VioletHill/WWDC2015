//
//  QFSkillViewController.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFSkillViewController: UIViewController, QFPieChartDelegate {

    @IBOutlet weak var pieChart: QFPieChart!
    
    @IBOutlet weak var swiftLanguage: QFSkillButton!
    @IBOutlet weak var objectiveCLanguage: QFSkillButton!
    
    @IBOutlet weak var javaScriptLanguage: QFSkillButton!
    @IBOutlet weak var htmlLanguage: QFSkillButton!
    
    weak var currentSelect: QFSkillButton!
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var loveLabel: UILabel!
    @IBOutlet weak var pencentageLabel: UILabel!
    
    override func viewDidLoad() {
        
        pieChart.delegate = self
        
        self.view.backgroundColor = UIColor.appGreenColor()
        self.pieChart.backgroundColor = UIColor.clearColor()
        
        self.swiftLanguage.percentage = 99
        self.objectiveCLanguage.percentage = 90
        self.javaScriptLanguage.percentage = 70
        self.htmlLanguage.percentage = 60
        
        self.currentSelect = self.swiftLanguage
        
        adjustConstraint()
    }
    
    override func viewDidAppear(animated: Bool) {
        pieChart.startDraw()
        self.swiftLanguage.pieChart.startDraw()
        self.objectiveCLanguage.pieChart.startDraw()
        self.javaScriptLanguage.pieChart.startDraw()
        self.htmlLanguage.pieChart.startDraw()
    }

    
    @IBOutlet weak var lanuagePieChatTopConstraint: NSLayoutConstraint!
    func adjustConstraint() {
        if DeviceType.IS_IPHONE_6 {
            self.lanuagePieChatTopConstraint.constant = 50
        }
        else if DeviceType.IS_IPHONE_6P {
            self.lanuagePieChatTopConstraint.constant = 60
        }
    }
    
    //MARK: Line Chart Delegate

    func percentageOfPieChart(pieChart: QFPieChart) -> Int {
        return self.currentSelect.percentage
    }
    
    func lineWidthOfPieChart(pieChart: QFPieChart) -> CGFloat {
        return 5
    }
    
    //MARK: Action
    
    @IBAction func languagePress(sender: QFSkillButton) {
        
        setLayoutWithSender(sender)
        self.currentSelect = sender
        self.pieChart.startDraw()
        
        self.pencentageLabel.text = String("\(sender.percentage)%")
        self.languageLabel.text = sender.languageLabel.text
        
        if  sender == self.swiftLanguage {
            self.loveLabel.text = "Love"
        }
        else if sender == self.objectiveCLanguage {
            self.loveLabel.text = "Adequate"
        }
        else if sender == self.javaScriptLanguage {
            self.loveLabel.text = "Interesting"
        }
        else if sender == self.htmlLanguage {
            self.loveLabel.text = "Like"
        }
    }
    
    func setLayoutWithSender(sender: QFSkillButton) {
        self.swiftLanguage.layer.borderWidth = 0
        self.objectiveCLanguage.layer.borderWidth = 0
        self.javaScriptLanguage.layer.borderWidth = 0
        self.htmlLanguage.layer.borderWidth = 0
        sender.layer.borderWidth = 1
        sender.layer.borderUIColor = UIColor.whiteColor()
        
        sender.pieChart.startDraw()
    }
    
}
