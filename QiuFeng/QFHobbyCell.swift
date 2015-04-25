//
//  QFHobbyCell.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/25/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFHobbyCell: UITableViewCell {
    
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var imagePath: UIImageView!
    
    func setCellWithHobby(hobby: QFHobby) {
        self.hobbyLabel.text = hobby.hobby
        self.imagePath.image = UIImage(named: hobby.imagePath!)
    }
}
