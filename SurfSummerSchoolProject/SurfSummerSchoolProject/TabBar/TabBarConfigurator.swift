//
//  TabBarConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Viktoria Lobanova on 04.08.2022.
//

import Foundation
import UIKit

class TabBarConfigurator {
    func configure() -> UITabBarController {
        return getTabBarViewController()
    }
}

private extension TabBarConfigurator {
    func getTabBarViewController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.setViewControllers(getViewControllers(), animated: false)
        return tabBarController
    }

    func getViewControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        
        for tabBar in TabBar.allCases {
            let viewController = tabBar.viewController
            let item = UITabBarItem(title: tabBar.title, image: tabBar.unSelectedImage, selectedImage: tabBar.selectedImage)
            viewController.tabBarItem = item
            viewControllers.append(viewController)
        }
        
        return viewControllers
    }

}
