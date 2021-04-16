//
//  ExpansionListDataSource.swift
//  Bootcamp
//
//  Created by denis.fortuna on 16/04/21.
//

import UIKit

class ExpansionListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Expansions
    private var groupedExpansions: [String : [CardSet]] = [:]
    private var initialLettersList: [String] = [""]
    private var cardSet = [CardSet]()
    
    // MARK:
    var didSelectExpansion: ((CardSet) -> Void)?
    
    // MARK: init
    func setup(cardSet: [CardSet]) {
        self.cardSet = cardSet
        groupedExpansions = groupExpansionsAlphabetically(fromCardSets: cardSet)
        initialLettersList = gruopInitialLettersForSectionHeaders(groupedExpansions)
    }

    // MARK: UITableViewDataSource
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
    
    private func groupExpansionsAlphabetically(fromCardSets expansions: [CardSet]) -> [String : [CardSet]] {
        //group expansions by initial letter
        let grouped = Dictionary(grouping: expansions) { String(checkName(name: $0.name).prefix(1)) }
        //sorting alphabetically each group of Expansions
        var sortedGroupedExpansions = [String: [CardSet]]()
        grouped.forEach {
            sortedGroupedExpansions[$0.key] = $0.value.sorted(by: { checkName(name: $0.name) < checkName(name: $1.name) })
        }
        return sortedGroupedExpansions
    }
    
    private func gruopInitialLettersForSectionHeaders(_ groupedExtensions: [String : [CardSet]]) -> [String] {
        return groupedExpansions.map{$0.key}.sorted(by: {$0 < $1})
    }
    
    func checkName(name: String?) -> String {
        guard let name = name else { return "" }
        return name
    }
}
