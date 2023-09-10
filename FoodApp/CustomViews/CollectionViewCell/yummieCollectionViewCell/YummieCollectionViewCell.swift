//
//  YummieCollectionViewCell.swift
//  FoodApp
//
//  Created by K on 07/09/2023.
//

import UIKit

class YummieCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: YummieCollectionViewCell.self)
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var calories: UILabel!

    @IBOutlet var title: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func setup(dish : Dish){
        title.text = dish.title
        imageView.kf.setImage(with: dish.image.asUrl)
        calories.text = dish.formattedCalories
        descriptionLabel.text = dish.description
   
        
    }
}
