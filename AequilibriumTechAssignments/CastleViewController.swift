//
//  CastleViewController.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import UIKit

class CastleViewController: UIViewController {

    @IBOutlet weak var arrayTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var intArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    
    @IBAction func castlesToBuildButtonPressed(_ sender: UIButton) {
        
        // Get user input and transform to an integer array
        let input = arrayTextField.text!
        let stringArray = input.components(separatedBy: ",")
        
        self.intArray = stringArray.flatMap { Int($0) }

        // For empty array, return immediately
        if intArray.count == 0 {
            
            resultLabel.text = "Aequilibrium can't build any castle from this array"
            return
        }
        
        var castleCounter = 0
        var details = ""
        
        for index in 0 ..< self.intArray.count {
            
            // Get current number and next different number
            let number = intArray[index]
            let nextNumber = getNextDifferentNumber(index: index)
            
            // First element will always hold a castle
            if index == 0 {
                
                castleCounter += 1
                
                if nextNumber != nil && number > nextNumber! {
                    details += "-Peak starting at index \(index)\n"
                }
                else {
                    details += "-Valley starting at index \(index)\n"
                }
                
            }
            else {
                
                // Set previous number
                let previousNumber = self.intArray[index - 1]
                
                // Is it a peak?
                if number > previousNumber && (nextNumber == nil || nextNumber! < number) {
                    
                    castleCounter += 1
                    details += "-Peak starting at index \(index)\n"
                    
                }
                // Or it is valley?
                else if number < previousNumber && (nextNumber == nil || nextNumber! > number) {
                    
                    castleCounter += 1
                    details += "-Valley starting at index \(index)\n"
                }
            
            }

            
        }
        
        resultLabel.text = "Aequilibrium can build \(castleCounter) castles from the array \(intArray)."
        detailLabel.text = "Details:\n\(details)"
    }
    
    // MARK: Private Methods
    
    func getNextDifferentNumber (index: Int) -> Int? {
        
        let number = self.intArray[index]
        
        for i in index ..< self.intArray.count {
            
            if self.intArray[i] != number {
                return self.intArray[i]
            }
            
        }
        
        return nil
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}
