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
    
    // Check calcul have correct expression
    var expressionIsCorrect: Bool {
        return enterNumber.last != "+" && enterNumber.last != "-" && enterNumber.last != "/" && enterNumber.last != "*"
    }
    // Check calcul have at least 3 elements
    var expressionHaveEnoughElement: Bool {
        return enterNumber.count >= 3
    }
    // Check user can add an operator
    var canAddOperator: Bool {
        return enterNumber.last != "+" && enterNumber.last != "-" && enterNumber.last != "/" && enterNumber.last != "*"
    }
    // Check in enterNumber can divide
    func shouldDivide() -> Bool {
        for i in 0...enterNumber.count - 1{
            if enterNumber[i] == "/" && enterNumber[i + 1] == "0" {
                return false
            }
        }
        return true
    }
    // Calcul
    func calcul() -> Double {
        var result = 0.0
        
        while enterNumber.count > 1 {
            var priorityIndex = 0
            let indexOfMultiplication = enterNumber.firstIndex(of: "*")
            let indexOfDivision = enterNumber.firstIndex(of: "/")
            
            
            if indexOfMultiplication != nil {
                priorityIndex = indexOfMultiplication ?? 1
                
            } else if indexOfDivision != nil {
                priorityIndex = indexOfDivision ?? 1
            } else {
                priorityIndex = 1
            }
            
            
            let left = Double(enterNumber[priorityIndex - 1])!
            let operand = enterNumber[priorityIndex]
            let right = Double(enterNumber[priorityIndex + 1])!
            
            switch operand {
            
            case "+": result = left + right
            case "-": result = left - right
            case "*": result = left * right
            case "/": result = left / right
                
            default: fatalError("Unknown operator !")
            }
            
            enterNumber.removeSubrange(priorityIndex - 1...priorityIndex + 1)
            enterNumber.insert("\(result)", at: priorityIndex - 1)
            
        }
        return Double(enterNumber[0])!
    }
    // Clear enterNumber
    func clear() {
        enterNumber.removeAll()
    }
    
}
