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
    
    let data: [[QFExperience]] =  QFExperienceManager.sharedExperienceManager().getExperience()
    
    let cellHeight: CGFloat = 80.0
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.orangeColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        let footerView: UIView = UIView(frame: CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height / CGFloat(2)));
        footerView.backgroundColor = UIColor.clearColor()
        self.tableView.tableFooterView = footerView
        
        self.timeNodeLine.setNeedsDisplay()
    }
    
    
    //MARK - Layout
    
    @IBOutlet weak var avatarWidthConstraint: NSLayoutConstraint!
    
    
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
}
