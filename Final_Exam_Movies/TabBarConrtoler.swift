mport UIKit

class TabBarConrtoler: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllers()
        // Do any additional setup after loading the view.
    }
    private func setUpControllers() {

        // Home
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home",image: UIImage(systemName: "house"),tag: 0)
        let homeNav = UINavigationController(rootViewController: homeVC)

        // Search
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(title: "Search",image: UIImage(systemName: "magnifyingglass"),tag: 1
        )
        let searchNav = UINavigationController(rootViewController: searchVC)

        // Favorites
        let favoritesVC = FavoritesVC()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "bookmark.fill"), tag: 2)
        let favNav = UINavigationController(rootViewController: favoritesVC)

        self.viewControllers = [homeNav, searchNav, favNav]
    }

}