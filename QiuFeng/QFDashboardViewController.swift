//
//  QFDashboardViewController.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFDashboardViewController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var dashboardAvatarImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var page2View: UIView!
    
    let pushAnimator = QFDashboardPushAnimator()
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide Status bar
        self.edgesForExtendedLayout = UIRectEdge.None;
        self.navigationController?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.dashboardAvatarImage.layer.cornerRadius = self.dashboardAvatarImage.layer.frame.size.width / 2
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Project Button
    
    let projectButtonSize: CGFloat = 120
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
        springAnimation.toValue = 100
        springAnimation.springBounciness = 15
        springAnimation.springSpeed = 20
        springAnimation.dynamicsTension = 200
        return springAnimation
    }()
    
    
    // MARK: - Skill Button
    
    let skillButtonSize: CGFloat = 140
    lazy var skillButton: UIButton = {
        let skill = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        skill.layer.cornerRadius = self.skillButtonSize / 2
        skill.setTitle("Skill", forState: UIControlState.Normal)
        skill.backgroundColor = UIColor.appGreenColor()
        skill.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        return skill
    }()
    
    lazy var skillMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation.fromValue = self.view.frame.size.height
        springAnimation.toValue = 150
        springAnimation.springBounciness = 20
        springAnimation.springSpeed = 15
        springAnimation.dynamicsTension = 80
        return springAnimation
    }()
    
    //MARK: - Experience Button
    
    let experienceSize: CGFloat = 100
    lazy var experienceButton: UIButton = {
       let experience = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        experience.layer.cornerRadius = self.experienceSize / 2
        experience.setTitle("Experience", forState: UIControlState.Normal)
        experience.backgroundColor = UIColor.appOrangeColor()
        experience.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        return experience
    }()
    
    lazy var experienceMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation.fromValue = self.view.frame.size.height
        springAnimation.toValue = 300
        springAnimation.springBounciness = 20
        springAnimation.springSpeed = 15
        springAnimation.dynamicsTension = 200
        return springAnimation
    }()
    
    //MARK: - Personal
    
    let personalSize: CGFloat = 90
    lazy var personalButton: UIButton = {
        let personal = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        personal.layer.cornerRadius = self.personalSize / 2
        personal.setTitle("Personal", forState: UIControlState.Normal)
        personal.backgroundColor = UIColor.appDarkGrayColor()
        personal.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        return personal
    }()
    
    lazy var personalMoveAnimation: POPSpringAnimation = {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        springAnimation.fromValue = self.view.frame.size.height
        springAnimation.toValue = 320
        springAnimation.springBounciness = 20
        springAnimation.springSpeed = 14
        springAnimation.dynamicsTension = 230
        return springAnimation
    }()
    
    func animationInit() {
        self.skillMoveAnimation.beginTime = CACurrentMediaTime() + 0.1
        self.experienceMoveAnimation.beginTime = CACurrentMediaTime() + 0.2
        self.personalMoveAnimation.beginTime = CACurrentMediaTime() + 0.4
        
        self.projectButton.frame = CGRectMake(50, self.view.frame.size.height, self.projectButtonSize, self.projectButtonSize)
        self.skillButton.frame = CGRectMake(150, self.view.frame.size.height, self.skillButtonSize, self.skillButtonSize)
        self.experienceButton.frame = CGRectMake(40, self.view.frame.size.height, self.experienceSize, self.experienceSize)
        self.personalButton.frame = CGRectMake(180, self.view.frame.size.height, self.personalSize, self.personalSize)
    }
    
    func showAnimationAtPage2() {
       
        
        if !self.page2View.subviews.contains(self.projectButton) {
            print("show animation at page2")
            
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
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Push {
            return self.pushAnimator
        }
        else {
            return nil
        }
    }
    
    
    // MARK: - UIActionEvent
    func pushToProject(sender: UIButton) {
        print("push to Project")
        let projectViewController: QFProjectViewController = self.storyboard?.instantiateViewControllerWithIdentifier("QFProjectViewController") as! QFProjectViewController
        if let nav = self.navigationController {
            nav.pushViewController(projectViewController, animated: true)
        }
    }
}
