//
//  AddNewViewController.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import UIKit

protocol AddNewViewControllerDelegate : class {
    
    func saveButtonPressed(transformer: Transformer)
    
}

class AddNewViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var enduranceLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var courageLabel: UILabel!
    @IBOutlet weak var firepowerLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    weak var delegate: AddNewViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Actions

    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let sliderTag = sender.tag
        
        if let label = self.view.viewWithTag(sliderTag + 1) as? UILabel {
            
            label.text = String(Int(sender.value))
            
        }
        
    }

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        if(nameTextField.text == nil || nameTextField.text!.isEmpty) {
            nameTextField.placeholder = "Name is required!"
            return
        }
        
        guard let strength = Int(strengthLabel.text!) else {
            return
        }
        
        guard let intelligence = Int(intelligenceLabel.text!) else {
            return
        }
        
        guard let speed = Int(speedLabel.text!) else {
            return
        }
        
        guard let endurance = Int(enduranceLabel.text!) else {
            return
        }
        
        guard let rank = Int(rankLabel.text!) else {
            return
        }
        
        guard let courage = Int(courageLabel.text!) else {
            return
        }
        
        guard let firepower = Int(firepowerLabel.text!) else {
            return
        }
        
        guard let skill = Int(skillLabel.text!) else {
            return
        }
        
        let type = typeSegmentedControl.selectedSegmentIndex == 0 ?TransformerType.Autobot : TransformerType.Decepticon
        
        let newTransformer = Transformer(pName: nameTextField.text!, pType: type, pStrength: strength, pIntelligence: intelligence, pSpeed: speed, pEndurance: endurance, pRank: rank, pCourage: courage, pFirepower: firepower, pSkill: skill)
        
        self.delegate?.saveButtonPressed(transformer: newTransformer)
        self.dismiss(animated: false, completion: nil)
        
    }
    
}
