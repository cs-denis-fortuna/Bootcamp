//
//  CardsDetailViewController.swift
//  Bootcamp
//
//  Created by denis.fortuna on 22/04/21.
//

import UIKit

class CardsDetailDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var cards = [Card]()
    
    init(cardss: [Card]) {
        super.init()
        self.cards = cardss

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.Cell.cardCell, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        let card = cards[indexPath.row]
        cell.setup(cardImageUrl: card.imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.3, height: 340)
    }
}

