//
//  DishListTableViewCell.swift
//  FoodApp
//
//  Created by K on 07/09/2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static let identifier = String(describing: DishListTableViewCell.self)
  
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dishImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    func setup(dish :Dish) {
        dishImageView.kf.setImage(with: dish.image.asUrl)
        titleLabel.text = dish.title
        descriptionLabel.text = dish.description
        
    }
    
    func setup(order :Order) {
        dishImageView.kf.setImage(with: order.dish.image.asUrl)

        titleLabel.text = "\(order.dish.title) x \(order.quantity)"
        descriptionLabel.text = order.dish.description
        
        
    }
}
