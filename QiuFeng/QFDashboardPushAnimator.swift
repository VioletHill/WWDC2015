//
//  QFDashboardPushAnimator.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFDashboardPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.8
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let to = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let from = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        var fromView: UIView? = nil
        if let toViewController = to as? QFProjectViewController {
            if let fromController = from as? QFDashboardViewController {
                fromView = fromController.projectButton
            }
        }
        else if let toViewController = to as? QFExperienceViewController {
            if let fromController = from as? QFDashboardViewController {
                fromView = fromController.experienceButton
            }
        }
        else if let toViewController = to as? QFSkillViewController {
            if let fromController = from as? QFDashboardViewController {
                fromView = fromController.skillButton
            }
        }
        else if let toViewController = to as? QFPersonalViewController {
            if let fromController = from as? QFDashboardViewController {
                fromView = fromController.personalButton
            }
        }
        else {
            fromView = from?.view
        }
        
        if let toView = to?.view {
            transitionContext.containerView().addSubview(toView)
            to?.view.alpha = 0
        }
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
                fromView?.transform = CGAffineTransformMakeScale(5.0, 5.0)
                to?.view.alpha = 1
            },
            completion: { (finish: Bool) -> Void in

                fromView?.transform = CGAffineTransformIdentity
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
}
