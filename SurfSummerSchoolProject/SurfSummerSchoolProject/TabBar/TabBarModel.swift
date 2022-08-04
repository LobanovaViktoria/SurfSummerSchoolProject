//
//  TabBarModel.swift
//  SurfSummerSchoolProject
//
//  Created by Viktoria Lobanova on 04.08.2022.
//



import Foundation
import UIKit

enum TabBar: CaseIterable {
    case main
    case favorite
    case profile
   
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .favorite:
            return "Избранное"
        case .profile:
            return "Профиль"
        }
    }
    
    var unSelectedImage: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "Main")
        case .favorite:
            return UIImage(named: "Favorite")
        case .profile:
            return UIImage(named: "Profile")
        }
    }
    
    var selectedImage: UIImage? {
        return unSelectedImage
    }
    
    var viewController: UIViewController {
        switch self {
        case .main:
            return MainViewController()
        case .favorite:
            return FavoriteViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
