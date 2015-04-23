//
//  QFExperienceViewController.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFExperienceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeNodeLine: QFTimeNodeLine!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var data: [[QFExperience]] =  QFExperienceManager.sharedExperienceManager().getExperience()
    
    let cellHeight: CGFloat = 80.0
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.orangeColor()
        
        var firstEmpty: [QFExperience] = []
        for i in 1...2 {
            firstEmpty.insert(QFExperienceManager.sharedExperienceManager().generalEmptyExperience(), atIndex: 0)
        }
        data.insert(firstEmpty, atIndex: 0)
        
        var lastEmpty: [QFExperience] = []
        let lastCount: Int
        if DeviceType.IS_IPHONE_6P {
            lastCount = 3
        }
        else {
            lastCount = 1
        }
        
        for i in 1...lastCount {
            lastEmpty.insert(QFExperienceManager.sharedExperienceManager().generalEmptyExperience(), atIndex: 0)
        }
        data.append(lastEmpty)
        
        setupLayout()
    }
    
    override func viewWillAppear(animated: Bool) {

        self.timeNodeLine.setNeedsDisplay()
    }
    
    
    //MARK - Layout
    
    @IBOutlet weak var avatarWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    func setupLayout() {
        let width = UIScreen.mainScreen().bounds.height / 10
        self.avatarWidthConstraint.constant = width
        self.avatarImageView.layer.cornerRadius = width / 2
        self.topViewHeightConstraint.constant = UIScreen.mainScreen().bounds.height / 4
    }
    
    //MARK - TablView
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(QFEexperienceTableViewCell.self).componentsSeparatedByString(".").last!) as! QFEexperienceTableViewCell
        let experience = data[indexPath.section][indexPath.row]
        cell.setCellWithExperience(experience)
        
        return cell
    }
        
    func setCellAlpha(cell: UITableViewCell) {
        
        let showItem = 2
        let itemOffset = CGFloat(showItem) * CGFloat(cellHeight)
        let alpha = 1 - fabs(( cell.frame.origin.y - tableView.contentOffset.y - itemOffset) / tableView.frame.size.height) * 2
        if let experienceCell = cell as? QFEexperienceTableViewCell {
            experienceCell.setCellAlpha(alpha)
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        setCellAlpha(cell)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let cells = tableView.visibleCells()
        for object in cells {
            if let cell = object as? UITableViewCell {
                setCellAlpha(cell)
            }
        }
    }
   
    @IBOutlet weak var year2015Button: UIButton!
    @IBOutlet weak var year2014Button: UIButton!
    @IBOutlet weak var year2013Button: UIButton!
    @IBOutlet weak var year2012Button: UIButton!
    
    @IBAction func yearPress(sender: UIButton) {
    }
    
    
}
