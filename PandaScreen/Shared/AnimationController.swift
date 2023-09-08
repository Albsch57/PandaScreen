//
//  AnimationController.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//


import Foundation
import UIKit

class AnimationController: NSObject {
    
    private let animationDuration: Double
    private let animationType: AnimationType
    
    enum AnimationType {
        case present
        case dismiss
    }
    
    init(animationDuration: Double, animationType: AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = animationType
    }
    
}
extension AnimationController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to), let fromVC = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        
        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toVC.view)
            presentAnimation(with: transitionContext, viewToAnimate: toVC.view)
        case .dismiss:
            transitionContext.containerView.addSubview(toVC.view)
            transitionContext.containerView.addSubview(fromVC.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromVC.view)
        }
    }
    
    
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
//        let containerView = transitionContext.containerView
//               let startingFrame = CGRect(x: 0, y: -containerView.bounds.height, width: containerView.bounds.width, height: containerView.bounds.height)
//
//               viewToAnimate.frame = startingFrame
//
//               UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
//                   viewToAnimate.frame = containerView.bounds
//               }) { (_) in
//                   transitionContext.completeTransition(true)
//               }
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)

        let duration = transitionDuration(using: transitionContext)


        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    // .curveEaseInOut
    
    func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        
        
        let containerView = transitionContext.containerView
//                let endingFrame = CGRect(x: 0, y: -containerView.bounds.height, width: containerView.bounds.width, height: containerView.bounds.height)
//                
//                UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
//                    viewToAnimate.frame = endingFrame
//                }) { (_) in
//                    transitionContext.completeTransition(true)
//                }

        
    }
    
}
