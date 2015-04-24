//
//  QFTimeNodeLine.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFTimeNodeLine: UIView {
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let locations: [CGFloat] = [0.0, 1]
        let colors: CFArray = [UIColor.whiteColor().CGColor, UIColor(red: 1, green: 1, blue: 1, alpha: 0).CGColor]
        let colorspace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()
        let gradient: CGGradientRef = CGGradientCreateWithColors(colorspace, colors, locations)
       
        let startPoint : CGPoint = CGPointMake(0, 0)
        let endPoint : CGPoint = CGPointMake(0, self.frame.size.height)
        CGContextDrawLinearGradient(context, gradient,startPoint, endPoint, 0);
    }
}
