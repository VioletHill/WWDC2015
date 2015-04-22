
//
//  CALayer+XibConfig.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/23/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

extension CALayer {
    var borderUIColor: UIColor {
        set (newValue) {
            borderColor = newValue.CGColor
        }
        
        get  {
            return UIColor(CGColor: borderColor)!
        }
    }
}