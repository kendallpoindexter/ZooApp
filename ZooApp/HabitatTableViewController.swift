//
//  HabitatTableViewController.swift
//  ZooApp
//
//  Created by Kendall Poindexter on 9/14/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class HabitatTableViewController: UITableViewController {
    
    //MARK: - Properties
    var habitat: Habitat?
    var selectedIndex: Int?
//    var selectedIndex: Int?
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        populateZoo()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let habitat = habitat else { return 0 }
        return  habitat.biomes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Biome", for: indexPath)
        guard let habitat = habitat else { return UITableViewCell() }
        cell.textLabel?.text = habitat.biomes[indexPath.row].name
        return cell
    }
    
    //MARK: - Methods
    
    func populateZoo() {
        let polarBearPen = Pen(penName: "Polar Bear Pen",
                               animals: [Animal(species: "Polar Bear", sex: "F", name: "Polar Bear 1"), BabyAnimal(age: "3 Months", species: "Polar Bear", sex: "M", name: "Polar Bear Cub")]
        )
        
        let penguinPen = Pen(penName: "Penguin Pen",
                             animals: [Animal(species: "Penguin", sex: "M", name: "Penguin 1"), BabyAnimal(age: "1 Month", species: "Penguin", sex: "F", name: "Penguin Chick 1")]
        )
        
        let monkeyPen = Pen(penName: "Howler Monkey Pen",
                            animals: [Animal(species: "Howler Monkey", sex: "F", name: "Howler Monkey 1"), BabyAnimal(age: "1 Month", species: "Howler Monkey", sex: "F", name: "Baby Howler Monkey")]
        )
        
        let camelPen = Pen(penName: "Camel Pen",
                           animals: [Animal(species: "Camel", sex: "F", name: "Camel 1"), Animal(species: "Camel", sex: "M", name: "Camel 2"), BabyAnimal(age: "1 Month", species: "Camel", sex: "M", name: "Baby Camel")]
        )
        
        let tundraBiome = Biome(name: "Tundra", pens: [polarBearPen, penguinPen])
        let forestBiome = Biome(name: "Forest", pens: [monkeyPen])
        let desertBiome = Biome(name: "Desert", pens: [camelPen])
        
        habitat = Habitat(biomes: [tundraBiome, forestBiome, desertBiome])
        
    }
    
    

        


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "Pen" {
           let penTableViewController = segue.destination as? PensTableViewController
            guard let selectedIndex = selectedIndex else {return}
            penTableViewController?.biome = habitat?.biomes[selectedIndex]
        }
        // Pass the selected object to the new view controller.
    }

}

//MARK: - TableViewDelegate Protocols

extension HabitatTableViewController {
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedIndex = indexPath.row
        return indexPath
    }
}
