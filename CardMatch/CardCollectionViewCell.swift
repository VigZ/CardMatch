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
    
    @IBOutlet weak var cardBack: UIImageView!
    public func configure(with model:Card) {
        image.image = model.image
    }
    
     func flip() {
        let duration = 1.0
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]

        UIView.transition(with: self.image, duration: duration, options: transitionOptions, animations: {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration/2) {
                 self.image.isHidden = !self.image.isHidden
            }
           
        })

        UIView.transition(with: self.cardBack, duration: duration, options: transitionOptions, animations: {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration/2) {
                self.cardBack.isHidden = !self.cardBack.isHidden
            }
        })
    }
    
    func fade() {
          UIView.transition(with: self.cardBack, duration: 1, animations: {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.alpha = 0
                  }
              })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        flip()
    }
    
}
