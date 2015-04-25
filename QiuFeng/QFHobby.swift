//
//  QFHobby.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/25/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFHobby: NSObject {
    var hobby: String?
    var imagePath: String?
    
    init(dic:[String: String]) {
        hobby = dic["hobby"]
        imagePath = dic["imagePath"]
    }
}
