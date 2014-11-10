//
//  ViewController.swift
//  tipster
//
//  Created by Vinu Charanya on 11/9/14.
//  Copyright (c) 2014 Zunivo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // To Hide the keyboard on Tap
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // On Editing Bill Amount
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = billField.text._bridgeToObjectiveC().doubleValue

//        Method 2:
//        var billText = NSString(string: billField.text)
//        var billAmount = Double(billText.doubleValue)
//        
//        Method 3:
//        var billAmount = (billField.text as NSString).doubleValue

        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
//        tipLabel.text = "$\(tip)"
//        totalLabel.text = "$\(total)"
//        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

