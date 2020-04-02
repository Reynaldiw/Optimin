//
//  SplashViewController.swift
//  Optimin
//
//  Created by Reynaldi Wijaya on 01/04/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var optiminLogoImageView: UIImageView!
    
    let background = UIImageView()
    
    override func viewWillAppear(_ animated: Bool) {
        setBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        setAnimationRotation()
    }
    
    func setAnimationRotation() {
        UIView.animate(withDuration: 3, delay: 0, options: .curveLinear, animations: {
            self.optiminLogoImageView.transform = CGAffineTransform.identity
            self.optiminLogoImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi * 0.999)
        }) { (finished) in
            UIView.animate(withDuration: 3, delay: 0, options: .curveLinear, animations: {
            self.optiminLogoImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi * 0.999 * 2)
            }) { (finished) in
                self.scaleDownAnimation()
            }
        }
    }
    
    func scaleDownAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.optiminLogoImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { (finished) in
            self.scaleUpAnimation()
        }
    }
    
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseIn, animations: {
            self.optiminLogoImageView.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { (finished) in
            self.moveToAnotherView()
        }
    }
    
    func moveToAnotherView() {
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        if let onBoardingViewController = storyboard.instantiateViewController(withIdentifier: "OnBoardingViewController") as? OnBoardingViewController {
            navigationController?.pushViewController(onBoardingViewController, animated: true)
            
        }
    }
    
    func setBackground() {
        view.addSubview(background)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        background.image = UIImage(named: "bgLaunch")
        view.sendSubviewToBack(background)
    }
    
}
