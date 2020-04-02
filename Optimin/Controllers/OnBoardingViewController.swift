//
//  OnBoardingViewController.swift
//  Optimin
//
//  Created by Reynaldi Wijaya on 02/04/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, OnBoardingPageViewControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var getStartedButton: UIButton! {
        didSet {
            getStartedButton.layer.cornerRadius = 8
            getStartedButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton! {
        didSet {
            skipButton.isHidden = true
        }
    }
    
    //Properties
    var onBoardingPageViewController: OnBoardingPageViewController?
    let backgroundImageView = UIImageView()
    let pagesBackgroundImageView = ["bgBoardingImage1", "bgBoardingImage2", "bgBoardingImage3"]
    
    // Actions
    @IBAction func skipButtonTapped(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedOnBoarding")
        moveToMainScreen()
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = onBoardingPageViewController?.currentIndex {
            switch index {
            case 0...1:
                onBoardingPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedOnBoarding")
                moveToMainScreen()
                
            default:
                break
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if let index = onBoardingPageViewController?.currentIndex {
            switch index {
            case 0:
                getStartedButton.setTitle("Get Started", for: .normal)
                skipButton.isHidden = true
                changeImageBackground(at: 0)
                
            case 1:
                getStartedButton.setTitle("Get Started", for: .normal)
                skipButton.isHidden = true
                changeImageBackground(at: 1)
                
            case 2:
                getStartedButton.setTitle("Sign in with Apple ID", for: .normal)
                skipButton.isHidden = false
                changeImageBackground(at: 2)
            default:
                break
            }
            
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? OnBoardingPageViewController {
            onBoardingPageViewController = pageViewController
            onBoardingPageViewController?.onBoardingDelegate = self
        }
    }
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        changeImageBackground(at: 0)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    func changeImageBackground(at index: Int) {
        backgroundImageView.image = UIImage(named: pagesBackgroundImageView[index])
    }
    
    func moveToMainScreen() {
        performSegue(withIdentifier: "goToMainScreen", sender: self)
    }
    
    

}
