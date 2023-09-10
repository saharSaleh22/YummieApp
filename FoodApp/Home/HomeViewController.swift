//
//  HomeViewController.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit
class HomeViewController: UIViewController {
    var categories : [DishesCategory]=[
        .init(title: "Breakfast", id: "id1", image: "https://cdn-icons-png.flaticon.com/512/2737/2737141.png"),
        .init(title: "Lunch", id: "id1", image: "https://cdn-icons-png.flaticon.com/512/11790/11790402.png"),
        .init(title: "Dinner", id: "id1", image:   "https://cdn-icons-png.flaticon.com/512/3274/3274083.png"),
        .init(title: "Sweets", id: "id1", image: "https://cdn-icons-png.flaticon.com/512/860/860919.png"),
        .init(title: "Drinks", id: "id1", image: "https://cdn-icons-png.flaticon.com/512/2738/2738730.png")
    ]
    var popularDishes : [Dish] = [
        .init(id: "id1", title: "cheese cake", image: "https://images.unsplash.com/photo-1687030048213-f7ee73509597?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2564&q=80", description: "palestinian dish", calories: 44),
        .init(id: "id1", title: "Salmon", image: "https://images.unsplash.com/photo-1627308594171-ebd99b564ff6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2535&q=80", description: "palestinian dish", calories: 44),
        .init(id: "id1", title: "Salad", image: "https://images.unsplash.com/photo-1546793665-c74683f339c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80", description: "palestinian dish", calories: 44)
    ]
    var yummie : [Dish] = [
        .init(id: "id1", title: "Burger", image: "https://images.unsplash.com/photo-1693915862455-a83d49302acc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2680&q=80", description: "By using delegate and data source patterns, you can keep your code organized, modular, and maintainable, as the responsibilities of handling data ", calories: 44),
        .init(id: "id1", title: "Sushi", image: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80", description: "palestinian dish", calories: 44),
        .init(id: "id1", title: "PanCake", image: "https://images.unsplash.com/photo-1554520735-0a6b8b6ce8b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2564&q=80", description: "palestinian dish", calories: 44)
    ]
 
    @IBOutlet var YummieCollectionView: UICollectionView!
    
    
    @IBOutlet var PopularDishesCollectionView: UICollectionView!
    @IBOutlet var FoodCategoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()

    }
    private func registerCells(){
        FoodCategoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        PopularDishesCollectionView.register(UINib(nibName: popularDishCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: popularDishCollectionViewCell.identifier)
        
        YummieCollectionView.register(UINib(nibName: YummieCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: YummieCollectionViewCell.identifier)
        
    }
    


}
extension HomeViewController : UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case FoodCategoryCollectionView :
            return categories.count
        case PopularDishesCollectionView :
            return popularDishes.count
        case YummieCollectionView :
            return yummie.count
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case FoodCategoryCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case PopularDishesCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularDishCollectionViewCell.identifier, for: indexPath) as! popularDishCollectionViewCell
            cell.setup(dish: popularDishes[indexPath.row])
            return cell
            
        case YummieCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YummieCollectionViewCell.identifier, for: indexPath) as! YummieCollectionViewCell
            cell.setup(dish: yummie[indexPath.row])
            return cell
        default :
            return UICollectionViewCell()
        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == FoodCategoryCollectionView{
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)

        } else{
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == PopularDishesCollectionView ? popularDishes[indexPath.row] : yummie[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("top inside PopularDishesCollectionView " , PopularDishesCollectionView.frame.width)
//        if collectionView == PopularDishesCollectionView{
//            print("inside PopularDishesCollectionView " , PopularDishesCollectionView.frame.width)
//            if indexPath.item == 0 || indexPath.item == 1 {
//                      return CGSize(width: PopularDishesCollectionView.frame.width, height: PopularDishesCollectionView.frame.height / 2)
//                  }else {
//                      return CGSize(width: PopularDishesCollectionView.frame.width, height: PopularDishesCollectionView.frame.height/3)
//                  }
//        }
//        return CGSize(width: PopularDishesCollectionView.frame.width, height: PopularDishesCollectionView.frame.height)
//
//
//    }
    
    
    
    
}
