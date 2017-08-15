//
//  Battle.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import Foundation

enum WinnerEnum {
    case none
    case autobot
    case decepticon
    case tie
    case clash
}

enum WinnerRule {
    case none
    case optimus
    case predaking
    case strongButCoward
    case skill
    case overallRating
}

class Battle {
    
    var autobot: Transformer
    var decepticon: Transformer
    var winner: WinnerEnum
    var winnerDetail: WinnerRule
    
    init(pAutobot: Transformer, pDecepticon: Transformer) {
        
        autobot = pAutobot
        decepticon = pDecepticon
        winner = .none
        winnerDetail = .none
        
    }
    
    func fight() {
        
        // SPECIAL RULE: if Optimus Prime encounter Predaking, the game ends immediately. Otherwise, both wins against everyone else
        if autobot.name == "Optimus Prime" && decepticon.name == "Predaking" {
            self.winner = .clash
            return;
        }
        else if autobot.name == "Optimus Prime" {
            self.winner = .autobot
            self.winnerDetail = .optimus
            return;
        }
        else if decepticon.name == "Predaking" {
            self.winner = .decepticon
            self.winnerDetail = .predaking
            return;
        }
        
        // RULE 1: If robot is stronger (3 or more strength points) but coward (4 or less courage points), oponent wins
        if autobot.strength - decepticon.strength >= 3 && decepticon.courage - autobot.courage >= 4 {
            self.winner = .decepticon
            self.winnerDetail = .strongButCoward
            return;
        }
        else if decepticon.strength - autobot.strength >= 3 && autobot.courage - decepticon.courage >= 4 {
            self.winner = .autobot
            self.winnerDetail = .strongButCoward
            return;
        }
        
        // RULE 2: If robot is 3 or more points of skill, it wins the fight
        if autobot.skill - decepticon.skill >= 3 {
            self.winner = .autobot
            self.winnerDetail = .skill
            return;
        }
        else if decepticon.skill - autobot.skill >= 3 {
            self.winner = .decepticon
            self.winnerDetail = .skill
            return;
        }
        
        // RULE 3: Winner is the robot with bigger overall rating
        if autobot.overallRating > decepticon.overallRating {
            self.winner = .autobot
            self.winnerDetail = .overallRating
        }
        else if decepticon.overallRating > autobot.overallRating {
            self.winner = .decepticon
            self.winnerDetail = .overallRating
        }
        else {
            self.winner = .tie
        }
        
    }
}
