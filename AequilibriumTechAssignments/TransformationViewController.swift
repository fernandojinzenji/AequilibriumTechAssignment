//
//  TransformationViewController.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import UIKit

class TransformationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewViewControllerDelegate {

    @IBOutlet weak var abTableView: UITableView!
    @IBOutlet weak var dcTableView: UITableView!
    
    var autobotsList = Transformer.createAutobotsDataSource()
    var decepticonsList = Transformer.createDecepticonsDataSource()
    
    var selectedAutobots = [Transformer]()
    var selectedDecepticons = [Transformer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: Action
    
    @IBAction func createNewButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "add-new-segue", sender: self)
        
    }
    

    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.abTableView {
            
            return self.autobotsList.count
            
        }
        else {
            
            return self.decepticonsList.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.abTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "aut-cell") as! TransformerTableViewCell
            
            let item = self.autobotsList[indexPath.row]
            cell.textLabel?.text = "\(item.name) (RANK: \(item.rank))"
            cell.detailTextLabel?.text = "str:\(item.strength), int:\(item.intelligence), spe:\(item.speed), end:\(item.endurance), cou:\(item.courage), frp:\(item.firepower), skl:\(item.skill)"
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "dec-cell") as! TransformerTableViewCell
            
            let item = self.decepticonsList[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "str:\(item.strength), int:\(item.intelligence), spe:\(item.speed), end:\(item.endurance), rnk:\(item.rank), cou:\(item.courage), frp:\(item.firepower), skl:\(item.skill)"
            
            return cell
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.abTableView {
            
            self.selectedAutobots.append(self.autobotsList[indexPath.row])
            
        }
        else {
            
            self.selectedDecepticons.append(self.decepticonsList[indexPath.row])

        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if tableView == self.abTableView {
            
            for i in 0 ..< self.selectedAutobots.count {
                
                if selectedAutobots[i].name == self.autobotsList[indexPath.row].name {
                    
                    self.selectedAutobots.remove(at: i)
                    break
                    
                }
                
            }
            
        }
        else {
            
            for i in 0 ..< self.selectedDecepticons.count {
                
                if selectedDecepticons[i].name == self.decepticonsList[indexPath.row].name {
                    
                    self.selectedDecepticons.remove(at: i)
                    break
                    
                }
                
            }
            
        }
        
    }
    
    // MARK: AddNewViewControllerDelegate
    
    func saveButtonPressed(transformer: Transformer) {
        
        if transformer.type == .Autobot {
            self.autobotsList.append(transformer)
            self.selectedAutobots.removeAll()
            self.abTableView.reloadData()
        }
        else {
            self.decepticonsList.append(transformer)
            self.selectedDecepticons.removeAll()
            self.dcTableView.reloadData()
        }
        
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "battle-segue" {
            
            let controller = segue.destination as! BattleViewController
            controller.selectedAutobots = self.selectedAutobots
            controller.selectedDecepticons = self.selectedDecepticons
            
        }
        else if segue.identifier == "add-new-segue" {
            
            let controller = segue.destination as! AddNewViewController
            controller.delegate = self
            
        }
    }

}
