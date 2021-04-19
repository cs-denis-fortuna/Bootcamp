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
//        collection.delegate = self
//        collection.dataSource = self
//        collection.prefetchDataSource = self
        collection.backgroundColor = .clear
        collection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.Cell.cardCell)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    // MARK: Fetch Type
    private var networkManager: NetworkManagerProtocol?
    private var dbManager: DBManagerProtocol?
    
    private var cardSet: CardSet?
    
    // MARK: Navigation
    weak var coordinator: CardsCoordinatorProtocol?
    
    // MARK: Init
    init(networkManager: NetworkManagerProtocol?, dbManager: DBManagerProtocol?, cardSet: CardSet?) {
        self.networkManager = networkManager
        self.dbManager = dbManager
        self.cardSet = cardSet
        super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = #imageLiteral(resourceName: "fundo").cgImage
        self.navigationItem.title = cardSet?.name ?? ""
        setupViews()
        fetchCards()
    }
    
    private func fetchCards() {
        if let networkManager = networkManager {
            requestCards(networkManager)
        } else if let dbManager = dbManager {
            fetchCardsLocally(dbManager)
        } else {
            print("Erro!")
        }
    }
    
    private func requestCards(_ networkManager: NetworkManagerProtocol) {
        guard let cardSetId = cardSet?.code else { return }
        let service = MagicService.cardsFromSet(setId: cardSetId)
        networkManager.request(service: service, responseType: CardSetCards.self) { (result) in
            switch result {
            case .success(let cards):
                print("Successssss!")
                print("*************")
                print(cards)
            case .failure(let error):
                print("******")
                print("CardSet has no cards to show =/")
                print("Error: ", error)
                print("******")
            }
        }
    }
    
    private func fetchCardsLocally(_ dbManager: DBManagerProtocol) {
        
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
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21)
        ])
    }
}
