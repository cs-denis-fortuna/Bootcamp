//
//  CoordinatorProtocol.swift
//  Bootcamp
//
//  Created by denis.fortuna on 14/04/21.
//

import UIKit

enum NavigationType {
    case root
    case push
    case present(_ completion: (() -> Void)? = nil)
}

protocol Coordinator: AnyObject {
    var currentViewController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }
    func start(with navigationType: NavigationType) -> UIViewController
}
