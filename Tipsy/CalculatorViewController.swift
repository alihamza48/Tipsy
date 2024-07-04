//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount: Float = 10
    var dropping: String = "0"
    var totalBill:  Float = 0
    var people: Float = 0
    var tip: Float = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        dropping = sender.titleLabel!.text ?? "0"
        tipAmount = Float(dropping.dropLast()) ?? 0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = sender.value.description
        
    }
    
    @IBAction func CalculatePressed(_ sender: UIButton) {
        tip = tipAmount/100
        people = Float(splitNumberLabel.text ?? "0") ?? 0
        let bill = Float(billTextField.text ?? "0") ?? 0
        
        totalBill = ((bill + (bill * tip)) / people)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amount = totalBill
            destinationVC.people = people
            destinationVC.tip = tip
        }
        
    }
}

