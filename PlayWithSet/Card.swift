//
//  Card.swift
//  set
//
//  Created by Asal 2 on 04/10/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import Foundation

struct card :Equatable,CustomStringConvertible{
    
    static func == (lhs: card, rhs: card) -> Bool {
        if ((lhs.shapeOfCard == rhs.shapeOfCard) && (lhs.colorOfCard == rhs.colorOfCard) && (lhs.numOfCard == rhs.numOfCard) && (lhs.shadeOfCard == rhs.shadeOfCard)){
        return true
        }
        return false
    }
    
    let description: String
    
    let numOfCard: Number
    let colorOfCard: Color
    let shapeOfCard: Shape
    let shadeOfCard: Shade
    
    var isSelected = false
    
    init(numVar:Int, colorVar:Int,shapeVar:Int,shadeVar:Int){
        self.colorOfCard = Color (rawValue: colorVar) ??  .black
        self.numOfCard = Number (rawValue: numVar) ??  .one
        self.shapeOfCard = Shape (rawValue: shapeVar) ??  .triangle
        self.shadeOfCard = Shade (rawValue: shadeVar) ?? .faded
        
        description = "\(numOfCard), \(colorOfCard), \(shapeOfCard), \(shadeOfCard)"
        
}
  

  enum Shape: Int, CustomStringConvertible {
        case triangle = 1
        case circle = 2
        case square = 3
        var description: String {
          switch(self){
                     case .triangle : return "triangle"
                     case .circle : return "circle"
                     case .square : return "square"

        }
    }
  }
  enum Color: Int, CustomStringConvertible {
      case red = 1 
      case black = 2
      case blue = 3
      var description: String {
          switch(self){
          case .black : return "Black"
          case .red : return "Red"
          case .blue : return "Blue"
          }
          
         }
     }
  
   enum Number:Int , CustomStringConvertible {
       case one = 1
       case two = 2
       case three = 3
       var description: String{
      switch(self){
       case .one : return "one"
       case .two : return "two"
       case .three : return "three"
       }
   }
   }
  
     enum Shade:Int , CustomStringConvertible {
            case faded = 1
            case mid = 2
            case full = 3
            
            var description: String {
           switch(self){
            case .faded : return "Faded"
            case .mid : return "Mid"
            case .full : return "Full"
            }
        }
      
          
  }



}
