//
//  CardCollectionViewCell.swift
//  CardMatch
//
//  Created by Kyle on 8/29/20.
//  Copyright © 2020 Kyle. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    public func configure(with model:Card) {
        image.image = model.image
    }
    
}
