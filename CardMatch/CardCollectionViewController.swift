//
//  CardCollectionViewController.swift
//  CardMatch
//
//  Created by Kyle on 8/29/20.
//  Copyright © 2020 Kyle. All rights reserved.
//

import UIKit

class CardCollectionViewController: UICollectionViewController {
    
    var difficulty: Difficulty!
    
    var first_flip: (Card, IndexPath)?
    
    var playing_cards = [Card]()
    
    var score = 0{
        didSet {
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if difficulty == nil {
            promptDifficulty()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return playing_cards.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        cell.image.layer.borderWidth = 2
        cell.image.layer.borderColor = UIColor.black.cgColor
        cell.image.image = playing_cards[indexPath.row].image
        if !playing_cards[indexPath.row].face_up{
            cell.image.isHidden = true
        }
        
        cell.cardBack.layer.borderWidth = 2
        cell.cardBack.layer.borderColor = UIColor.black.cgColor
    
        return cell
    }
    
    func chooseDifficulty(action: UIAlertAction){
        switch action.title {
        case "Easy":
            difficulty = Difficulty.easy
        case "Medium":
            difficulty = Difficulty.medium
        case "Hard":
            difficulty = Difficulty.hard
        default:
            difficulty = Difficulty.medium
        }
        createPairs()
        collectionView.reloadData()
    }
    
    func promptDifficulty(){
        let ac = UIAlertController(title: "Choose a difficulty.", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Easy", style: .default, handler: chooseDifficulty))
        ac.addAction(UIAlertAction(title: "Medium", style: .default, handler: chooseDifficulty))
        ac.addAction(UIAlertAction(title: "Hard", style: .default, handler: chooseDifficulty))
        present(ac, animated: true)
    }
    
    func createPairs() {
        for _ in 0..<(difficulty.rawValue/2){
            let randomShape = CardShape.allCases.randomElement()
            for _ in 0..<2 {
                playing_cards.append(Card(shape:randomShape!, image: UIImage(named:randomShape!.rawValue)!))
            }
        }
        playing_cards.shuffle()
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath){
        playing_cards[indexPath.item].face_up = !playing_cards[indexPath.item].face_up
        if first_flip == nil {
            first_flip = (playing_cards[indexPath.item], indexPath)
        }
            
         else if first_flip?.0.shape.rawValue == playing_cards[indexPath.row].shape.rawValue {
            let cell1 = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
            let cell2 = collectionView.cellForItem(at: first_flip!.1) as! CardCollectionViewCell
            cell1.fade()
            cell2.fade()
            first_flip = nil
            
            }
        else {
            playing_cards[indexPath.item].face_up = !playing_cards[indexPath.item].face_up
            first_flip!.0.face_up = !first_flip!.0.face_up
            playing_cards[indexPath.item].face_up = !playing_cards[indexPath.item].face_up
            let cell1 = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
            let cell2 = collectionView.cellForItem(at: first_flip!.1) as! CardCollectionViewCell
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                cell1.flip()
                cell2.flip()
                }

            first_flip = nil
            
            
        }
        
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
//

}
