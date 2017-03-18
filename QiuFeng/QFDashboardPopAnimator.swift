//
//  QFDashboardPopAnimator.swift
//  QiuFeng
//
//  Created by Feng Qiu on 4/21/15.
//  Copyright (c) 2015 TongjiUniversity. All rights reserved.
//

import UIKit

class QFDashboardPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        if let toView = to?.view {
            transitionContext.containerView.addSubview(toView)
            to?.view.alpha = 0
        }
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { () -> Void in
                from?.view.alpha = 0
                to?.view.alpha = 1
            },
            completion: { (finish: Bool) -> Void in
                from?.view.alpha = 1
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
