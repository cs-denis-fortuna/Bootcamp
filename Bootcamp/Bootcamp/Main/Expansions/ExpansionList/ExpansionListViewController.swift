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
    var coordinator: ExpansionCoordinator?
    
    // MARK: Network
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
         self.networkManager = networkManager
         super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
        
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Expansions"
        view.layer.contents = #imageLiteral(resourceName: "fundo").cgImage
        self.navigationItem.largeTitleDisplayMode = .always
        setupViews()
        fetchExpansionList()
    }
    
    private func fetchExpansionList() {
        let service = MagicService.sets
        networkManager.request(service: service,
                               responseType: Sets.self)  { (result) in
            switch result {
            case .success(let sets):
                self.dataSource = ExpansionListDataSource(cardSet: sets.sets)
            case .failure(let error):
                print("")
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
        coordinator?.didSelectExpansion(cardSet)
    }
}
