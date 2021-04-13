//
//  CardSet.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

struct Sets: Decodable {
    let sets: [CardSet]
}

struct CardSet: Decodable {
    let code: String?
    let name: String?
    let type: String?
    let border: String?
    let mkmId: Int?
    let mkmName: String?
    let releaseDate: String?
    let magicCardsInfoCode: String?
    let block: String?
    let onlineOnly: Bool?
}
