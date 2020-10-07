//
//  ViewController.swift
//  set
//
//  Created by Asal 2 on 04/10/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var game = SetGame()
    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBAction func drawCards(_ sender: Any) {
        game.draw()
        self.collectionView.reloadData()
        
    }
    
    
    @IBAction func reset(_ sender: Any) {
      
        game.reset()
        updateScore()
        self.collectionView.reloadData()
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func updateScore(){
        
      scoreLabel.text = "Score: \(game.score)"


    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScore()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }

  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.game.cardsDisplayed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = (UIColor(red: 0.90, green: 0.75, blue: 0.98, alpha: 1.00))
     cell.largeContentTitle = "hi"
        let card = game.cardsDisplayed[indexPath.row]
        let label = UILabel(frame: CGRect(x: 0, y: 0, width:100, height: 100))


        let string = NSMutableAttributedString()
        
        for _ in 0..<card.numOfCard.rawValue {
            var color = UIColor()
            var shape = ""
            var opacity = CGFloat()
            switch card.colorOfCard {
            case .black:
                color = .black
            case .red:
                color = .red
            case .blue:
                color = .blue
            }
            
            switch card.shadeOfCard {
            case .faded:
                opacity = 0.3
                
            case .full:
                opacity = 1
                
            case .mid:
                opacity = 0.75
                
            }
            
            
            switch card.shapeOfCard {
                
            case .triangle:
                shape = "▲"
                
            case .circle:
                shape = "●"
                
            case .square:
                shape = "■"
            }
    
            let attributedString = NSAttributedString(string: shape , attributes: [NSAttributedString.Key.foregroundColor: color.withAlphaComponent(opacity), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
              string.append(attributedString)
        }
    
        

        label.attributedText = string
        cell.contentView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        cell.contentView.addSubview(label)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
       // let card = game.cardsDisplayed[indexPath.row]
        let index = indexPath.row
        game.selectCard(at: index)
        game.indexo.append(index)
        
        if game.matchedFlag{
            game.removeMatched()
            self.collectionView.reloadData()
        }
        updateScore()
        self.collectionView.reloadData()
  //      print(card.colorOfCard.description)

       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 90)
        
    }
}

