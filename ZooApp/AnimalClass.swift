//
//  AnimalClass.swift
//  ZooApp
//
//  Created by Kendall Poindexter on 9/14/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class Animal {
    var species: String
    var  sex: String
    var name: String
    
    init(species: String, sex: String, name: String) {
        self.species = species
        self.sex = sex
        self.name = name 
    }
}
