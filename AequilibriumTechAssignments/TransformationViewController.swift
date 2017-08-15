//
//  TransformationViewController.swift
//  AequilibriumTechAssignments
//
//  Created by Fernando Jinzenji on 2017-08-14.
//  Copyright © 2017 Fernando Jinzenji. All rights reserved.
//

import UIKit

class TransformationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var abTableView: UITableView!
    @IBOutlet weak var dcTableView: UITableView!
    
    var autobotsList = Transformer.createAutobotsDataSource()
    var decepticonsList = Transformer.createDecepticonsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        abTableView.register(UITableViewCell.self, forCellReuseIdentifier: "autobot-cell")
        dcTableView.register(UITableViewCell.self, forCellReuseIdentifier: "decepticon-cell")
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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "autobot-cell")!
            
            let item = self.autobotsList[indexPath.row]
            cell.textLabel?.text = item.name
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "decepticon-cell")!
            
            let item = self.decepticonsList[indexPath.row]
            cell.textLabel?.text = item.name
            
            return cell
            
            
        }
    }

}
