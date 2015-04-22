//
//  QFExperience.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/22/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFExperience: NSObject {
    var year: Int!
    var month: String!
    var event: String!
    
    
    init(experenceDic:[String: AnyObject]) {
        year = experenceDic["year"] as! Int
        month = experenceDic["month"] as! String
        event = experenceDic["event"] as! String
    }
    
    
}
