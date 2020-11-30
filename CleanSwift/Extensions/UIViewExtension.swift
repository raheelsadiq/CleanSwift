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
}

extension UIView {
    
    //Temporary work
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
}
