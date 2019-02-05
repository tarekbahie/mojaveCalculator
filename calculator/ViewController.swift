//
//  ViewController.swift
//  calculator
//
//  Created by tarek bahie on 1/13/19.
//  Copyright © 2019 tarek bahie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var equalBtn: BorderButton!
    @IBOutlet weak var divideBtn: BorderButton!
    @IBOutlet weak var multiplyBtn: BorderButton!
    @IBOutlet weak var subtractBtn: BorderButton!
    @IBOutlet weak var addBtn: BorderButton!
    
    
    
    
    
    
    
    private var firstNumber : Double = 0
    private var secondNumber : Double = 0
    private var operation = ""
    private var isFinishedTypingNumber : Bool = true
    private var displayValue : Double {
        get {
            guard let number = Double(outputLbl.text!) else {
                //                fatalError("Can't convert display text to double !")
                return 0
            }
            return number
        } set {
            if String(newValue) == "inf" {
                outputLbl.text = "Not a number"
            } else {
                outputLbl.text = String(newValue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equalBtn.isEnabled = false
        
    }
    
    @IBAction func funcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        switch sender.currentTitle {
        case "AC":
            displayValue = 0
        case "+/-" :
            if displayValue != 0 {
                displayValue *= -1
            }
        case "%" :
            displayValue /= 100
        default:
            break
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton){
        equalBtn.isEnabled = true
        if var numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                outputLbl.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    if let dispVal = outputLbl.text {
                        if dispVal.contains("."){
                            return
                        } else {
                            numValue = "."
                        }
                    }
                }
                outputLbl.text = outputLbl.text! + numValue
            }
        }
    }
    @IBAction func mathOperationPressed(_ sender : UIButton){
        
        firstNumber = displayValue
        isFinishedTypingNumber = true
        print(firstNumber)
        if let operand = sender.currentTitle {
        operation = operand
        }
        setupBorderColor(button: sender, operation: operation)
        equalBtn.isEnabled = true
    }

    @IBAction func equallBtnPressed(_ sender : Any) {
        isFinishedTypingNumber = true
        var result : Double = 0
        secondNumber = displayValue
        print(secondNumber)

        switch operation {
        case "+": result = firstNumber + secondNumber
                  setupBorderColor(button: addBtn, operation: "=")
        case "-": result = firstNumber - secondNumber
                  setupBorderColor(button: subtractBtn, operation: "=")
        case "/": result = firstNumber / secondNumber
                  setupBorderColor(button: divideBtn, operation: "=")
        case "X": result = firstNumber * secondNumber
                  setupBorderColor(button: multiplyBtn, operation: "=")
        default : result = 0
        }
        displayValue = result
        equalBtn.isEnabled = false
        
        
    }
    
    
    func setupBorderColor(button : UIButton, operation : String){
        if operation == "="{
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.26)
        } else {
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
        
    }
