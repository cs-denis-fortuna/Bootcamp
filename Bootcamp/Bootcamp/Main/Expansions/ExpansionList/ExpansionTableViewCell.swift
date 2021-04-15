//
//  ExpansionTableViewCell.swift
//  Bootcamp
//
//  Created by denis.fortuna on 15/04/21.
//

import UIKit

class ExpansionTableViewCell: UITableViewCell {

    // MARK: Views
    let  nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
//        label.textColor = TextColor.primary
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // MARK: Setup
    func setup(expansionName: String) {
        nameLabel.text = expansionName
    }
}

// MARK: Autolayout
extension ExpansionTableViewCell: ViewCodable {
    func setupViewHierarchy() {
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


