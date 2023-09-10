//
//  OnboardingViewController.swift
//  FoodApp
//
//  Created by K on 06/09/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var onboardingCollectionView: UICollectionView!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    var slides : [OnboardingSlide] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage

            if currentPage == slides.count - 1{
                nextBtn.setTitle("Get Started", for: .normal)
            }
            else{
                nextBtn.setTitle("Next", for: .normal)

            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        slides = [
                  OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "fast-food")),
                  OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "pancake")),
                  OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "chef")),
                  OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide4"))
              ]
        pageControl.numberOfPages = slides.count
    }
    

    @IBAction func NextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true , completion: nil)
            print("go to the home page")
        }
        else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

    }
    

}

extension OnboardingViewController :UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height )
       
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
//        pageControl.currentPage = currentPage
    }
}

