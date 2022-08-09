//
//  MainItemCollectionViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Viktoria Lobanova on 08.08.2022.
//

import UIKit

class MainItemCollectionViewCell:
    UICollectionViewCell {
    
    // Mark: - Constants
    private enum Constants {
        static let fillHeartImage = UIImage(named: "heart-fill")
        static let heartImage = UIImage(named: "heart")
    }
    
    // Mark: - Views
    
    @IBOutlet private weak var favoriteButton: UIButton!
   
    @IBOutlet private weak var imageView: UIImageView!

    @IBOutlet private weak var titleLabel: UILabel!
    
    // Mark: - Events
    
    var didFavoritesTapped: (() -> Void)?
   
    //Mark: - Calculated
    
    var buttonImage: UIImage? {
        return isFavorite ? Constants.fillHeartImage : Constants.heartImage
    }
    
    
    // Mark: - Properties
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var image: UIImage? {
        didSet{
            imageView.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet{
            let image = isFavorite ? Constants.fillHeartImage : Constants.heartImage
            favoriteButton.setImage(image, for: .normal)
        }
    }
    
    // Mark: - Actions
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        didFavoritesTapped?()
        isFavorite.toggle()
    }
    
    // Mark: - UICollectionViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
        // Initialization code
    }

}
   
    // Mark: - Private Methods

private extension MainItemCollectionViewCell {
    
    func configureAppearance() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
        
        imageView.layer.cornerRadius = 25
        favoriteButton.tintColor = .white
        isFavorite = false
    }
}
