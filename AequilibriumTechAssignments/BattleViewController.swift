//
//  BattleViewController.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var survivorsButton: UIButton!
    @IBOutlet weak var redView: UIView!
    
    var selectedAutobots = [Transformer]()
    var selectedDecepticons = [Transformer]()
    
    var defeatedAutobots = [Transformer]()
    var defeatedDecepticons = [Transformer]()
    
    var numberOfBattles = 0
    var autobotWinCount = 0
    var decepticonWinCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sort both arrays by rank
        self.selectedAutobots = sortByRank(array: self.selectedAutobots)
        self.selectedDecepticons = sortByRank(array: self.selectedDecepticons)
        
        // Get number of battles (biggest array)
        self.numberOfBattles = (self.selectedAutobots.count < self.selectedDecepticons.count) ? self.selectedAutobots.count : self.selectedDecepticons.count

    }
    
    // MARK: Actions

    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfBattles
        
    }
    
    @IBAction func showSurvivorsButtonPressed(_ sender: UIButton) {
        
        var detail = ""
        var survivors = [Transformer]()
        
        // Set alert title and filter survivors
        if self.autobotWinCount > self.decepticonWinCount {
            survivors = filterSurvivors(allArray: self.selectedDecepticons, defeatedArray: self.defeatedDecepticons)
        }
        else {
            survivors = filterSurvivors(allArray: self.selectedAutobots, defeatedArray: self.defeatedAutobots)
        }
        
        // Loop through survivors
        for transformer in survivors {
            
            detail += "- \(transformer.name)\n"
            
        }
        
        let alert = UIAlertController(title: "Survivors", message: detail, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "battle-cell") as! BattleTableViewCell

        let autobot = self.selectedAutobots[indexPath.row]
        let decepticon = self.selectedDecepticons[indexPath.row]
        
        // Robot names
        cell.autobotName.text = autobot.name
        cell.decepticonLabel.text = decepticon.name
        
        // Make robots clash
        let battle = Battle(pAutobot: autobot, pDecepticon: decepticon)
        battle.fight()
        
        // Show trophy to winner, increment counter and send defeated to respective array
        switch battle.winner {
        case .clash:
            self.redView.isHidden = false
        case .autobot:
            cell.autobotTrophy.isHidden = false
            cell.decepticonTrophy.isHidden = true
            self.defeatedDecepticons.append(decepticon)
            self.autobotWinCount += 1
        case .decepticon:
            cell.autobotTrophy.isHidden = true
            cell.decepticonTrophy.isHidden = false
            self.defeatedAutobots.append(autobot)
            self.decepticonWinCount += 1
        default:
            cell.autobotTrophy.isHidden = true
            cell.decepticonTrophy.isHidden = true
        }
        
        // Show the battle number and explain why the robot won
        cell.battleDetail.text = "Battle \(indexPath.row + 1): "
        switch battle.winnerDetail {
        case .optimus:
            cell.battleDetail.text! += "Optimus always wins"
        case .predaking:
            cell.battleDetail.text! += "Predaking always wins"
        case .strongButCoward:
            cell.battleDetail.text! += "Stronger, but coward"
        case .skill:
            cell.battleDetail.text! += "Skill points"
        case .overallRating:
            cell.battleDetail.text! += "Overall rating"
        default:
            cell.battleDetail.text! += "N/A"
        }
        
        // Update winning team
        if self.autobotWinCount > self.decepticonWinCount {
            self.navigationBar.items?[0].title = "Autobots Win 😀"
            self.survivorsButton.isHidden = false
        }
        else if self.decepticonWinCount > self.autobotWinCount {
            self.navigationBar.items?[0].title = "Decepticons Win 😕"
            self.survivorsButton.isHidden = false
        }
        else {
            self.navigationBar.items?[0].title = "Tie match!!"
            self.survivorsButton.isHidden = true
        }
        
        return cell
    }
    
    // MARK: Private Methods
    
    func sortByRank(array: [Transformer]) -> [Transformer] {
        
        return array.sorted(by: { (t1, t2) -> Bool in
            return t1.rank < t2.rank
        })
        
    }
    
    func filterSurvivors(allArray: [Transformer], defeatedArray: [Transformer]) -> [Transformer] {
        
        return allArray.filter({ (t) -> Bool in
            !defeatedArray.contains(where: { (t1) -> Bool in
                return t1.name == t.name
            })
        })
        
    }
    
}
