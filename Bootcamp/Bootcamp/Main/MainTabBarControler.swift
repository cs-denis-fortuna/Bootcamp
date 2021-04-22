//
//  MainTabBarControler.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import UIKit

class MainTabBarControler: UITabBarController {
    
    // MARK: Views
    let horizontalView: UIView = {
        let hView = UILabel()
        hView.backgroundColor = MainColor.title
        hView.translatesAutoresizingMaskIntoConstraints = false
        return hView
    }()
    
    // MARK: Views
    let verticalView: UIView = {
        let vView = UILabel()
        vView.backgroundColor = MainColor.title
        vView.translatesAutoresizingMaskIntoConstraints = false
        return vView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tabBarConfig()
    }
    
    private func tabBarConfig() {
        UITabBar.appearance().tintColor = MainColor.title
        UITabBar.appearance().unselectedItemTintColor = MainColor.title
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        let attributes:[NSAttributedString.Key : Any] = [NSAttributedString.Key.font: Fonts.bold(size: 16).path]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
    }
    
    // MARK: Navigation
    weak var coordinator: MainCoordinator?
}

// MARK: Autolayout
extension MainTabBarControler: ViewCodable {
    func setupViewHierarchy() {
        self.tabBar.addSubview(horizontalView)
        self.tabBar.addSubview(verticalView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            horizontalView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 16),
            horizontalView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: -16),
            horizontalView.heightAnchor.constraint(equalToConstant: 1),
            
            verticalView.topAnchor.constraint(equalTo: horizontalView.bottomAnchor, constant: 4),
            verticalView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: -4),
            verticalView.widthAnchor.constraint(equalToConstant: 1),
            verticalView.centerXAnchor.constraint(equalTo: horizontalView.centerXAnchor)
        ])
    }
}
