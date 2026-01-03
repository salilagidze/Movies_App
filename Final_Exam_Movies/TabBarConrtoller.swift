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
    }
    private func setUpController() {
        
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home",image: UIImage(systemName: "house"),tag: 0)
        let homeNavigation = UINavigationController(rootViewController: homeVC)
        
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(title: "Search",image: UIImage(systemName: "magnifyingglass"),tag: 1
        )
        let searchNavigation = UINavigationController(rootViewController: searchVC)
        
        let favoritesVC = FavoritesVC()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "bookmark.fill"), tag: 2)
        let favNavigation = UINavigationController(rootViewController: favoritesVC)
        
        let contactVC = ContactVC()
        contactVC.tabBarItem = UITabBarItem(title: "Contact", image: UIImage(systemName: "person.fill"), tag: 3)
        let contactNavigation = UINavigationController(rootViewController: contactVC)
        
        self.viewControllers = [homeNavigation, searchNavigation, favNavigation, contactNavigation]
    }
    
}
