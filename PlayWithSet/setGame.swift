//
//  setGame.swift
//  set
//
//  Created by Asal 2 on 05/10/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import Foundation
import UIKit

struct SetGame
{
    
    var indexo = [Int]()
    var matchedFlag = false
    var onScreen = 0
    var cards = [card]()
    var selected = [card]()
    var cardsDisplayed = [card]()
    var drawFlag =  0
    var score = 0
     init(){
        for number in [1, 2, 3]{
            for color in [1, 2, 3]{
                for shape in [1, 2, 3]{
                    for shade in [1, 2, 3] {
                        self.cards.append(card(numVar: number, colorVar: color, shapeVar: shape, shadeVar: shade))
                        
                    }
                }
            }
        }
        
        self.cards.shuffle()
        self.cardsDisplayed = Array(cards.prefix(12))
}
    
    mutating func reset(){
        selected.removeAll()
        cardsDisplayed.removeAll()
        drawFlag = 0
        cards.shuffle()
        cardsDisplayed = Array(cards.prefix(12))
        matchedFlag = false
        score = 0
        onScreen = 0
    }
   
        
        
    mutating func selectCard(at index: Int){
       // print("im here printing \(index)")
     //  print("\(score)")
        if cardsDisplayed[index].isSelected {
          cardsDisplayed[index].isSelected = false
            if let x = selected.firstIndex(of:cardsDisplayed[index]){
                selected.remove(at: x)
            }
        }
        else {
            cardsDisplayed[index].isSelected = true
            addSelected(index)
            indexo.append(index)
            if(selected.count==3){
            let flag = matchedReq()
                print("\(flag)")
                updateScore(thisFlag: flag)
            }
        }
    }
    
    mutating func updateScore (thisFlag: Bool){
        if thisFlag {
            score+=3
            print(score)
        }
        else {
            score-=3
        }
    }
    
    mutating func addSelected (_ index: Int ){
    
           if selected.count == 3 {
               Deselect()
           }
           selected.append(cards[index])
       }
    
    mutating func Deselect(){
       
        selected.removeAll()
        indexo.removeAll()
    
        for index in cardsDisplayed.indices{
            cardsDisplayed[index].isSelected = false
        }
        
    }
    mutating func removeMatched (){
        cardsDisplayed.remove(at: indexo[0])
        cardsDisplayed.remove(at: indexo[1])
        cardsDisplayed.remove(at: indexo[2])

matchedFlag = false
    }
    
mutating func matchedReq()->Bool {
    for index in 0..<3{
        print("\(selected[index].description)")
    }
                if selected.count != 3 {
                    matchedFlag = false
                    return false
                }
                
    if selected[0].colorOfCard == selected[1].colorOfCard {
                    if selected[0].colorOfCard != selected[2].colorOfCard {
                        matchedFlag = false

                        return false
                    }
                } else if selected[1].colorOfCard == selected[2].colorOfCard {
                    
                   matchedFlag = false

                    return false
                } else if (selected[0].colorOfCard == selected[2].colorOfCard) {
        
                    matchedFlag = false
                    return false
                }
                
                if selected[0].numOfCard == selected[1].numOfCard {
                    if selected[0].numOfCard != selected[2].numOfCard {

                        matchedFlag = false
                        return false
                    }
                } else if selected[1].numOfCard == selected[2].numOfCard {
                    matchedFlag = false
                    return false
                } else if (selected[0].numOfCard == selected[2].numOfCard) {

                    matchedFlag = false
                    return false
                }
                
                if selected[0].shadeOfCard == selected[1].shadeOfCard {
                    if selected[0].shadeOfCard != selected[2].shadeOfCard {
   
                        matchedFlag = false
                        return false
                    }
                }
                else if selected[1].shadeOfCard == selected[2].shadeOfCard {
                    matchedFlag = false
                    return false
                }
                else if (selected[0].shadeOfCard == selected[2].shadeOfCard) {
                    
                    matchedFlag = false
                    return false
                }
                
                if selected[0].shapeOfCard == selected[1].shapeOfCard {
                    if selected[0].shapeOfCard != selected[2].shapeOfCard {
                         
                        matchedFlag = false
                       return false
                    }
                } else if selected[1].shapeOfCard == selected[2].shapeOfCard {
                    matchedFlag = false
                    return false
                } else if (selected[0].shapeOfCard == selected[2].shapeOfCard) {
                    matchedFlag = false
                    return false
                }
                matchedFlag = true
                return true
            }
    

   
     

    mutating func draw(){
     //   print(cardsDisplayed.count)
        if !(drawFlag==4){
        if cardsDisplayed.count < 24{
        drawFlag = drawFlag+1
         self.cardsDisplayed = Array(cards.prefix(12 + (drawFlag*3)))
        }
        }
        else {
            print("No more cards to draw")
            
        }
    }
  
    
}


