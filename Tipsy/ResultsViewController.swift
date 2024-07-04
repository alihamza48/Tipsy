//
//  ResultViewController.swift
//  Tipsy
//
//  Created by admin on 7/4/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amount: Float = 0
    var people: Float = 0
    var tip: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f" , amount)
        settingsLabel.text = "Split between \(people) people with \(tip)% tip"
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
