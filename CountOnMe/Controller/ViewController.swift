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
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if calculator.enterNumber.first == nil {
            textView.text = ""
        }
        textView.text.append(numberText)
        calculator.enterNumber.append(numberText)
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" * ")
            calculator.enterNumber.append("*")
        } else {
            
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" / ")
            calculator.enterNumber.append("/")
        } else {
            errorOperator()
        }
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" + ")
            calculator.enterNumber.append("+")
        } else {
            errorOperator()
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" - ")
            calculator.enterNumber.append("-")
        } else {
            errorOperator()
        }
    }

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
        calculator.calcul(textField: textView)
        
        
       
    }
    
    func errorOperator() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

