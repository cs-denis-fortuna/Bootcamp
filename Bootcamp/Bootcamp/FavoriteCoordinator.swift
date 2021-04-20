//
//  FavoriteCoordinator.swift
//  Bootcamp
//
//  Created by denis.fortuna on 16/04/21.
//

import UIKit

final class FavoriteCoordinator: CardsCoordinatorProtocol {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let dbManager = DBManager()
        let cardsCollection = CardsCollectionViewController(networkManager: nil, dbManager: dbManager, cardSet: nil)
        cardsCollection.coordinator = self
        navigationController?.viewControllers = [cardsCollection]
        guard let navController = navigationController else { return UIViewController() }
        return navController
    }
    
    func didSelectCard(_ cardId: Card) {
        
    }
}
