//
//  CardView.swift
//  Optimin
//
//  Created by Reynaldi Wijaya on 31/03/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {
    var cornerRadius: CGFloat = 8
    var shadowOfSetWidth: CGFloat = 0
    var shadowOfSetHeight : CGFloat = 5
    
    var shadowColour : UIColor = UIColor.black
    var shadowOpacity : Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColour.cgColor
        layer.shadowOffset = CGSize(width: shadowOfSetWidth, height: shadowOfSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }

}
