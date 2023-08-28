//
//  SceneDelegate.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 25.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        // Создайте экземпляр TabBarController
        let tabBarController = TabBarController()
        
        // Установите TabBarController как корневой контроллер
        window.rootViewController = tabBarController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

