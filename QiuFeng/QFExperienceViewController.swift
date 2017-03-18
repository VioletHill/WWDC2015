//
//  QFExperienceViewController.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
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
        self.view.backgroundColor = UIColor.orange
        
        var firstEmpty: [QFExperience] = []
        for i in 1...2 {
            firstEmpty.insert(QFExperienceManager.sharedExperienceManager().generalEmptyExperience(), at: 0)
        }
        data.insert(firstEmpty, at: 0)
        
        var lastEmpty: [QFExperience] = []
        let lastCount: Int
        if DeviceType.IS_IPHONE_6P {
            lastCount = 3
        }
        else if DeviceType.IS_IPHONE_4_OR_LESS {
            lastCount = 1
        }
        else {
            lastCount = 2
        }
        
        for i in 1...lastCount {
            lastEmpty.insert(QFExperienceManager.sharedExperienceManager().generalEmptyExperience(), at: 0)
        }
        data.append(lastEmpty)
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.timeNodeLine.setNeedsDisplay()
    }
    
    
    //MARK - Layout
    
    @IBOutlet weak var avatarWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    func setupLayout() {
        let width = UIScreen.main.bounds.height / 10
        self.avatarWidthConstraint.constant = width
        self.avatarImageView.layer.cornerRadius = width / 2
        self.topViewHeightConstraint.constant = UIScreen.main.bounds.height / 4
    }
    
    //MARK - TablView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(QFEexperienceTableViewCell.self).components(separatedBy: ".").last!) as! QFEexperienceTableViewCell
        let experience = data[indexPath.section][indexPath.row]
        cell.setCellWithExperience(experience)
        
        return cell
    }
        
    func setCellAlpha(_ cell: UITableViewCell) {
        
        let showItem = 2
        let itemOffset = CGFloat(showItem) * CGFloat(cellHeight)
        let alpha = 1 - fabs(( cell.frame.origin.y - tableView.contentOffset.y - itemOffset) / tableView.frame.size.height) * 2
        
        if let experienceCell = cell as? QFEexperienceTableViewCell {
            let indexPath = tableView.indexPath(for: cell) as IndexPath?
            if  let index = indexPath  {
                let experience = data[index.section][index.row]
                if alpha >= 0.9 {
                    setTitleBlod(experience.year)
                }
            }
            
            experienceCell.setCellAlpha(alpha)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        setCellAlpha(cell)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cells = tableView.visibleCells
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
    
    @IBAction func yearPress(_ sender: UIButton) {
        setButtonFont(sender)
        
        if sender == self.year2015Button {
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
        }
        else if sender == self.year2014Button {
            self.tableView.scrollToRow(at: IndexPath(row: 1, section:0), at: UITableViewScrollPosition.top, animated: true)
        }
        else if sender == self.year2013Button {
            self.tableView.scrollToRow(at: IndexPath(row: self.data[2].count - 2, section:2), at: UITableViewScrollPosition.top, animated: true)
        }
        else if sender == self.year2012Button {
            self.tableView.scrollToRow(at: IndexPath(row: self.data[3].count - 2, section:3), at: UITableViewScrollPosition.top, animated: true)
        }
    }
    
    func setButtonFont(_ sender: UIButton) {
        self.year2015Button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.year2014Button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.year2013Button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.year2012Button.titleLabel?.font = UIFont.systemFont(ofSize: 12)

        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setTitleBlod(_ year: Int) {

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
