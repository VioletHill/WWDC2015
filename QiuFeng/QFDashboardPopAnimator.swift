//
//  QFDashboardPopAnimator.swift
//  QiuFeng
//
//  Created by 邱峰 on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFDashboardPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let to = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let from = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        if let toView = to?.view {
            transitionContext.containerView().addSubview(toView)
            to?.view.alpha = 0
        }
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
                from?.view.alpha = 0
                to?.view.alpha = 1
            },
            completion: { (finish: Bool) -> Void in
                from?.view.alpha = 1
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }

}