//
//  ExpansionCoordinator.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

final class ExpansionCoordinator: Coordinator {
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let networkManager = NetworkManager()
        let expansionList = ExpansionListViewController(networkManager: networkManager)
        expansionList.coordinator = self
        navigationController?.viewControllers = [expansionList]
        navigationController?.navigationBar.barStyle = .black
        guard let navController = navigationController else { return UIViewController() }
        return navController
    }
}

// MARK: ExpansionListViewController events
extension ExpansionCoordinator: CardsCoordinatorProtocol {
    func didSelectExpansion(_ expansion: CardSet) {
        let cardsSource = NetworkManager()
        let cardsCollection = CardsCollectionViewController(cardsSource: cardsSource, cardSet: expansion)
        cardsCollection.coordinator = self
        show(cardsCollection, with: .push)
    }
}

// MARK: CardsCollectionViewController events
extension ExpansionCoordinator {
    func didSelectCard(withCards cards: [Card], selectedCard: Card, andIndexPath indexPath: IndexPath){
        let cardDetailViewController = CardDetailViewController(cards: cards, currentCard: selectedCard, indexPath: indexPath)
        show(cardDetailViewController, with: .present(nil))
    }
}
