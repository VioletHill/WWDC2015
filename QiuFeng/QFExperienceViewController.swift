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
            let indexPath = tableView.indexPathForCell(cell) as NSIndexPath?
            if  let index = indexPath  {
                let experience = data[index.section][index.row]
                if alpha >= 0.9 {
                    setTitleBlod(experience.year)
                }
            }
            
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
        setButtonFont(sender)
        
        if sender == self.year2015Button {
            self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }
        else if sender == self.year2014Button {
            self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 1, inSection:0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }
        else if sender == self.year2013Button {
            self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: self.data[2].count - 2, inSection:2), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }
        else if sender == self.year2012Button {
            self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: self.data[3].count - 2, inSection:3), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }
    }
    
    func setButtonFont(sender: UIButton) {
        self.year2015Button.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.year2014Button.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.year2013Button.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.year2012Button.titleLabel?.font = UIFont.systemFontOfSize(12)

        sender.titleLabel?.font = UIFont.boldSystemFontOfSize(16)
    }
    
    func setTitleBlod(year: Int) {

        if year == 2015 {
            setButtonFont(self.year2015Button)
        }
        else if year == 2014 {
            setButtonFont(self.year2014Button)
        }
        else if year == 2013 {
            setButtonFont(self.year2013Button)
        }
        else if year == 2012 {
            setButtonFont(self.year2012Button)
        }
    }
}
