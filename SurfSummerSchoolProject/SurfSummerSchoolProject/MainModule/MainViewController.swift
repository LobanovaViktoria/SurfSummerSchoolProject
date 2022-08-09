//
//  MainViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Viktoria Lobanova on 04.08.2022.
//

import UIKit

final class MainViewController: UIViewController {

    // Mark:- Constans
    
    private enum Constans{
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
    }
    
// Mark: - Private Propeties
      
      private let model: MainModel = .init()
    
// Mark: - views
    
    @IBOutlet private weak var collectionView: UICollectionView!
   
    // Mark: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        congigureModel()
        model.getPosts()
        model.items[5].isFavorite = true
        
        view.backgroundColor = .gray
        // Do any additional setup after loading the view.
    }
}

// Mark: -  Private Methods

private extension MainViewController {
    func configureApperance() {
        title = TabBar.main.title
        collectionView.register(UINib(nibName: "\(MainItemCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainItemCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    func congigureModel() {
        model.didItemsUpdate = {[weak self] in
            self?.collectionView.reloadData()
            
        }
    }
}



// Mark:- UICollection
 
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        func collectionView( _ collectionsView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return model.items.count
        }
        func collectionView( _ collectionsView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCollectionViewCell.self)", for: indexPath)
            if let cell = cell as? MainItemCollectionViewCell{
                let item = model.items[indexPath.row]
                cell.title = item.title
                cell.isFavorite = item.isFavorite
                cell.image = item.image
                cell.didFavoritesTapped = { [weak self] in
                    self?.model.items[indexPath.row].isFavorite.toggle()
                
                }
                
            }
            return  cell
    }
    

    
    
    
    /*
     
     
     
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constans.horisontalInset * 2 - Constans.spaceBetweenElements) / 2
        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constans.spaceBetweenRows
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constans.spaceBetweenElements
    }
}
