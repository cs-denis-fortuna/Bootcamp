//
//  MainTabBarControler.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import UIKit

class MainTabBarControler: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    // MARK: Navigation
    weak var coordinator: MainCoordinator?
}
