//
//  QFPieChart.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

protocol QFPieChartDelegate {
    func percentageOfPieChart(_ pieChart: QFPieChart) -> Int
    func lineWidthOfPieChart(_ pieChart: QFPieChart) -> CGFloat
}

class QFPieChart: UIView {
    
    let animationDuration: Float = 0.5;
    let totalDrawCount = 50
    var drawCount = 0
    var delegate: QFPieChartDelegate?
    
    override func draw(_ rect: CGRect) {
        
       // if let delegate
        if delegate == nil {
            return
        }
        
        let context = UIGraphicsGetCurrentContext()
        let width = self.delegate?.lineWidthOfPieChart(self)
        if let lineWidth = width {
            context?.setLineWidth(lineWidth)
        }
        else {
            context?.setLineWidth(1)
        }
        UIColor.white.set()
        
        let percentage = delegate?.percentageOfPieChart(self)
    
        let drawPercentage = Float(drawCount) / Float(totalDrawCount) * Float(percentage!) / 100
        context?.addArc(center:CGPoint(x: (frame.size.width)/2, y: frame.size.height/2) , radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI / 6), endAngle: CGFloat(M_PI * 2) * CGFloat(100-drawPercentage) - CGFloat(M_PI/6), clockwise: true)
//        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, (frame.size.width - 10)/2, CGFloat(-M_PI / 6), CGFloat(M_PI * 2) * CGFloat(100-drawPercentage) - CGFloat(M_PI/6), 1)
        
        context?.strokePath();
    }
    
    func draw() {
        drawCount = drawCount + 1
        if drawCount >= totalDrawCount {
            return
        }
        else {
            setNeedsDisplay()
            let time: DispatchTime = DispatchTime.now() + Double(Int64(Float(NSEC_PER_SEC) * animationDuration / Float(totalDrawCount))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: time, execute: { ()-> Void in
                self.draw()
            });
        }
    }
    
    func startDraw() {
        drawCount = 0
        draw()
    }

}
