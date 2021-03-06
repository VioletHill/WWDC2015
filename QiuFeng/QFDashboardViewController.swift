//
//  QFDashboardViewController.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFDashboardViewController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var dashboardAvatarImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var avatarContainerView: UIView!
    @IBOutlet weak var page2View: UIView!
    
    let pushAnimator = QFDashboardPushAnimator()
    let popAnimator = QFDashboardPopAnimator()
    
    var needToHideNav: Bool = true
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarContainerView.backgroundColor = UIColor.appBlueColor()
        configNavigationBar()
        setIndicator(0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        needToHideNav = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        configNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if needToHideNav {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLayoutSubviews() {
        self.dashboardAvatarImage.layer.cornerRadius = self.dashboardAvatarImage.layer.frame.size.width / 2
    }
    
    // MARK: - navigation bar
    
    func configNavigationBar() {
        // Hide Status bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.edgesForExtendedLayout = UIRectEdge();
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        self.navigationController?.delegate = self
    }
    
    // MARK: - Project Button
    
    let projectButtonSize: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 120
        }
        else if DeviceType.IS_IPHONE_5 {
            return 120
        }
        else if DeviceType.IS_IPHONE_6 {
            return 150
        }
        else if DeviceType.IS_IPHONE_6P {
            return 170
        }
        return 120
    }()
    
    let projectButtonX: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 70
        }
        else if DeviceType.IS_IPHONE_5 {
            return 70
        }
        else if DeviceType.IS_IPHONE_6 {
            return 60
        }
        else if DeviceType.IS_IPHONE_6P {
            return 70
        }
        
       return 50
    }()
    
    let projectY: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 110
        }
        else if DeviceType.IS_IPHONE_5 {
            return 130
        }
        else if DeviceType.IS_IPHONE_6 {
            return 160
        }
        else if DeviceType.IS_IPHONE_6P {
            return 170
        }
        return 100
    }()
    
    lazy var projectButton: UIButton = {
        //let project = UIButton.withType(UIButtonType.system)
        let project = UIButton(type: .system)
        project.layer.cornerRadius = self.projectButtonSize / 2
        project.setTitle("Project", for: UIControlState())
        project.backgroundColor = UIColor.appDarkGrayColor()
        project.setTitleColor(UIColor.white, for: UIControlState())
        project.addTarget(self, action:#selector(QFDashboardViewController.pushToProject(_:)), for: UIControlEvents.touchUpInside)
        return project
    }()
    
    lazy var projectMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation?.fromValue = self.view.frame.size.height
        springAnimation?.toValue = self.projectY
        springAnimation?.springBounciness = 15
        springAnimation?.springSpeed = 20
        springAnimation?.dynamicsTension = 200
        return springAnimation!
    }()
    
    
    // MARK: - Skill Button
    
    let skillButtonSize: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 140
        }
        else if DeviceType.IS_IPHONE_5 {
            return 140
        }
        else if DeviceType.IS_IPHONE_6 {
            return 180
        }
        else if DeviceType.IS_IPHONE_6P {
            return 200
        }
        
        return 140
    }()
    
    let skillButtonX: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 140
        }
        else if DeviceType.IS_IPHONE_5 {
            return 140
        }
        else if DeviceType.IS_IPHONE_6 {
            return 170
        }
        else if DeviceType.IS_IPHONE_6P {
            return 175
        }
        return 150
    }()
    
    let skillY: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 180
        }
        else if DeviceType.IS_IPHONE_5 {
            return 200
        }
        else if DeviceType.IS_IPHONE_6 {
            return 230
        }
        else if DeviceType.IS_IPHONE_6P {
            return 260
        }
        
        return 150
    }()
    
    lazy var skillButton: UIButton = {
        //let skill = UIButton.withType(UIButtonType.system)
        let skill = UIButton(type: .system)
        skill.layer.cornerRadius = self.skillButtonSize / 2
        skill.setTitle("Skill", for: UIControlState())
        skill.backgroundColor = UIColor.appGreenColor()
        skill.setTitleColor(UIColor.white, for: UIControlState())
        skill.addTarget(self, action: #selector(QFDashboardViewController.pushToSkill(_:)), for: UIControlEvents.touchUpInside)
        return skill
    }()
    
    lazy var skillMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation?.fromValue = self.view.frame.size.height
        springAnimation?.toValue = self.skillY
        springAnimation?.springBounciness = 20
        springAnimation?.springSpeed = 15
        springAnimation?.dynamicsTension = 80
        return springAnimation!
    }()
    
    //MARK: - Experience Button
    
    let experienceButtonSize: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 100
        }
        else if DeviceType.IS_IPHONE_5 {
            return 100
        }
        else if DeviceType.IS_IPHONE_6 {
            return 120
        }
        else if DeviceType.IS_IPHONE_6P {
            return 150
        }
        return 100
    }()
    
    let experienceX: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 60
        }
        else if DeviceType.IS_IPHONE_5 {
            return 60
        }
        else if DeviceType.IS_IPHONE_6 {
            return 70
        }
        else if DeviceType.IS_IPHONE_6P {
            return 85
        }
        return 60
    }()
    
    let experienceY: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 290
        }
        else if DeviceType.IS_IPHONE_5 {
            return 330
        }
        else if DeviceType.IS_IPHONE_6 {
            return 390
        }
        else if DeviceType.IS_IPHONE_6P {
            return 440
        }
        return 290
    }()
    
    lazy var experienceButton: UIButton = {
       //let experience = UIButton.withType(UIButtonType.system)
        let experience = UIButton(type: .system)
        experience.layer.cornerRadius = self.experienceButtonSize / 2
        experience.setTitle("Experience", for: UIControlState())
        experience.backgroundColor = UIColor.appOrangeColor()
        experience.setTitleColor(UIColor.white, for: UIControlState())
        experience.addTarget(self, action: #selector(QFDashboardViewController.pushToExperience(_:)), for: UIControlEvents.touchUpInside)
        return experience
    }()
    
    lazy var experienceMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation?.fromValue = self.view.frame.size.height
        springAnimation?.toValue = self.experienceY
        springAnimation?.springBounciness = 20
        springAnimation?.springSpeed = 15
        springAnimation?.dynamicsTension = 200
        return springAnimation!
    }()
    
    //MARK: - Personal
    
    let personalButtonSize: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 90
        }
        else if DeviceType.IS_IPHONE_5 {
            return 90
        }
        else if DeviceType.IS_IPHONE_6 {
            return 110
        }
        else if DeviceType.IS_IPHONE_6P {
            return 140
        }
        
        return 90
    }()
    
    let personalX: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 180
        }
        else if DeviceType.IS_IPHONE_5 {
            return 170
        }
        else if DeviceType.IS_IPHONE_6 {
            return 210
        }
        else if DeviceType.IS_IPHONE_6P {
            return 215
        }
        return 180
    }()
    
    var personalY: CGFloat = {
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return 330
        }
        else if DeviceType.IS_IPHONE_5 {
            return 380
        }
        else if DeviceType.IS_IPHONE_6 {
            return 460
        }
        else if DeviceType.IS_IPHONE_6P {
            return 520
        }
        return 320
    }()
    
    lazy var personalButton: UIButton = {
        //let personal = UIButton.withType(UIButtonType.system)
        let personal = UIButton(type: .system)
        personal.layer.cornerRadius = self.personalButtonSize / 2
        personal.setTitle("Personal", for: UIControlState())
        personal.backgroundColor = UIColor.appBlueColor()
        personal.setTitleColor(UIColor.white, for: UIControlState())
        personal.addTarget(self, action: #selector(QFDashboardViewController.pushToPersonal(_:)), for: UIControlEvents.touchUpInside)
        return personal
    }()
    
    lazy var personalMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation?.fromValue = self.view.frame.size.height
        springAnimation?.toValue = self.personalY
        springAnimation?.springBounciness = 20
        springAnimation?.springSpeed = 14
        springAnimation?.dynamicsTension = 230
        return springAnimation!
    }()
    
    func animationInit() {
        self.skillMoveAnimation.beginTime = CACurrentMediaTime() + 0.1
        self.experienceMoveAnimation.beginTime = CACurrentMediaTime() + 0.2
        self.personalMoveAnimation.beginTime = CACurrentMediaTime() + 0.4
        
        self.projectButton.frame = CGRect(x: self.projectButtonX, y: self.view.frame.size.height, width: self.projectButtonSize, height: self.projectButtonSize)
        self.skillButton.frame = CGRect(x: self.skillButtonX, y: self.view.frame.size.height, width: self.skillButtonSize, height: self.skillButtonSize)
        self.experienceButton.frame = CGRect(x: self.experienceX, y: self.view.frame.size.height, width: self.experienceButtonSize, height: self.experienceButtonSize)
        self.personalButton.frame = CGRect(x: self.personalX, y: self.view.frame.size.height, width: self.personalButtonSize, height: self.personalButtonSize)
    }
    
    func showAnimationAtPage2() {
        if !self.page2View.subviews.contains(self.projectButton) {
            
            animationInit()
            
            self.page2View.addSubview(self.projectButton)
            self.projectButton.pop_add(self.projectMoveAnimation, forKey:"projectAnimation")
        
            self.page2View.addSubview(self.skillButton)
            self.skillButton.pop_add(self.skillMoveAnimation, forKey: "skillAnimation")
        
            self.page2View.addSubview(self.experienceButton)
            self.experienceButton.pop_add(self.experienceMoveAnimation, forKey: "experienceButtonAnimation")
        
            self.page2View.addSubview(self.personalButton)
            self.personalButton.pop_add(self.personalMoveAnimation, forKey: "personalAnimation")
        }
    }
    
    func removePage2View() {
        for view in self.page2View.subviews {
            view.removeFromSuperview()
        }
    }
    
    // MARK: - ScrollView Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == self.view.frame.size.height {
            showAnimationAtPage2()
        }
        else {
            removePage2View()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
            setIndicator(0)
        }
        else if scrollView.contentOffset.y == self.view.frame.size.height {
            setIndicator(1)
        }
        else if scrollView.contentOffset.y == self.view.frame.size.height * 2 {
            setIndicator(2)
        }
    }
    
    
    // MARK: - UIViewControllerAnimatedTransitioning Delegate
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push {
            return self.pushAnimator
        }
        else if operation == UINavigationControllerOperation.pop {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            return self.popAnimator
        }
        else {
            return nil
        }
    }
    
    
    // MARK: - UIActionEvent
    func pushToProject(_ sender: UIButton) {
        let projectViewController: QFProjectViewController = self.storyboard?.instantiateViewController(withIdentifier: "QFProjectViewController") as! QFProjectViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appDarkGrayColor()
            nav.pushViewController(projectViewController, animated: true)
        }
    }
    
    func pushToSkill(_ sender: UIButton) {
        let skillViewController: QFSkillViewController = self.storyboard?.instantiateViewController(withIdentifier: "QFSkillViewController") as! QFSkillViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appGreenColor()
            nav.pushViewController(skillViewController, animated: true)
        }
    }
    
    func pushToExperience(_ sender: UIButton) {
        let experienceViewController: QFExperienceViewController = self.storyboard?.instantiateViewController(withIdentifier: "QFExperienceViewController") as! QFExperienceViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appOrangeColor()
            nav.pushViewController(experienceViewController, animated: true)
        }
    }
    
    func pushToPersonal(_ sender: UIButton) {
        let personalViewController: QFPersonalViewController = self.storyboard?.instantiateViewController(withIdentifier: "QFPersonalViewController") as! QFPersonalViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appBlueColor()
            nav.pushViewController(personalViewController, animated: true)
        }
    }
    
    //MARK : Image
    
    @IBAction func previewButtonPress(_ sender: UIButton) {
        let imageInfo = JTSImageInfo()
        imageInfo.image = UIImage(named:"photo\(sender.tag)")
        imageInfo.referenceRect = sender.frame
        imageInfo.referenceView = sender.superview
        imageInfo.referenceContentMode = sender.contentMode
        let imageViewer: JTSImageViewController = JTSImageViewController(imageInfo: imageInfo, mode: JTSImageViewControllerMode.image, backgroundStyle: JTSImageViewControllerBackgroundOptions.blurred)
        needToHideNav = false
//        imageViewer.showFromViewController(self.navigationController, transition: JTSImageViewControllerTransition.fromOriginalPosition)
        imageViewer.show(from: self.navigationController, transition: JTSImageViewControllerTransition.fromOriginalPosition)
    }
    
    //MARK: - indicator
    
    @IBOutlet weak var page1Indicator: UIView!
    @IBOutlet weak var page2Indicator: UIView!
    @IBOutlet weak var page3Indicator: UIView!
    @IBOutlet weak var page1HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var page2HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var page3HeightConstraint: NSLayoutConstraint!
    func setIndicator(_ page: Int) {
        let currentColor = UIColor(red: 127 / 255, green: 127 / 255, blue: 127 / 255, alpha: 1)
        let nextColor = UIColor(red: 166 / 255, green: 166 / 255, blue: 166 / 255, alpha: 1)
        let lastColor = UIColor(red: 204 / 255, green: 204 / 255, blue: 204 / 255, alpha: 1)
        if page == 0 {
            self.page1HeightConstraint.constant = 10
            self.page2HeightConstraint.constant = 8
            self.page3HeightConstraint.constant = 6
            self.page1Indicator.layer.cornerRadius = 5.0
            self.page2Indicator.layer.cornerRadius = 4.0
            self.page3Indicator.layer.cornerRadius = 3.0
            self.page1Indicator.backgroundColor = currentColor
            self.page2Indicator.backgroundColor = nextColor
            self.page3Indicator.backgroundColor = lastColor
        }
        else if page == 1 {
            self.page1HeightConstraint.constant = 8
            self.page2HeightConstraint.constant = 10
            self.page3HeightConstraint.constant = 8
            self.page1Indicator.layer.cornerRadius = 4.0
            self.page2Indicator.layer.cornerRadius = 5.0
            self.page3Indicator.layer.cornerRadius = 4.0
            self.page1Indicator.backgroundColor = nextColor
            self.page2Indicator.backgroundColor = currentColor
            self.page3Indicator.backgroundColor = nextColor
        }
        else if page == 2 {
            self.page1HeightConstraint.constant = 6
            self.page2HeightConstraint.constant = 8
            self.page3HeightConstraint.constant = 10
            self.page1Indicator.layer.cornerRadius = 3.0
            self.page2Indicator.layer.cornerRadius = 4.0
            self.page3Indicator.layer.cornerRadius = 5.0
            self.page1Indicator.backgroundColor = lastColor
            self.page2Indicator.backgroundColor = nextColor
            self.page3Indicator.backgroundColor = currentColor
        }
    }
}
