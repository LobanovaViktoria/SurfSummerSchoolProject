//
//  MainModel.swift
//  SurfSummerSchoolProject
//
//  Created by Viktoria Lobanova on 08.08.2022.
//

import Foundation
import UIKit
final class MainModel {
  
 
    
 // Mark: - Events
    
    var didItemsUpdate: (() -> Void)?
    
    
 // Mark: - Propeties
    
    var items: [ItemModel] = []{
        didSet{
            didItemsUpdate?()
        }
    }
    
 // Mark : - Methods
    
    func getPosts(){
        items = Array(repeating: ItemModel.createDefault(), count: 100)
    }
    
}

struct ItemModel{
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let content: String
    
    static func createDefault() ->ItemModel {
        .init(image: UIImage(named: "default-image"), title: "Самый милый корги", isFavorite: false, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
        
    }
}
