//
//  QFPersonalViewController.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFPersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [QFHobby] = QFHobbyManager.sharedHobbyManager().getHobby()
    let introText = "    I'm Feng Qiu, a student developer from Tongji University, in Shanghai. As a fan of Apple, I have been studying iOS since 2012. Now I am a full time developer for iOS Application who loves coding. \n    During my university studies, I developed my first App\"Peigencihui\"(only available in China). Since then, I developed some apps for Tongji University, suceh \"TJFA\", an app for Tongji Football Association.\n    As I'm motivated to learn more about Apple and iOS, I decide to be a developer for iOS. And it allows me to connect users around the world in innovative and interestinig ways."
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.appBlueColor()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return self.data.count
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22.0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "INTRO"
        }
        else {
            return "INTERESTS"
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            let cell: QFTextViewCell = tableView.dequeueReusableCellWithIdentifier("QFTextViewCell") as! QFTextViewCell
            return cell.heightForText(introText)
        }
        else {
            return 60
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: QFTextViewCell = tableView.dequeueReusableCellWithIdentifier("QFTextViewCell") as! QFTextViewCell
            cell.introLabel.text = introText
            cell.introLabel?.font = UIFont.systemFontOfSize(16)
            cell.introLabel?.textColor = UIColor.whiteColor()

            return cell
        }
        else {
            let cell: QFHobbyCell = tableView.dequeueReusableCellWithIdentifier("QFHobbyCell") as! QFHobbyCell!
            cell.setCellWithHobby(data[indexPath.row])
            return cell
        }
    }
}
