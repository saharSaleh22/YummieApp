//
//  OnboardingCollectionViewCell.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCollectionViewCell.self)// "OnboardingCollectionViewCell"
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var slideImageView: UIImageView!
    
    func setup(_ slide : OnboardingSlide){
        slideImageView.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}
