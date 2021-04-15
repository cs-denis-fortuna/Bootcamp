//
//  SceneDelegate.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let mainCoordinator: MainCoordinator = MainCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        navgationBarConfig()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = mainCoordinator.start(with: .root)
        window?.makeKeyAndVisible()
    }
    
    func navgationBarConfig() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: TextColor.title]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: TextColor.title]
    }
}

