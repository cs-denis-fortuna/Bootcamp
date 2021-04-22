//
//  CardsCoordinatorProtocol.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import Foundation

protocol CardsCoordinatorProtocol: Coordinator {
    func didSelectCard(_ cardId: Card)
}
