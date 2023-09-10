//
//  DishDetailViewController.swift
//  FoodApp
//
//  Created by K on 07/09/2023.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet var DishImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var caloriesLabel: UILabel!
    
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    var dish : Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

        // Do any additional setup after loading the view.
    }
    private func populateView(){
        DishImageView.kf.setImage(with: dish.image.asUrl)
        caloriesLabel.text = dish.formattedCalories
        titleLabel.text = dish.title
        descriptionLabel.text = dish.description
        
    }

    @IBAction func placeOrderTapped(_ sender: Any) {
      
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        quantityLabel.text = String((Int(quantityLabel.text!) ?? 0)+1)
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        quantityLabel.text = String((Int(quantityLabel.text!) ?? 0)-1)
    }
}
