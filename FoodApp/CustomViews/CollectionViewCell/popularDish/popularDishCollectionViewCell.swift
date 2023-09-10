//
//  popularDishCollectionViewCell.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit

class popularDishCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: popularDishCollectionViewCell.self)
  
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var calories: UILabel!

    @IBOutlet var descriptionLabel: UILabel!
    
    func setup(dish : Dish){
        titleLabel.text = dish.title
        imageView.kf.setImage(with: dish.image.asUrl)
        calories.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 10
        
    }
}
