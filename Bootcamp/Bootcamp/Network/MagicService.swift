//
//  MagicService.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

enum MagicService: ServiceProtocol {
    case sets
    case cardsFromSet(setId: String)
    case cardFromId(cardId: String)
    
    var path: String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.magicthegathering.io"
        switch self {
        case .cardFromId(let cardId):
            components.path = "/v1/cards"
            components.queryItems = [URLQueryItem(name: "id", value: cardId)]
        case .cardsFromSet(let setId):
            components.path = "/v1/cards"
            components.queryItems = [URLQueryItem(name: "set", value: setId)]
        case .sets:
            components.path = "/v1/sets"
        }
        guard let componentString = components.string else { return "" }
        return componentString
    }
}
