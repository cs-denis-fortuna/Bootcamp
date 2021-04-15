//
//  CardsCollectionViewCiontroller.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

class CardsCollectionViewController: UIViewController {
    
    // MARK: Navigation
    weak var coordinator: CardsCoordinatorProtocol?
    
    // MARK: Network
    private let networkManager: NetworkManager = NetworkManager()
    
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    private func test() {
        coordinator?.didSelectCard("ABC")
    }
}
