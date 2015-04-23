//
//  QFPieChart.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

protocol QFPieChartDelegate {
    func percentageOfPieChart(pieChart: QFPieChart) -> Int
}

class QFPieChart: UIView {
    
    let animationDuration: Float = 0.5;
    let totalDrawCount = 50
    var drawCount = 0
    var delegate: QFPieChartDelegate?
    
    override func drawRect(rect: CGRect) {
        
       // if let delegate
        if delegate == nil {
            return
        }
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 5)
        UIColor.whiteColor().set()
        
        let percentage = delegate?.percentageOfPieChart(self)
        let drawPercentage = Float(drawCount) / Float(totalDrawCount) * Float(percentage!) / 100
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, (frame.size.width - 10)/2, CGFloat(-M_PI / 6), CGFloat(M_PI * 2) * CGFloat(100-drawPercentage) - CGFloat(M_PI/6), 1)
        
        CGContextStrokePath(context);
    }
    
    func draw() {
        drawCount = drawCount + 1
        if drawCount >= totalDrawCount {
            return
        }
        else {
            setNeedsDisplay()
            let time: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(Float(NSEC_PER_SEC) * animationDuration / Float(totalDrawCount)))
            dispatch_after(time, dispatch_get_main_queue(), { ()-> Void in
                self.draw()
            });
        }
    }
    
    func startDraw() {
        drawCount = 0
        draw()
    }

}
