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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExpansionTableViewCell.self, forCellReuseIdentifier: Identifier.Cell.expansionCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: Navigation
    weak var coordinator: ExpansionCoordinator?
    
    // MARK: Network
    private let networkManager: NetworkManager = NetworkManager()
    
    // MARK: Expansions
//    private var expansions: [CardSet] = []
    private var groupedExpansions: [String : [CardSet]] = [:]
    private var initialLettersList: [String] = [""]
    
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
                self.groupExpansionsAlphabetically(fromCardSets: sets.sets)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ExpansionListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        initialLettersList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionLetter = initialLettersList[section]
        let expansionNames = groupedExpansions[sectionLetter]
        return expansionNames?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.expansionCell, for: indexPath) as? ExpansionTableViewCell else {
            return UITableViewCell()
        }
        
        let section = initialLettersList[indexPath.section]
        guard let expansion = groupedExpansions[section]?[indexPath.row],
              let name = expansion.name else { return UITableViewCell() }
    
        cell.setup(expansionName: name)

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        initialLettersList[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    private func groupExpansionsAlphabetically(fromCardSets expansions: [CardSet]) {
        //group expansions by initial letter
        groupedExpansions = Dictionary(grouping: expansions) { String(checkName(name: $0.name).prefix(1)) }
        
        //group initial letters
        initialLettersList = groupedExpansions.map{$0.key}.sorted(by: {$0 < $1})
        
        //sorting alphabetically each group of Expansions
        var sortedGroupedExpansions = [String: [CardSet]]()
        groupedExpansions.forEach {
            sortedGroupedExpansions[$0.key] = $0.value.sorted(by: { checkName(name: $0.name) < checkName(name: $1.name) })
        }
        groupedExpansions = sortedGroupedExpansions
    }
    
    func checkName(name: String?) -> String {
        guard let name = name else { return "" }
        return name
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
