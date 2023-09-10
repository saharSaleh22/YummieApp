//
//  Dish.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit

struct Dish {
    let id , title , image , description : String
    let calories : Int
    
    var formattedCalories:String{
        return ("\(calories) calories")
    }
}
