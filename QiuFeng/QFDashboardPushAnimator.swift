//
//  QFDashboardPushAnimator.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFDashboardPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
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
            transitionContext.containerView.addSubview(toView)
            to?.view.alpha = 0
        }
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { () -> Void in
                fromView?.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
                to?.view.alpha = 1
            },
            completion: { (finish: Bool) -> Void in

                fromView?.transform = CGAffineTransform.identity
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
