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
    let introText = "    I'm Feng Qiu, a student developer from Tongji University, in Shanghai. As a fan of Apple, I have been studying iOS since 2012. Now I am a full time developer for iOS Application who loves coding. \n    During my university studies, I developed my first App\"Peigencihui\"(only available in China). Since then, I developed some apps for Tongji University, such as \"TJFA\", an app for Tongji Football Association.\n    As I'm motivated to learn more about Apple and iOS, I decide to be a developer for iOS. And it allows me to connect users around the world in innovative and interestinig ways."
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.appBlueColor()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return self.data.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "INTRO"
        }
        else {
            return "INTERESTS"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            let cell: QFTextViewCell = tableView.dequeueReusableCell(withIdentifier: "QFTextViewCell") as! QFTextViewCell
            return cell.heightForText(introText)
        }
        else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: QFTextViewCell = tableView.dequeueReusableCell(withIdentifier: "QFTextViewCell") as! QFTextViewCell
            cell.introLabel.text = introText
            cell.introLabel?.font = UIFont.systemFont(ofSize: 16)
            cell.introLabel?.textColor = UIColor.white

            return cell
        }
        else {
            let cell: QFHobbyCell = tableView.dequeueReusableCell(withIdentifier: "QFHobbyCell") as! QFHobbyCell!
            cell.setCellWithHobby(data[indexPath.row])
            return cell
        }
    }
}
