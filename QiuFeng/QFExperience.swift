//
//  QFExperience.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/22/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFExperience: NSObject {
    var year: Int!
    var month: String!
    var event: String!
    
    override init() {
        year = 0
        month = ""
        event = ""
    }
    
    init(experenceDic:[String: AnyObject]) {
        year = experenceDic["year"] as! Int
        month = experenceDic["month"] as! String
        event = experenceDic["event"] as! String
    }
    
    
}
