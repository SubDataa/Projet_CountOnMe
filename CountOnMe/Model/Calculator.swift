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
    
}
