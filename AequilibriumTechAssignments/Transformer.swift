//
//  Transformer.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import Foundation

enum TransformerType {
    case Autobot
    case Decepticon
}

class Transformer {
    
    var name: String
    var strength : Int
    var intelligence : Int
    var speed : Int
    var endurance : Int
    var rank : Int
    var courage : Int
    var firepower : Int
    var skill : Int
    var overallRating: Int
    var type : TransformerType
    
    init(pName: String, pType: TransformerType, pStrength: Int, pIntelligence: Int, pSpeed: Int, pEndurance: Int, pRank: Int, pCourage: Int, pFirepower: Int, pSkill: Int) {
        
        name = pName
        type = pType
        strength = pStrength
        intelligence = pIntelligence
        speed = pSpeed
        endurance = pEndurance
        rank = pRank
        courage = pCourage
        firepower = pFirepower
        skill = pSkill
        overallRating = strength + intelligence + speed + endurance + firepower
    }
    
    class func createAutobotsDataSource() -> [Transformer] {
        
        var returnArray = [Transformer]()
        
        // Create 10 random autobots
        returnArray.append(Transformer(pName: "Bumblebee", pType: .Autobot, pStrength: 2, pIntelligence: 8, pSpeed: 4, pEndurance: 7, pRank: 7, pCourage: 10, pFirepower: 1, pSkill: 7))
        returnArray.append(Transformer(pName: "Chase", pType: .Autobot, pStrength: 4, pIntelligence: 6, pSpeed: 6, pEndurance: 4, pRank: 6, pCourage: 9, pFirepower: 1, pSkill: 8))
        returnArray.append(Transformer(pName: "Hound", pType: .Autobot, pStrength: 5, pIntelligence: 8, pSpeed: 5, pEndurance: 7, pRank: 6, pCourage: 10, pFirepower: 3, pSkill: 9))
        returnArray.append(Transformer(pName: "Ironhide", pType: .Autobot, pStrength: 7, pIntelligence: 7, pSpeed: 3, pEndurance: 9, pRank: 7, pCourage: 10, pFirepower: 7, pSkill: 7))
        returnArray.append(Transformer(pName: "Jazz", pType: .Autobot, pStrength: 5, pIntelligence: 9, pSpeed: 7, pEndurance: 7, pRank: 8, pCourage: 9, pFirepower: 5, pSkill: 10))
        returnArray.append(Transformer(pName: "Optimus Prime", pType: .Autobot, pStrength: 10, pIntelligence: 10, pSpeed: 8, pEndurance: 10, pRank: 10, pCourage: 10, pFirepower: 8, pSkill: 10))
        returnArray.append(Transformer(pName: "Ratchet", pType: .Autobot, pStrength: 4, pIntelligence: 8, pSpeed: 4, pEndurance: 5, pRank: 7, pCourage: 8, pFirepower: 3, pSkill: 10))
        returnArray.append(Transformer(pName: "Sideswipe", pType: .Autobot, pStrength: 7, pIntelligence: 7, pSpeed: 7, pEndurance: 7, pRank: 5, pCourage: 10, pFirepower: 3, pSkill: 6))
        returnArray.append(Transformer(pName: "Swoop", pType: .Autobot, pStrength: 6, pIntelligence: 6, pSpeed: 8, pEndurance: 9, pRank: 5, pCourage: 7, pFirepower: 7, pSkill: 7))
        returnArray.append(Transformer(pName: "Wind Charger", pType: .Autobot, pStrength: 4, pIntelligence: 6, pSpeed: 8, pEndurance: 4, pRank: 5, pCourage: 9, pFirepower: 7, pSkill: 6))

        
        return returnArray
    }
    
    class func createDecepticonsDataSource() -> [Transformer] {
        
        var returnArray = [Transformer]()
        
        // Create 10 random decepticons
        returnArray.append(Transformer(pName: "BattleTrap", pType: .Decepticon, pStrength: 7, pIntelligence: 3, pSpeed: 6, pEndurance: 8, pRank: 6, pCourage: 6, pFirepower: 7, pSkill: 7))
        returnArray.append(Transformer(pName: "Bonecrusher", pType: .Decepticon, pStrength: 9, pIntelligence: 3, pSpeed: 2, pEndurance: 9, pRank: 4, pCourage: 8, pFirepower: 6, pSkill: 6))
        returnArray.append(Transformer(pName: "Divebomb", pType: .Decepticon, pStrength: 7, pIntelligence: 8, pSpeed: 6, pEndurance: 7, pRank: 6, pCourage: 8, pFirepower: 7, pSkill: 7))
        returnArray.append(Transformer(pName: "Megatron", pType: .Decepticon, pStrength: 10, pIntelligence: 10, pSpeed: 4, pEndurance: 8, pRank: 10, pCourage: 9, pFirepower: 10, pSkill: 9))
        returnArray.append(Transformer(pName: "Predaking", pType: .Decepticon, pStrength: 10, pIntelligence: 5, pSpeed: 1, pEndurance: 8, pRank: 7, pCourage: 9, pFirepower: 9, pSkill: 8))
        returnArray.append(Transformer(pName: "Shockwave", pType: .Decepticon, pStrength: 9, pIntelligence: 10, pSpeed: 7, pEndurance: 7, pRank: 9, pCourage: 9, pFirepower: 9, pSkill: 9))
        returnArray.append(Transformer(pName: "Slugfest", pType: .Decepticon, pStrength: 9, pIntelligence: 2, pSpeed: 1, pEndurance: 8, pRank: 4, pCourage: 8, pFirepower: 5, pSkill: 4))
        returnArray.append(Transformer(pName: "Soundwave", pType: .Decepticon, pStrength: 8, pIntelligence: 9, pSpeed: 2, pEndurance: 6, pRank: 8, pCourage: 5, pFirepower: 6, pSkill: 10))
        returnArray.append(Transformer(pName: "Starscream", pType: .Decepticon, pStrength: 7, pIntelligence: 9, pSpeed: 10, pEndurance: 7, pRank: 9, pCourage: 9, pFirepower: 8, pSkill: 8))
        returnArray.append(Transformer(pName: "Wildrider", pType: .Decepticon, pStrength: 6, pIntelligence: 6, pSpeed: 7, pEndurance: 6, pRank: 5, pCourage: 8, pFirepower: 7, pSkill: 6))
        
        
        return returnArray
    }
}
