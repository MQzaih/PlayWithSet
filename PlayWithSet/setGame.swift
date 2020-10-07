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
            print(" it was selected before")
          cardsDisplayed[index].isSelected = false
            print("selected count is before deselection\(selected.count)")
            if let x = selected.firstIndex(of:cardsDisplayed[index]){
                selected.remove(at: x)
                print(" count after card deselected")
                print(selected.count)
                print(selected)
            }
        }
        else {
            cardsDisplayed[index].isSelected = true
            addSelected(index)
            if(selected.count==3){
                    print(selected.count)
                    print(selected)
                let flag = matchedReq()
                    if flag == true {
                        print("7afot 3l remove")
                      removeMatched()
                    Deselect()
                    }
                    else{
                        Deselect()
                }
                updateScore(thisFlag: flag)

            }
            }
        
     
        
    }
    

    mutating func addSelected (_ index: Int ){
    
        
           selected.append(cardsDisplayed[index])
        indexo.append(index)
       }
    
    mutating func Deselect(){
       
        selected.removeAll()
        print("i will print selected")
        print(selected)
        indexo.removeAll()
    
        for index in cardsDisplayed.indices{
            cardsDisplayed[index].isSelected = false
        }
        
    }
    mutating func removeMatched (){
      //  print(cardsDisplayed[indexo[0]])
        //print(cardsDisplayed[indexo[1]])
        //print(cardsDisplayed[indexo[2]])
print("removing")
        print("before removal \(cardsDisplayed.count)")

        if let x = cardsDisplayed.firstIndex(of:selected[0]){
        cardsDisplayed.remove(at: x)}
            if let y = cardsDisplayed.firstIndex(of:selected[1]){
                cardsDisplayed.remove(at: y)}
                if let z = cardsDisplayed.firstIndex(of:selected[2]){
                    cardsDisplayed.remove(at: z)}
        print("after removal \(cardsDisplayed.count)")
        print("ra7 atba3 l selected")
        print(selected)
        matchedFlag = false
       /* for _ in 0..<cardsDisplayed.count {
            print (cardsDisplayed[0].description)
                }*/
                
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
    

   mutating func updateScore (thisFlag: Bool){
       if thisFlag {
           score+=3
           print(score)
       }
       else {
           score-=3
       }
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


