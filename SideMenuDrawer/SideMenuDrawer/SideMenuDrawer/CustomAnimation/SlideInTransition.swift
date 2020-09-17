//
//  SlideInTransition.swift
//  SideMenuDrawer
//
//  Created by Kevin Vishal Saldanha on 17/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let opacityView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        ///here fromVC is the HomeViewController and toVC is the MenuViewController
        guard let fromVC = transitionContext.viewController(forKey: .from), let toVC = transitionContext.viewController(forKey: .to) else {return}
        
        let containerView = transitionContext.containerView
        
        let finalWidth = containerView.bounds.size.width * 0.8
        let finalheight = containerView.bounds.size.height
        
        if isPresenting  {
            
            // add
            opacityView.alpha = 0.0
            opacityView.backgroundColor = .black
            containerView.addSubview(opacityView)
            opacityView.frame = containerView.bounds
            
            containerView.addSubview(toVC.view)
            toVC.view.frame = CGRect(x: -finalWidth, y: 0.0, width: finalWidth, height: finalheight)
        }
        
        //Slide in
        
        let transform = {
            //If we are trying to reset the transformation, so that the view appears as it did originally, you can simply set the transform back to the identity.
            //here since after dismiss of MenuViewController. We will set the transform so toVC goes back to -finalWidth
            self.opacityView.alpha = 0.5
            toVC.view.transform = CGAffineTransform(translationX: finalWidth, y: 0.0)
        }
        
        //Slide out
        
        let identity = {
            self.opacityView.alpha = 0.0
            fromVC.view.transform = .identity
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.isInteractive
        
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
    
}
