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
    
    var isPriorityCalcul: Bool {
        return ( enterNumber.count > 4 && enterNumber.contains("+") && enterNumber.contains("*") ) || ( enterNumber.count > 4 && enterNumber.contains("-") && enterNumber.contains("*") ) || ( enterNumber.count > 4 && enterNumber.contains("+") && enterNumber.contains("/") ) || ( enterNumber.count > 4 && enterNumber.contains("-") && enterNumber.contains("*") )
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
    
    func calcul() -> Int  {
        var result = 0
        if isPriorityCalcul {
            priority()
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
        }  else {
            
       
    
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
        }
     return result
    }
    
  
    func priority() {
        var result = 0
        for i in 0...enterNumber.count {
            if enterNumber[i] == "/" {
                let left = Int(enterNumber[i-1])!
                let right = Int(enterNumber[i+1])!

                result = left / right
                enterNumber.insert("\(result)", at: i+2)
                enterNumber.remove(at: i+1)
                enterNumber.remove(at: i)
                enterNumber.remove(at: i-1)
                return
                
            } else if enterNumber[i] == "*" {
                let left = Int(enterNumber[i-1])!
                let right = Int(enterNumber[i+1])!
               
                result = left * right
                enterNumber.insert("\(result)", at: i+2)
                enterNumber.remove(at: i+1)
                enterNumber.remove(at: i)
                enterNumber.remove(at: i-1)
                return
                
            }

            
        }
    }
    func clear() {
        enterNumber.removeAll()
    }
}
