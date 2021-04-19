//
//  MainCoordinator.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

final class MainCoordinator: Coordinator {
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init() {
        navigationController = nil
        currentViewController = nil
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let mainTabBarControler = MainTabBarControler()
        mainTabBarControler.viewControllers = setupViewControllers()
        mainTabBarControler.tabBar.items?[0].title = "Expansions"
        mainTabBarControler.tabBar.items?[1].title = "Favorites"
        mainTabBarControler.coordinator = self
        return mainTabBarControler
    }
    
    private func setupViewControllers() -> [UIViewController] {
        let favoriteCollection = FavoriteCoordinator().start(with: .push)
        let expansionList = ExpansionCoordinator().start(with: .push)
        return [expansionList, favoriteCollection]
    }
}
