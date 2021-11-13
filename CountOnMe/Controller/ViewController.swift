//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    let calculator = Calculator()
    
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:  View actions
    // When number button was pressed adding number in text view and in enterNumber
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
      
        if textView.text.firstIndex(of: "=") != nil {
            textView.text = ""
        }
        
        textView.text.append(numberText)
        calculator.enterNumber.append(numberText)
    }
    
    // When multiplication button was pressed adding operator in text view and in enterNumber
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" * ")
            calculator.enterNumber.append("*")
        } else {
            
        }
    }
    
    // When divide button was pressed adding operator in text view and in enterNumber
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculator.canAddOperator  {
            textView.text.append(" / ")
            calculator.enterNumber.append("/")
        } else {
            errorOperator()
        }
    }
    // When addition button was pressed adding operator in text view and in enterNumber
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" + ")
            calculator.enterNumber.append("+")
        } else {
            errorOperator()
        }
    }
    // When substraction button was pressed adding operator in text view and in enterNumber
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" - ")
            calculator.enterNumber.append("-")
        } else {
            errorOperator()
        }
    }

    // When equal button was pressed make calculation
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard calculator.expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        guard calculator.shouldDivide() else {
            let alertVC = UIAlertController(title: "Expression Incorrecte!", message: "Vous ne pouvez pas faire une division par zero", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        calculator.enterNumber = textView.text.split(separator: " ").map { "\($0)" }
        let result = " = \(calculator.calcul())"
        textView.text.append(result)
        
        
       
    }
    // When AC button was pressed remove the value in text view
    @IBAction func buttonAC(_ sender: Any) {
        calculator.clear()
        textView.text = ""
    }
    
    // Show error message
    func errorOperator() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

