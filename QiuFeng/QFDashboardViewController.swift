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
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarContainerView.backgroundColor = UIColor.appBlueColor()
        configNavigationBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.dashboardAvatarImage.layer.cornerRadius = self.dashboardAvatarImage.layer.frame.size.width / 2
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - navigation bar
    
    func configNavigationBar() {
        // Hide Status bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().shadowImage = UIImage()
        self.edgesForExtendedLayout = UIRectEdge.None;
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
        let project = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        project.layer.cornerRadius = self.projectButtonSize / 2
        project.setTitle("Project", forState: UIControlState.Normal)
        project.backgroundColor = UIColor.appBlueColor()
        project.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        project.addTarget(self, action:"pushToProject:", forControlEvents: UIControlEvents.TouchUpInside)
        return project
    }()
    
    lazy var projectMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation.fromValue = self.view.frame.size.height
        springAnimation.toValue = self.projectY
        springAnimation.springBounciness = 15
        springAnimation.springSpeed = 20
        springAnimation.dynamicsTension = 200
        return springAnimation
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
        let skill = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        skill.layer.cornerRadius = self.skillButtonSize / 2
        skill.setTitle("Skill", forState: UIControlState.Normal)
        skill.backgroundColor = UIColor.appGreenColor()
        skill.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        skill.addTarget(self, action: "pushToSkill:", forControlEvents: UIControlEvents.TouchUpInside)
        return skill
    }()
    
    lazy var skillMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation.fromValue = self.view.frame.size.height
        springAnimation.toValue = self.skillY
        springAnimation.springBounciness = 20
        springAnimation.springSpeed = 15
        springAnimation.dynamicsTension = 80
        return springAnimation
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
       let experience = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        experience.layer.cornerRadius = self.experienceButtonSize / 2
        experience.setTitle("Experience", forState: UIControlState.Normal)
        experience.backgroundColor = UIColor.appOrangeColor()
        experience.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        experience.addTarget(self, action: "pushToExperience:", forControlEvents: UIControlEvents.TouchUpInside)
        return experience
    }()
    
    lazy var experienceMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation.fromValue = self.view.frame.size.height
        springAnimation.toValue = self.experienceY
        springAnimation.springBounciness = 20
        springAnimation.springSpeed = 15
        springAnimation.dynamicsTension = 200
        return springAnimation
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
        let personal = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        personal.layer.cornerRadius = self.personalButtonSize / 2
        personal.setTitle("Personal", forState: UIControlState.Normal)
        personal.backgroundColor = UIColor.appDarkGrayColor()
        personal.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        personal.addTarget(self, action: "pushToPersonal:", forControlEvents: UIControlEvents.TouchUpInside)
        return personal
    }()
    
    lazy var personalMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation.fromValue = self.view.frame.size.height
        springAnimation.toValue = self.personalY
        springAnimation.springBounciness = 20
        springAnimation.springSpeed = 14
        springAnimation.dynamicsTension = 230
        return springAnimation
    }()
    
    func animationInit() {
        self.skillMoveAnimation.beginTime = CACurrentMediaTime() + 0.1
        self.experienceMoveAnimation.beginTime = CACurrentMediaTime() + 0.2
        self.personalMoveAnimation.beginTime = CACurrentMediaTime() + 0.4
        
        self.projectButton.frame = CGRectMake(self.projectButtonX, self.view.frame.size.height, self.projectButtonSize, self.projectButtonSize)
        self.skillButton.frame = CGRectMake(self.skillButtonX, self.view.frame.size.height, self.skillButtonSize, self.skillButtonSize)
        self.experienceButton.frame = CGRectMake(self.experienceX, self.view.frame.size.height, self.experienceButtonSize, self.experienceButtonSize)
        self.personalButton.frame = CGRectMake(self.personalX, self.view.frame.size.height, self.personalButtonSize, self.personalButtonSize)
    }
    
    func showAnimationAtPage2() {
       
        
        if !self.page2View.subviews.contains(self.projectButton) {

            
            animationInit()
            
            self.page2View.addSubview(self.projectButton)
            self.projectButton.pop_addAnimation(self.projectMoveAnimation, forKey:"projectAnimation")
        
            self.page2View.addSubview(self.skillButton)
            self.skillButton.pop_addAnimation(self.skillMoveAnimation, forKey: "skillAnimation")
        
            self.page2View.addSubview(self.experienceButton)
            self.experienceButton.pop_addAnimation(self.experienceMoveAnimation, forKey: "experienceButtonAnimation")
        
            self.page2View.addSubview(self.personalButton)
            self.personalButton.pop_addAnimation(self.personalMoveAnimation, forKey: "personalAnimation")
        }
    }
    
    func removePage2View() {
        for view in self.page2View.subviews {
            view.removeFromSuperview()
        }
    }
    
    // MARK: - ScrollView Delegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView.contentOffset.y == self.view.frame.size.height {
            showAnimationAtPage2()
        }
        else {
            removePage2View()
        }
    }
    
    
    // MARK: - UIViewControllerAnimatedTransitioning Delegate
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Push {
            return self.pushAnimator
        }
        else if operation == UINavigationControllerOperation.Pop {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            return self.popAnimator
        }
        else {
            return nil
        }
    }
    
    
    // MARK: - UIActionEvent
    func pushToProject(sender: UIButton) {
        let projectViewController: QFProjectViewController = self.storyboard?.instantiateViewControllerWithIdentifier("QFProjectViewController") as! QFProjectViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appBlueColor()
            nav.pushViewController(projectViewController, animated: true)
        }
    }
    
    func pushToSkill(sender: UIButton) {
        let skillViewController: QFSkillViewController = self.storyboard?.instantiateViewControllerWithIdentifier("QFSkillViewController") as! QFSkillViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appGreenColor()
            nav.pushViewController(skillViewController, animated: true)
        }
    }
    
    func pushToExperience(sender: UIButton) {
        let experienceViewController: QFExperienceViewController = self.storyboard?.instantiateViewControllerWithIdentifier("QFExperienceViewController") as! QFExperienceViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appOrangeColor()
            nav.pushViewController(experienceViewController, animated: true)
        }
    }
    
    func pushToPersonal(sender: UIButton) {
        let personalViewController: QFPersonalViewController = self.storyboard?.instantiateViewControllerWithIdentifier("QFPersonalViewController") as! QFPersonalViewController
        if let nav = self.navigationController {
            nav.navigationBar.barTintColor = UIColor.appDarkGrayColor()
            nav.pushViewController(personalViewController, animated: true)
        }
    }
}
