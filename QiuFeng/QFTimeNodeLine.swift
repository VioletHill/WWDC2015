//
//  QFTimeNodeLine.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFTimeNodeLine: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let locations: [CGFloat] = [0.0, 1]
        let colors = [UIColor.white.cgColor, UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor]
        let colorspace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient: CGGradient = CGGradient(colorsSpace: colorspace, colors: colors as CFArray, locations: locations)!
       
        let startPoint : CGPoint = CGPoint(x: 0, y: 0)
        let endPoint : CGPoint = CGPoint(x: 0, y: self.frame.size.height)
        context?.drawLinearGradient(gradient,start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0));
    }
}
