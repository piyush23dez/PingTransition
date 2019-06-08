//
//  PingTransitionAnimator.swift
//  PingTransition
//
//  Created by Piyush Sharma on 5/9/17.
//  Copyright © 2017 Piyush Sharma. All rights reserved.
//

import Foundation
import UIKit


class PingTransitionAnimator: NSObject {
    weak var transitionContext: UIViewControllerContextTransitioning?
}

extension PingTransitionAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
<<<<<<< HEAD
        return 0.3
=======
        return 0.5
>>>>>>> f2eba12176c5e82029e6c67924e91d3e9d5168d1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //1
        self.transitionContext = transitionContext
        //2
        let containerView = transitionContext.containerView
        
        let fromViewController = transitionContext.viewController(forKey: .from) as? ViewController
        let toViewController = transitionContext.viewController(forKey: .to) as? ViewController
        //3
        containerView.addSubview((toViewController?.view)!)
        
        if let button = fromViewController?.button {
            //4
            let circleMaskPathInitial = UIBezierPath(ovalIn: (button.frame))
            let extremePoint = CGPoint(x: (button.center.x) - 0, y: button.center.y - (toViewController?.view.bounds)!.height)
            let radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y))
            let circleMaskPathFinal = UIBezierPath(ovalIn: button.frame.insetBy(dx: -radius, dy: -radius))
            
            //5
            let maskLayer = CAShapeLayer()
            maskLayer.path = circleMaskPathFinal.cgPath
            toViewController?.view.layer.mask = maskLayer
            
            //6
            let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            maskLayerAnimation.fromValue = circleMaskPathInitial.cgPath
            maskLayerAnimation.toValue = circleMaskPathFinal.cgPath
            maskLayerAnimation.duration = self.transitionDuration(using: transitionContext)
            maskLayerAnimation.delegate = self
            maskLayer.add(maskLayerAnimation, forKey: "path")
        }
    }
}

extension PingTransitionAnimator: CAAnimationDelegate {

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled)
        self.transitionContext?.viewController(forKey: .from)?.view.layer.mask = nil
    }
}
