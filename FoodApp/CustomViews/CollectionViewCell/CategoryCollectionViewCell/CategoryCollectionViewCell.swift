//
//  CategoryCollectionViewCell.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit
import Kingfisher
class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet var CategoryTitle: UILabel!
    @IBOutlet var CategoryImage: UIImageView!
    
    func setup(category : DishesCategory){
        CategoryTitle.text = category.title
        CategoryImage.kf.setImage(with: category.image.asUrl)
        
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

}
