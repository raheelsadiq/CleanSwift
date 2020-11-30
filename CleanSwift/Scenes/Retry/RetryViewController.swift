//
//  RetryViewController.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 30/11/2020.
//

import UIKit
import Lottie

class RetryViewController: UIViewController {
    
    @IBOutlet weak var lottieView: UIView!
    @IBOutlet weak var retryButton: UIButton!{
        didSet{
            let greenColor = UIColor(red: 115/255.0, green: 184/255.0, blue: 182/255.0, alpha: 1)
            retryButton.layer.cornerRadius = 6
            retryButton.layer.borderWidth = 1
            retryButton.layer.borderColor = greenColor.cgColor
            retryButton.setTitle("RETRY", for: .normal)
            retryButton.setTitleColor(greenColor, for: .normal)
        }
    }

    var retryCalled:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showLottieAnimation()
    }
    
    private let lottieAnimationView = AnimationView.init(name: "retry")

    private func showLottieAnimation() {

        lottieAnimationView.frame = CGRect(x: 0, y: -60, width: lottieView.frame.size.width, height: lottieView.frame.size.height)
        lottieAnimationView.contentMode = .center
        lottieAnimationView.loopMode = .loop
                
        lottieView.addSubview(lottieAnimationView)
    }
    
    func animate(){
        lottieAnimationView.play()
    }
    
    func stopAnimating(){
        lottieAnimationView.stop()
    }
    
    @IBAction func retryAction(){
        retryCalled?()
    }
}
