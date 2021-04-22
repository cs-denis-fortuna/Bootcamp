//
//  NetworkManager+Extensions.swift
//  Bootcamp
//
//  Created by denis.fortuna on 22/04/21.
//

import Foundation

extension NetworkManager: CardsCollectionViewProtocol {
    
    func fetchCards<T>(responseType: T.Type,
                       cardSet: CardSet?,
                       callback: @escaping (Result<T, MagicError>) -> Void) where T : Decodable {
        
        guard let cardSetId = cardSet?.code else { return }
        let service = MagicService.cardsFromSet(setId: cardSetId)
        
        request(service: service, responseType: responseType) { (result) in
            callback(result)
        }
    }
}
