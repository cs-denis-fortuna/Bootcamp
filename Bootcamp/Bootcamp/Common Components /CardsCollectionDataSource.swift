//
//  CardsCollectionDataSource.swift
//  Bootcamp
//
//  Created by denis.fortuna on 19/04/21.
//

import UIKit

class CardsCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var cards: [Card]
    private var groupedCards: [String: [Card]] = [:]
    private var cardsTypeList: [String] = [""]
    
    init(cards: [Card]) {
        super.init()
        self.cards = cards
        groupCardsByType()
        groupeCardsTypes()
    }
    
    private func groupCardsByType() {
        groupedCards = Dictionary(grouping: cards) {
            guard let name = $0.name else { return "" }
            return name
        }
    }
    
    private func groupeCardsTypes() {
        cardsTypeList = groupedCards.map{$0.key}.sorted(by: {$0 < $1   })
    }
    
    private func groupFeaturesForHeaders(groupedCards: [String : [Card]]) {
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        cardsTypeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
}
