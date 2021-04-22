//
//  CardsCollectionViewCiontroller.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

class CardsCollectionViewController: UIViewController {
    
    // MARK: Views
    let collectionFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collection.backgroundColor = .clear
        collection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.Cell.cardCell)
        collection.register(CardsSectionHeaderView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: Identifier.Cell.cardsSectionHeaderCell)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    // MARK: Data Source
    private var dataSource: CardsCollectionDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            
            dataSource.didSelectCard = { [weak self] selectedCard in
                self?.showDetailForSelectedCard(selectedCard)
            }
            DispatchQueue.main.async {
                self.collectionView.dataSource = dataSource
                self.collectionView.delegate = dataSource
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: Fetch Type
    private var cardsSource: CardsCollectionViewProtocol
    
    private var cardSet: CardSet?
    
    // MARK: Navigation
    weak var coordinator: CardsCoordinatorProtocol?
    
    // MARK: Init
    init(cardsSource: CardsCollectionViewProtocol, cardSet: CardSet?) {
        self.cardsSource = cardsSource
        self.cardSet = cardSet
        super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = Images.background.cgImage
        self.navigationItem.title = cardSet?.name ?? ""
        self.navigationController?.navigationBar.tintColor = MainColor.title
        setupViews()
        fetchCards()
    }
    
    private func fetchCards() {
        cardsSource.fetchCards(responseType: CardSetCards.self, cardSet: cardSet)  { (result) in
            switch result {
            case .success(let cards):
                self.dataSource = CardsCollectionDataSource(cardss: cards.cards)
            case .failure(let error):
                print("Error: ", error)
            }
        }
    }
}

// MARK: Autolayout
extension CardsCollectionViewController: ViewCodable {
    func setupViewHierarchy() {
        view.addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

// MARK: Navigation
extension CardsCollectionViewController {
    func showDetailForSelectedCard(_ card: Card) {
        coordinator?.didSelectCard(card)
    }
}
