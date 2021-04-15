//
//  ExpansionListViewController.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import UIKit

class ExpansionListViewController: UIViewController {
    
    // MARK: Views
    lazy var tableView: UITableView = {
        let tableView = UITableView()
//        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.prefetchDataSource = self
//        tableView.backgroundColor = BackgroundColor.main
        tableView.backgroundColor = .yellow
        tableView.register(ExpansionTableViewCell.self, forCellReuseIdentifier: Identifier.Cell.expansionCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: Navigation
    weak var coordinator: ExpansionCoordinator?
    
    // MARK: Network
    private let networkManager: NetworkManager = NetworkManager()
    
    // MARK: Expansions
    private var expansions: [CardSet] = []
    
    // MARK: Life Cycle
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
                self.expansions = cardSets.sets
//                DispatchQueue.main.async {
                    self.tableView.reloadData()
//                }
            
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ExpansionListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expansions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.expansionCell, for: indexPath) as? ExpansionTableViewCell else {
            return UITableViewCell()
        }

        let model = expansions[indexPath.row]
        guard let name = model.name else { return UITableViewCell() }
        cell.setup(expansionName: name)

        return cell
    }
}

// MARK: Autolayout
extension ExpansionListViewController: ViewCodable {
    func setupViewHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
