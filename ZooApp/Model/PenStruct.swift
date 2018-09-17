//
//  PenStruct.swift
//  ZooApp
//
//  Created by Kendall Poindexter on 9/14/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

 class Pen {
    let penName: String 
    let animals: [Animal]
    
    init(penName: String, animals: [Animal]) {
        self.penName = penName
        self.animals = animals 
    }
}

//Animal(species: "Penguin", sex: "M", name: "Penguin 1"), Animal(species: "Penguin", sex: "F", name: "Penguin Chick 1")
