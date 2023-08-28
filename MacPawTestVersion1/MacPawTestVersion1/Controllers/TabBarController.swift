//
//  TabBarController.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 27.08.2023.
//


import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        // Устанавливаем контроллеры для табов
        self.viewControllers = [
            homeNavigationController,
            todaysDataNavigationController
        ]
        
        // Установка цветов таб-бара и его элементов
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .highlighted)
        
        UITabBar.appearance().barTintColor = UIColor.yellow
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
        UITabBar.appearance().tintColor = UIColor.black
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Получаем текущий индекс выбранного таба
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            // Создаем анимацию вращения на 360 градусов
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.fromValue = 0
            rotationAnimation.toValue = CGFloat.pi * 2
            rotationAnimation.duration = 0.5 // Длительность анимации
            
            // Применяем анимацию к иконке выбранного таба
            if let tabBarItem = tabBarController.tabBar.items?[index], let imageView = tabBarItem.value(forKey: "view") as? UIView {
                imageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
                
                // Обновляем иконку в зависимости от выбранного таба
                if index == 1 { // Индекс 1 соответствует табу "Сьогодні"
                    let updatedSmallIconImage = UIImage(systemName: "info.circle.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 12, weight: .regular))
                    tabBarItem.selectedImage = updatedSmallIconImage
                }
            }
        }
    }

}

private extension TabBarController {
    var homeNavigationController: UINavigationController {
        let viewModel = HomeViewModel()
        let viewController = HomeController(viewModel: viewModel)
        let smallIconImage = UIImage(systemName: Tab.home.imageSystemName)?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 12, weight: .regular))
        let largeIconImage = UIImage(systemName: Tab.home.imageSystemName)?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 16, weight: .regular))
        viewController.tabBarItem = UITabBarItem(title: nil, image: smallIconImage, selectedImage: largeIconImage)
        viewController.tabBarItem.title = Tab.home.name
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = UIColor.systemBlue
        
        return navigationController
    }
    
    var todaysDataNavigationController: UINavigationController {
        let viewModel = TodaysDataViewModel()
        let viewController = TodaysDataController(viewModel: viewModel)
        let smallIconImage = UIImage(systemName: Tab.lastday.imageSystemName)?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 12, weight: .regular))
        let largeIconImage = UIImage(systemName: Tab.lastday.imageSystemName)?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 16, weight: .regular))
        viewController.tabBarItem = UITabBarItem(title: nil, image: smallIconImage, selectedImage: largeIconImage)
        viewController.tabBarItem.title = Tab.lastday.name
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = UIColor.systemBlue
        navigationController.navigationBar.prefersLargeTitles = false
        
        return navigationController
    }
}




