//
//  CardDetailViewController.swift
//  Bootcamp
//
//  Created by denis.fortuna on 22/04/21.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    // MARK: Views
    let collectionFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collection.backgroundColor = .clear
        collection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.Cell.cardCell)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let closeButton: UIButton = {
        let close = UIButton(frame: .zero)
        close.setBackgroundImage(Images.closeButton, for: .normal)
        close.backgroundColor = .clear
        close.clipsToBounds = true
        close.contentMode = .scaleAspectFit
        close.addTarget(self, action:#selector(closeButtonSelected), for: .touchUpInside)
        close.translatesAutoresizingMaskIntoConstraints = false
        return close
    }()
    
    let  nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = MainColor.title
        label.font = Fonts.bold(size: 30).path
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Data Source
    private var dataSource: CardsDetailDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            DispatchQueue.main.async {
                self.collectionView.dataSource = dataSource
                self.collectionView.delegate = dataSource
                self.collectionView.reloadData()
            }
        }
    }
    
    private var cards: [Card]
    private var currentCard: Card
    private var indexPath: IndexPath
    
    // MARK: Init
    init(cards: [Card], currentCard: Card, indexPath: IndexPath) {
        self.currentCard = currentCard
        self.cards = cards
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = Images.background.cgImage
        nameLabel.text = currentCard.name
        setupViews()
        self.dataSource = CardsDetailDataSource(cardss: cards)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let row = indexPath.row + 2
        let indexPathTest = IndexPath(row: row, section: indexPath.section)
        collectionView.scrollToItem(at: indexPathTest, at: [.centeredVertically, .centeredHorizontally], animated: false)
    }
    
    @objc private func closeButtonSelected() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: Autolayout
extension CardDetailViewController: ViewCodable {
    func setupViewHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(nameLabel)
        view.addSubview(closeButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            
            nameLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 340)
        ])
    }
}
