//
//  Calculator.swift
//  CountOnMe
//
//  Created by Thibault Ballof on 21/10/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit


class Calculator {
    

    var enterNumber: [String] = [String]()
    

 
    
    // Error check computed variables
    var divionbyzero: Bool {
        return enterNumber.last != "0" 
    }
    var expressionIsCorrect: Bool {
        return enterNumber.last != "+" && enterNumber.last != "-" && enterNumber.last != "/" && enterNumber.last != "*"
    }
    
    var expressionHaveEnoughElement: Bool {
        return enterNumber.count >= 3
    }
    
    var canAddOperator: Bool {
        return enterNumber.last != "+" && enterNumber.last != "-" && enterNumber.last != "/" && enterNumber.last != "*"
    }
    
    func calcul(enterNumber: [String]) -> Int  {
    //priorityCalcul()
    var result = 0
    let left = Int(enterNumber[0])!
    let operand = enterNumber[1]
    let right = Int(enterNumber[2])!
 
        
    switch operand {
    
    case "+": result = left + right
    case "-": result = left - right
    case "*": result = left * right
    case "/": result = left / right
    default: fatalError("Unknown operator !")
    }
    
     return result
    }
    
    private func priorityCalcul() {
        
       
        var resultpriority = 0
        for i in enterNumber {
            
            var left = 0
            var right = 0
            if i == "/" && enterNumber.contains("+") && enterNumber.contains("-")  {
                guard let index = enterNumber.firstIndex(of: i) else { return }
                left = index - 1
                right = index + 1
                resultpriority = left / right
                enterNumber.remove(at: index)
            } else if i == "*" && enterNumber.contains("+") && enterNumber.contains("-") {
                guard let index = enterNumber.firstIndex(of: i) else { return }
                left = index - 1
                right = index + 1
                resultpriority = left * right
                enterNumber.remove(at: index)
                
            }
            enterNumber.remove(at: left)
            enterNumber.remove(at: right)
          
            enterNumber.insert("\(resultpriority)", at: 0)
        }
    }
    func clear() {
        enterNumber.removeAll()
    }
}
