//
//  ExpansionTableViewCell.swift
//  Bootcamp
//
//  Created by denis.fortuna on 15/04/21.
//

import UIKit

class ExpansionTableViewCell: UITableViewCell {

    // MARK: Views
    let separatorView: UIView = {
        let separator = UILabel()
        separator.backgroundColor = MainColor.title
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    let  nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = MainColor.title
        label.font = Fonts.bold(size: 18).path
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let vector: UIImageView = {
        let vec = UIImageView(frame: .zero)
        vec.clipsToBounds = true
        vec.contentMode = .scaleAspectFill
        vec.translatesAutoresizingMaskIntoConstraints = false
        return vec
    }()

    // MARK: Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: Setup
    func setup(expansionName: String) {
//        vector.image = UIImage(named: "Vector.png")
        vector.image = Images.chevron
        
        nameLabel.text = expansionName
    }
    
    private func backgroundConfig() {
        var background = UIBackgroundConfiguration.listPlainCell()
        background.backgroundColor = UIColor.clear
        self.backgroundConfiguration = background
    }
}

// MARK: Autolayout
extension ExpansionTableViewCell: ViewCodable {
    func setupViewHierarchy() {
        addSubview(nameLabel)
        addSubview(separatorView)
        addSubview(vector)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            nameLabel.heightAnchor.constraint(equalToConstant: 21),
            
            separatorView.topAnchor.constraint(equalTo: topAnchor, constant: -1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            vector.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            vector.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            vector.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            vector.heightAnchor.constraint(equalToConstant: 12),
            vector.widthAnchor.constraint(equalToConstant: 6)
        ])
    }
}


