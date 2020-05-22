//
//  AppExtensions.swift
//  intellicar
//
//  Created by Ketan on 28/01/20.
//  Copyright © 2020 Ketan Doiphode. All rights reserved.
//

import Foundation
import UIKit


// MARK: UIView

extension UIView
{
    
    /// Make Circular view
    func setCircleRadius()  {
        self.layer.cornerRadius = CGFloat(self.frame.width/2);
    }
    
    /// Add a border to existing view component
    /// - Parameters:
    ///   - borderColor: color to be shown
    ///   - borderWith: boldness of border to be rendered
     func addViewBorder(borderColor:CGColor,borderWith:CGFloat){
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = self.layer.cornerRadius

    }
    
    
    
}
