//
//  QFExperienceManager.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/22/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFExperienceManager: NSObject {
    
    
    static let manager = QFExperienceManager()
    class func sharedExperienceManager() -> QFExperienceManager {
        return manager
    }
    
    func splitExperienceByYear(experiences: [QFExperience]) ->[[QFExperience]] {
        var oneYearExperience: [QFExperience]? = nil
        
        var result: [[QFExperience]] = []
        
        var lastYear = 0
        var index = -1
        for experience in experiences {
            if experience.year != lastYear {
                oneYearExperience = []
                result.append([])
                index = index + 1
                lastYear = experience.year
            }
            result[index].append(experience)
        }
        return result
    }
    
    func getExperience() -> [[QFExperience]] {
        let path = NSBundle.mainBundle().pathForResource("QFExperience", ofType: "plist")
        let data = NSArray(contentsOfFile: path!) as! [ [String : AnyObject] ]
        
        var result: [QFExperience] = []
        
        for experience in data {
            result.append(QFExperience(experenceDic: experience))
        }
        
        return splitExperienceByYear(result)
    }
}
