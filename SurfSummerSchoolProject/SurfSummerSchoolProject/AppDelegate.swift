//
//  AppDelegate.swift
//  SurfSummerSchoolProject
//
//  Created by Viktoria Lobanova on 03.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let tabBar = TabBarConfigurator().configure()
        window?.rootViewController = tabBar
        return true
    }
}

