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
    
    var first_flip: Card?
    
    var playing_cards = [Card]()
    
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
    
        // Configure the cell
    
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
        for _ in 0...(difficulty.rawValue/2){
            let randomShape = Int.random(in: 0..<CardShape.allCases.count)
            for _ in 0...2 {
                playing_cards.append(Card(shape:randomShape, image: UIImage(named:)))
            }
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

}
