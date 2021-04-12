//
//  SceneDelegate.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let mainTabBarController = MainTabBarControler()
        window?.rootViewController = mainTabBarController
    }
}

