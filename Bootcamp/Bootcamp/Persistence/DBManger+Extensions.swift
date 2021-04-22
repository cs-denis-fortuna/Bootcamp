//
//  DBManger+Extensions.swift
//  Bootcamp
//
//  Created by denis.fortuna on 22/04/21.
//

import Foundation

extension DBManager: CardsCollectionViewProtocol {
    
    func fetchCards<T>(responseType: T.Type,
                       cardSet: CardSet?,
                       callback: @escaping (Result<T, MagicError>) -> Void) where T : Decodable {
        

    }
}
