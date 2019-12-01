//
//  CustomPresentationController.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/12/01.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import UIKit

class CustomPresentationViewController: UIPresentationController
{
    var overlayView = UIView()
    let margin = (x: CGFloat(30), y: CGFloat(220.0))
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }
        overlayView.frame = containerView.bounds
        overlayView.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(CustomPresentationViewController.overlayViewDidTouch(_:)))]
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.0
        containerView.insertSubview(overlayView, at: 0)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition:
            {[weak self] context in
                self?.overlayView.alpha = 0.7
            }, completion: nil)
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width - margin.x, height: parentSize.height - margin.y)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var presentedViewFrame = CGRect()
        let containerBounds = containerView!.bounds
        let childContentSize = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        
        presentedViewFrame.size = childContentSize
        presentedViewFrame.origin.x = margin.x / 2.0
        presentedViewFrame.origin.y = margin.y / 2.0
        
        return presentedViewFrame
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {[weak self] context in
            self?.overlayView.alpha = 0.0
            }, completion: nil)
    }
    
    override func containerViewWillLayoutSubviews() {
        
    }
    
    override func containerViewDidLayoutSubviews() {
         
    }
    
    @objc func overlayViewDidTouch(_ sender: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
