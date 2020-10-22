//
//  goWhereViewController.swift
//  KnowAndGo
//
//  Created by Joshua Tsao on 22/10/20.
//

import UIKit


class goWhereViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var locations:[String:[String]] = [:]
    var singaporeLocations = [""]
    
    let userDefaults = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var countyey = 0
        
        if let count = locations["Singapore"]?.count {
            countyey = count
        } else {
            fatalError("oof.")
        }
        
        return countyey
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
                cell.layer.cornerRadius = 5
                
        if let sgLocations = locations["Singapore"] {
            singaporeLocations = sgLocations
        }
        
        cell.textLabel!.text = "\(singaporeLocations[indexPath.row])"
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if singaporeLocations[indexPath.row] != "" {
                    userDefaults.set(singaporeLocations[indexPath.row], forKey: "Selected Location")
        }
        
        performSegue(withIdentifier: "goTo", sender: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations["Singapore"] = ["Marina Bay Sands", "Sentosa", "Universal Studios Singapore", "Orchard Road", "Singapore Flyer", "Raffles Hotel Singapore","Singapore Zoo", "Botanic Gardens"]
    }
    
}
