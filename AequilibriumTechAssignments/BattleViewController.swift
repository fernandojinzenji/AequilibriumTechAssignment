//
//  BattleViewController.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var selectedAutobots = [Transformer]()
    var selectedDecepticons = [Transformer]()
    
    var numberOfBattles = 0
    var autobotWins = 0
    var decepticonWins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sort both arrays by rank
        self.selectedAutobots = sortByRank(array: self.selectedAutobots)
        self.selectedDecepticons = sortByRank(array: self.selectedDecepticons)
        
        self.selectedAutobots.removeAll()
        self.selectedDecepticons.removeAll()
        self.selectedAutobots.append(Transformer(pName: "auto", pType: .Autobot, pStrength: 5, pIntelligence: 6, pSpeed: 5, pEndurance: 5, pRank: 5, pCourage: 5, pFirepower: 5, pSkill: 5))
        self.selectedDecepticons.append(Transformer(pName: "dece", pType: .Decepticon, pStrength: 5, pIntelligence: 5, pSpeed: 5, pEndurance: 5, pRank: 5, pCourage: 5, pFirepower: 5, pSkill: 5))
        
        
        // Get number of battles (biggest array)
        self.numberOfBattles = (self.selectedAutobots.count < self.selectedDecepticons.count) ? self.selectedAutobots.count : self.selectedDecepticons.count
        
        // Fight robots
        for i in 0 ..< self.numberOfBattles {
            
            let autobot = self.selectedAutobots[i]
            let decepticon = self.selectedDecepticons[i]
            
            // SPECIAL RULE: if Optimus Prime encounter Predaking, the game ends immediately. Otherwise, both wins against everyone else
            if autobot.name == "Optimus Prime" && decepticon.name == "Predaking" {
                print("clash")
                break;
            }
            else if autobot.name == "Optimus Prime" {
                print("optimus wins")
                break;
            }
            else if decepticon.name == "Predaking" {
                print("predaking wins")
                break;
            }
            
            // RULE 1: If robot is stronger (3 or more strength points) but coward (4 or less courage points), oponent wins
            if autobot.strength - decepticon.strength >= 3 && decepticon.courage - autobot.courage >= 4 {
                print("decepticon wins")
                break;
            }
            else if decepticon.strength - autobot.strength >= 3 && autobot.courage - decepticon.courage >= 4 {
                print("autobot wins")
                break;
            }
            
            // RULE 2: If robot is 3 or more points of skill, it wins the fight
            if autobot.skill - decepticon.skill >= 3 {
                print("autobot wins")
                break;
            }
            else if decepticon.skill - autobot.skill >= 3 {
                print("decepticon wins")
                break;
            }
            
            // RULE 3: Winner is the robot with bigger overall rating
            if autobot.overallRating > decepticon.overallRating {
                print("autobot wins")
            }
            else if decepticon.overallRating > autobot.overallRating {
                print("decepticon wins")
            }
            else {
                print("Tie")
            }
        }
    }
    
    // MARK: Actions

    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    // MARK: Private Methods
    
    func sortByRank(array: [Transformer]) -> [Transformer] {
        
        return array.sorted(by: { (t1, t2) -> Bool in
            return t1.rank < t2.rank
        })
        
    }
    
}
