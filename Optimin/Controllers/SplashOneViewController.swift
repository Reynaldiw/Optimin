//
//  SplashOneViewController.swift
//  Optimin
//
//  Created by Reynaldi Wijaya on 31/03/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class SplashOneViewController: UIViewController {

    let backgroundView = UIImageView()
    
    override func viewWillAppear(_ animated: Bool) {
        setBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
    }
    
    func setBackground() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundView.image = UIImage(named: "backgroundImage")
        view.sendSubviewToBack(backgroundView)
    }

}
