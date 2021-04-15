//
//  UINavigationController+CustomAppearence.swift
//  Bootcamp
//
//  Created by denis.fortuna on 15/04/21.
//

import UIKit

extension UINavigationController {
    func applyCustomAppearence() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: TextColor.title]
        navBarAppearance.titleTextAttributes = [.foregroundColor: TextColor.title]
        navBarAppearance.backgroundColor = UIColor.white
        
        
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationBar.isTranslucent = false
    }
    

}
