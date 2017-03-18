//
//  QFHobbyManager.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/25/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFHobbyManager: NSObject {
    static let manager = QFHobbyManager()
    class func sharedHobbyManager() -> QFHobbyManager {
        return manager
    }
    
    func getHobby() -> [QFHobby] {
        let path = Bundle.main.path(forResource: "QFHobby", ofType: "plist")
        let data = NSArray(contentsOfFile: path!) as! [ [String: String] ]
        
        var result: [QFHobby] = []
        
        for hobby in data {
            result.append(QFHobby(dic: hobby) )
        }

        
        return result
    }


}
