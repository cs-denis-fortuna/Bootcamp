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
    let cardImage: UIImageView = {
        let vec = UIImageView(frame: .zero)
        vec.clipsToBounds = true
        vec.contentMode = .scaleAspectFit
        vec.translatesAutoresizingMaskIntoConstraints = false
        return vec
    }()
    
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        backgroundConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    func setup(cardImageUrl: String?) {
        cardImage.image = Images.cardBack
        if let imageUrl = cardImageUrl {
            cardImage.setImage(url: URL(string: imageUrl))
        }
    }
    
    private func backgroundConfig() {
        var background = UIBackgroundConfiguration.listPlainCell()
        background.backgroundColor = UIColor.clear
        self.backgroundConfiguration = background
    }
}

// MARK: Autolayout
extension CardCollectionViewCell: ViewCodable {
    func setupViewHierarchy() {
        addSubview(cardImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9),
        ])
    }
}
