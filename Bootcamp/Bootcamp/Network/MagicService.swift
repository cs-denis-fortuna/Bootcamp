//
//  MagicService.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

enum MagicService {
    case sets
    case booster(setId: String)
}

extension MagicService: ServiceProtocol {
    var path: String {
        switch self {
        case .sets:
            return "https://api.magicthegathering.io/v1/sets"
        case .booster(let id):
            return "https://api.magicthegathering.io/v1/sets/\(id)/booster"
        }
    }
}


