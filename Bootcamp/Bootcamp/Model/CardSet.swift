//
//  CardSet.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

struct CardSet: Codable {
    let code: String?
    let name: String?
    let block: String?
    let type: String?
    let border: String?
    let releaseDate: String?
    let magicCardsInfoCode: String?
    let booster: [[String]]?
}
