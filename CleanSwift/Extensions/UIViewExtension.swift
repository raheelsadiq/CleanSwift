//
//  UIViewExtension.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import Foundation
import UIKit

struct Controllers {
    static let retryViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "RetryViewController") as! RetryViewController
    static let shimmeringViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ShimmeringViewController") as! ShimmeringViewController
}

extension UIView {
    
    //MARK: - Retry View
    func showRetryView(
        retry: (() -> Void)?
    ) {
        Controllers.retryViewController.animate()
        Controllers.retryViewController.view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        addSubview(Controllers.retryViewController.view)
        Controllers.retryViewController.retryCalled = {
            retry?()
        }
    }
    
    func  hideRetryView()  {
        Controllers.retryViewController.stopAnimating()
        Controllers.retryViewController.view.removeFromSuperview()
    }
    
    //MARK: - Shimmerview
    
    func startShimmering(){

        let light = UIColor(white: 0, alpha: 0.1).cgColor
        let dark = UIColor.black.cgColor
        
        let gradient = CAGradientLayer()
        gradient.colors = [dark, light, dark];
        gradient.frame = CGRect(x: -self.bounds.size.width, y: 0, width: 3 * self.bounds.size.width, height: self.bounds.size.height)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.525)
        gradient.locations = [0.4, 0.5, 0.6]
        self.layer.mask = gradient
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 1.5
        animation.repeatCount = HUGE
        gradient.add(animation, forKey: "shimmer")
    }
    
    func stopShimmering(){
        self.layer.mask = nil
    }
    
    func showShimmeringView(){
        Controllers.shimmeringViewController.view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        addSubview(Controllers.shimmeringViewController.view)
        Controllers.shimmeringViewController.shimmerViews = true
    }
    
    func hideshimmeringView(){
        Controllers.shimmeringViewController.view.removeFromSuperview()
        Controllers.shimmeringViewController.shimmerViews = false
    }

}
