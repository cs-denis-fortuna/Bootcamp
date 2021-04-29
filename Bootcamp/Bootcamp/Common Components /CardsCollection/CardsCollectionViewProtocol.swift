//
//  CardsCollectionViewProtocol.swift
//  Bootcamp
//
//  Created by denis.fortuna on 22/04/21.
//

import Foundation

protocol CardsCollectionViewProtocol {
    func fetchCards<T: Decodable>(responseType: T.Type,
                                  cardSet: CardSet?,
                                  callback: @escaping (Result<T, MagicError>) -> Void)
}
