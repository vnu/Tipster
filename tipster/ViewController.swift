//
//  ViewController.swift
//  tipster
//
//  Created by Vinu Charanya on 11/9/14.
//  Copyright (c) 2014 Zunivo. All rights reserved.
//  Reference Video: http://vimeo.com/102084767

import UIKit

class ViewController: UIViewController {

//  Initiating the view elements in the controller as Outlets
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    // What should happen on ViewLoad
    // Here it sets the values to 0.00
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
    // Uses Tap gesture
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // Action On Editing Bill Amount
    // On Value changed for segmentControl
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
//        Using the following over above to help format the string output
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

