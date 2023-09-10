//
//  StringExtension.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit

extension String {
    var asUrl : URL?{
        return URL(string: self)
    }
    
}
