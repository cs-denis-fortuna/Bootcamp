//
//  MainCoordinator.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

final class MainCoordinator: Coordinator {
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
//        navigationController.applyCustomAppearence()
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let mainTabBarControler = MainTabBarControler()
        mainTabBarControler.viewControllers = setupViewControllers()
        mainTabBarControler.coordinator = self
        
        show(mainTabBarControler, with: navigationType)
        return navigationController
    }
    
    private func setupViewControllers() -> [UIViewController] {
        let favoriteCollection = FavoriteCoordinator().start(with: .push)
        let expansionList = ExpansionCoordinator().start(with: .push)
        return [expansionList, favoriteCollection]
    }
}
