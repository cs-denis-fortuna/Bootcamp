//
//  CardsCollectionDataSource.swift
//  Bootcamp
//
//  Created by denis.fortuna on 19/04/21.
//

import UIKit

class CardsCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var cards = [Card]()
    private var groupedCards: [String: [Card]] = [:]
    private var cardsTypeList: [String] = [""]
    
    init(cardss: [Card]) {
        super.init()
        self.cards = cardss
        groupCardsByType()
        groupeCardsTypes()
    }
    
    // MARK: ViewController Communication
    var didSelectCard: (([Card], Card, IndexPath) -> Void)?
    
    private func groupCardsByType() {
        groupedCards = Dictionary(grouping: cards) {
            guard let type = $0.types?[0] else { return "" }
            return type
        }
    }
    
    private func groupeCardsTypes() {
        cardsTypeList = groupedCards.map{$0.key}.sorted(by: {$0 < $1   })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        cardsTypeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Identifier.Cell.cardsSectionHeaderCell,
                                                                               for: indexPath) as? CardsSectionHeaderView {
            let sectionName = cardsTypeList[indexPath.section]
            sectionHeader.setup(forTitle: sectionName)
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cardSetSection = cardsTypeList[section]
        let cardsInSection = groupedCards[cardSetSection]
        return cardsInSection?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.Cell.cardCell, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let sectionHeader = cardsTypeList[indexPath.section]
        guard let cardsForSection = groupedCards[sectionHeader] else { return UICollectionViewCell() }
        let card = cardsForSection[indexPath.row]
        
        cell.setup(cardImageUrl: card.imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 118)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let card = findCard(forIndePath: indexPath) else { return }
        didSelectCard?(cards, card, indexPath)
    }
    
    

    private func findCard(forIndePath indexPath: IndexPath) -> Card? {
        let section = cardsTypeList[indexPath.section]
        return groupedCards[section]?[indexPath.row]
    }
}

