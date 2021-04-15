//
//  ExpansionCoordinator.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

final class ExpansionCoordinator: Coordinator {
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let expansionList = ExpansionListViewController()
        expansionList.coordinator = self
        navigationController?.viewControllers = [expansionList]
        navigationController?.navigationBar.barStyle = .black
        guard let navController = navigationController else { return UIViewController() }
        return navController
    }
}

// MARK: ExpansionListViewController events
//extension ExpansionCoordinator {
//    func didSelectExpansion(_ expansionId: String) {
//        
//    }
//}
