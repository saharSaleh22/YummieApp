//
//  ListOrdersViewController.swift
//  FoodApp
//
//  Created by K on 07/09/2023.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var orders :[Order]=[
        .init(id: "1", quantity: "2", dish: .init(id: "id1", title: "cheese cake", image: "https://images.unsplash.com/photo-1687030048213-f7ee73509597?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2564&q=80", description: "palestinian dish", calories: 44)),
        .init(id: "1", quantity: "2", dish: .init(id: "id1", title: "cheese cake", image: "https://images.unsplash.com/photo-1687030048213-f7ee73509597?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2564&q=80", description: "palestinian dish", calories: 44)),
        .init(id: "1", quantity: "2", dish: .init(id: "id1", title: "cheese cake", image: "https://images.unsplash.com/photo-1687030048213-f7ee73509597?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2564&q=80", description: "palestinian dish", calories: 44)),
        .init(id: "1", quantity: "2", dish: .init(id: "id1", title: "cheese cake", image: "https://images.unsplash.com/photo-1687030048213-f7ee73509597?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2564&q=80", description: "palestinian dish", calories: 44))]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        title = "Orders"

    }
    
    private func registerCells (){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }


}

extension ListOrdersViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order : orders[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}
