//
//  CardsCollectionViewCell.swift
//  Bootcamp
//
//  Created by denis.fortuna on 19/04/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    private var cardImageUrl: String = ""
    
    // MARK: Views
    let cardImage: UIView = {
        let separator = UILabel()
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    func setup(cardImageUrl: String) {
        self.cardImageUrl = cardImageUrl
    }
    
}
