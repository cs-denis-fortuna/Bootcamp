//
//  Card.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

struct Card: Codable {
    let name: String?
    let names: [String]?
    let manaCost: String?
    let cmc: Int?
    let colors: [String]?
    let colorIdentity: [String]?
    let type: String?
    let supertypes: [String]?
    let types: [String]?
    let subtypes: [String]?
    let rarity: String?
    let set: String?
    let text: String?
    let artist: String?
    let number: String?
    let power: String?
    let toughness: String?
    let layout: String?
    let multiverseid: Int?
    let imageURL: String?
    let rulings: [[String:String]]?
    let foreignNames: [[String:String]]?
    let printings: [String]?
    let originalText: String?
    let originalType: String?
    let id: String?
    let flavor: String?
}
