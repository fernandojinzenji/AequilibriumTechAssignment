//
//  Battle.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import Foundation

class Battle {
    
    var autobot: Transformer
    var decepticon: Transformer
    var winner: TransformerType?
    
    init(pAutobot: Transformer, pDecepticon: Transformer) {
        
        autobot = pAutobot
        decepticon = pDecepticon
    }
    
    func fight() {
        
        // If autobot is Optimus Prime and decepticon is Predaking
        
    }
}
