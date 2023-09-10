//
//  UIviewExtension.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit

extension UIView {
  @IBInspectable  var cornerRadius : CGFloat {
        get{ return cornerRadius}
        set{ self.layer.cornerRadius = newValue}
    }
    
    
}
