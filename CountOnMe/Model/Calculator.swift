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
    
    var result = 0
    var enterNumber: [String] = [String]()
   
    func calcul(textField: UITextView) {
    
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
    
        textField.text = "\(result)"
        enterNumber.removeAll()
        enterNumber.append("\(result)")
    }
    
}
