//
//  TabBarConrtoller.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//


import UIKit

class TabBarConrtoller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
        // Do any additional setup after loading the view.
    }
    private func setUpController() {

        // Home
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home",image: UIImage(systemName: "house"),tag: 0)
        let homeNavigation = UINavigationController(rootViewController: homeVC)

        // Search
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(title: "Search",image: UIImage(systemName: "magnifyingglass"),tag: 1
        )
        let searchNavigation = UINavigationController(rootViewController: searchVC)

        // Favorites
        let favoritesVC = FavoritesVC()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "bookmark.fill"), tag: 2)
        let favNavigation = UINavigationController(rootViewController: favoritesVC)

        self.viewControllers = [homeNavigation, searchNavigation, favNavigation]
    }

}
