//
//  MagicService.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

enum MagicService {
    case sets
    case cardsFromSet(setId: String)
    case cardFromId(cardId: String)
}

extension MagicService: ServiceProtocol {
    var path: String {
        switch self {
        case .sets:
            //get all sets
            return "https://api.magicthegathering.io/v1/sets"
        case .cardsFromSet(let setId):
            //get all cards from specific set (by set code)
            return "https://api.magicthegathering.io/v1/sets/\(setId)/booster"
        case .cardFromId(let cardId):
            //get single card by card id
            return "https://api.magicthegathering.io/v1/cards/\(cardId)"
        }
    }
}


