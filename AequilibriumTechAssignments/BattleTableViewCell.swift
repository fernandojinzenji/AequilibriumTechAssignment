//
//  BattleTableViewCell.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-15.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import UIKit

class BattleTableViewCell: UITableViewCell {

    @IBOutlet weak var autobotName: UILabel!
    @IBOutlet weak var decepticonLabel: UILabel!
    @IBOutlet weak var autobotTrophy: UILabel!
    @IBOutlet weak var decepticonTrophy: UILabel!
    @IBOutlet weak var battleDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
