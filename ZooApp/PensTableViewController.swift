//
//  PensTableViewController.swift
//  ZooApp
//
//  Created by Kendall Poindexter on 9/14/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class PensTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var biome: Biome?
    var selectedIndex: Int?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let biome = biome else { return 0 }
        return biome.pens.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pen", for: indexPath)
        cell.textLabel?.text = biome?.pens[indexPath.row].penName
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AnimalsInPen" {
            let animalTableViewController = segue.destination as? AnimalsTableViewController
            guard let selectedIndex = selectedIndex,
                let biome = biome else { return }
            let pen = biome.pens[selectedIndex]
            animalTableViewController?.animal = pen.animals
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}

//MARK: - TableViewDelegate Protocols

extension PensTableViewController {
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedIndex = indexPath.row
        return indexPath
    }
}
