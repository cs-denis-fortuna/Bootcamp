//
//  FavoriteCoordinator.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

final class FavoriteCoordinator: CardsCoordinatorProtocol {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
//        navigationController.applyCustomAppearence()
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let cardsCollection = CardsCollectionViewController()
        cardsCollection.coordinator = self
        show(cardsCollection, with: .push)
        return cardsCollection
    }
    
    func didSelectCard(_ cardId: String) {
        
    }
}
