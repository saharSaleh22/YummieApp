//
//  ListDishesViewController.swift
//  FoodApp
//
//  Created by K on 07/09/2023.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var category : DishesCategory!
    var dishes : [Dish] = [
        .init(id: "id1", title: "cheese cake", image: "https://images.unsplash.com/photo-1687030048213-f7ee73509597?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2564&q=80", description: "palestinian dish", calories: 44),
        .init(id: "id1", title: "Salmon", image: "https://images.unsplash.com/photo-1627308594171-ebd99b564ff6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2535&q=80", description: "palestinian dish", calories: 44),
        .init(id: "id1", title: "Salad", image: "https://images.unsplash.com/photo-1546793665-c74683f339c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80", description: "palestinian dish", calories: 44)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        title = category.title
    }
    private func registerCells (){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }

  
}

extension ListDishesViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish : dishes[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
