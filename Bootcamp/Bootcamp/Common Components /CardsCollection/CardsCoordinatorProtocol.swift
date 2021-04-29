//
//  CardsCoordinatorProtocol.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import Foundation

protocol CardsCoordinatorProtocol {
    func didSelectCard(withCards cards: [Card], selectedCard: Card, andIndexPath indexPath: IndexPath)
}
