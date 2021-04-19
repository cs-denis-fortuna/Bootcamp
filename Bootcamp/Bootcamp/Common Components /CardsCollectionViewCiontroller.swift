//
//  CardsCollectionViewCiontroller.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

enum CardsFetchType {
    case locally
    case remotelly
}

class CardsCollectionViewController: UIViewController {
    
    // MARK: EXPANSION ID
    private var expansionID: String?
    private var cardsFetchType: CardsFetchType = .locally
    
    // MARK: Navigation
    weak var coordinator: CardsCoordinatorProtocol?
    
    // MARK: Network
    private let networkManager: NetworkManager = NetworkManager()
    
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.navigationItem.title = "CARDS \(expansionID ?? "")"
//        title = "CARDS \(expansionID ?? "")"
        view.backgroundColor = .lightGray
    }
    
    func setup(_ id: String?, andFetchType fetchType: CardsFetchType) {
        expansionID = id
        cardsFetchType = fetchType
    }
    
    private func test() {
        coordinator?.didSelectCard("ABC")
    }
}
