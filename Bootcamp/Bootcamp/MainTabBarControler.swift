//
//  MainTabBarControler.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import UIKit

class MainTabBarControler: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let expansionList = generateNavigationCiontroller(ExpansionListViewController(), title: "Expansions")
        let expansionCollection = generateNavigationCiontroller(ExpansionsCollectionViewController(), title: "Favorites")
        UINavigationBar.appearance().prefersLargeTitles = true
        viewControllers = [expansionList, expansionCollection]
    }
    
    func generateNavigationCiontroller(_ viewController: UIViewController, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = title
        return navigationController
    }
}
