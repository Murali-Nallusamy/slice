//
//  CategoryCollectionCell.swift
//  Ecommerce
//
//  Created by Murali on 19/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionCell"
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var offerPriceLabel: UILabel!
    
    class func nib() -> UINib {
        UINib.init(nibName: CategoryCollectionCell.identifier, bundle: nil)
    }
    
    func updateSettiong(forType:Product){
        if forType.seller?.lowercased() == "swiggy"{
            icon.image = #imageLiteral(resourceName: "SwiggyIcon")
            let randomInt = Int.random(in: 0...1)
            backGroundImage.image = randomInt == 0 ?  #imageLiteral(resourceName: "swiggy2") : #imageLiteral(resourceName: "swiggy1")
        }else {
            icon.image = #imageLiteral(resourceName: "BookMyShowIcon")
            backGroundImage.image = #imageLiteral(resourceName: "BookMyShow")
        }
        let stringArray = forType.discount?.components(separatedBy: CharacterSet.decimalDigits.inverted)
        offerPriceLabel.text = stringArray?.first
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
