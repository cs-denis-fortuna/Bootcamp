//
//  ExpansionListViewController.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import UIKit

class ExpansionListViewController: UIViewController {
    
    // MARK: Network
    private let networkManager: NetworkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        fetchExpansionList()
    }
    
    private func fetchExpansionList() {
        let service = MagicService.sets
        networkManager.request(service: service,
                               responseType: Sets.self)  { (result) in
            switch result {
            case .success(let cardSets):
                print(cardSets)
            case .failure(let error):
                print()
            }
        }
    }
}
