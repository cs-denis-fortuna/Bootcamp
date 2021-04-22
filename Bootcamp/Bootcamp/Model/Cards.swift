//
//  Cards.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

struct CardSetCards: Decodable {
    let cards: [Card]
}

struct SingleCard: Decodable {
    let card: Card
}

struct Card: Codable {
    let name: String?              //cardName
    let types: [String]?           //list of card types
    let set: String?               //set id
    let setName: String?           //set name
    let imageUrl: String?          // image Url
    let id: String?                //card id
}
