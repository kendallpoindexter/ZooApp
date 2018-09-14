//
//  BabyAnimalClass.swift
//  ZooApp
//
//  Created by Kendall Poindexter on 9/14/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class BabyAnimal: Animal {
    var age: String
    
    
    init(age:String, species: String, sex: String, name: String) {
        self.age = age
        super.init(species: species, sex: sex, name: name)
    }
    
}
