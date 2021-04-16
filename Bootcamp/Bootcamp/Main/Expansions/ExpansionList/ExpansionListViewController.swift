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
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ExpansionTableViewCell.self, forCellReuseIdentifier: Identifier.Cell.expansionCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private var dataSource: ExpansionListDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            
            dataSource.didSelectExpansion = { [weak self] selectedCardSet in
                self?.showDetailForSelectedExpansion(selectedCardSet)
            }
            DispatchQueue.main.async {
                self.tableView.dataSource = dataSource
                self.tableView.delegate = dataSource
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: Navigation
    weak var coordinator: ExpansionCoordinator?
    
    // MARK: Network
    private let networkManager: NetworkManager = NetworkManager()
    

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Expansions"
        view.layer.contents = #imageLiteral(resourceName: "fundo").cgImage
        setupViews()
        fetchExpansionList()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func fetchExpansionList() {
        let service = MagicService.sets
        networkManager.request(service: service,
                               responseType: Sets.self)  { (result) in
            switch result {
            case .success(let sets):
                let expansionListDatasource = ExpansionListDataSource()
                expansionListDatasource.setup(cardSet: sets.sets)
                self.dataSource = expansionListDatasource
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: Autolayout
extension ExpansionListViewController: ViewCodable {
    func setupViewHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: Navigation
extension ExpansionListViewController {
    func showDetailForSelectedExpansion(_ cardSet: CardSet) {
        
    }
}
