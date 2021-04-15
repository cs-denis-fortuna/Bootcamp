//
//  FavoriteCoordinator.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

final class FavoriteCoordinator: CardsCoordinatorProtocol {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let cardsCollection = CardsCollectionViewController()
        cardsCollection.coordinator = self
        navigationController?.viewControllers = [cardsCollection]
        guard let navController = navigationController else { return UIViewController() }
        return navController
    }
    
    func didSelectCard(_ cardId: String) {
        
    }
}
