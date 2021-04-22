//
//  CardsSectionHeaderView.swift
//  Bootcamp
//
//  Created by denis.fortuna on 20/04/21.
//

import UIKit

class CardsSectionHeaderView: UICollectionReusableView {

    let  nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = MainColor.title
        label.font = Fonts.bold(size: 16).path
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func configure() {
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setup(forTitle title: String) {
        self.nameLabel.text = title
    }
}
