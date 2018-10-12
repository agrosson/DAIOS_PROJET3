//
//  Animal.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

/**
 This class sets Animal's features
 
 4 variables and initial values:
 1. animalName
 2. animalType
 3. weaponTypeNature
 4. animalDamage
 5. numberOfFight
 
 */

class Animal {
    /// Animal's name
    var animalName: String
    /// AnimalType of the Animal
    var animalType: AnimalType
    /// Variable that tracks the NatureType of the animal used as Weapon during a fight
    var weaponTypeNature: NatureType
    /// Level of damages inflicted to the opponent by the animal
    var animalDamage: Int {
        get { return animalType.rawValue}
    }
    /// Variable that tracks the number of fights the animal can do
    var numberOfFight = 3
    
    /**
     Function that initializes Animal
     - Parameter animalName: Animal's name
     - Parameter animalType: AnimalType of the Animal
     */
    init(animalName: String, animalType : AnimalType) {
        self.animalName = animalName
        self.animalType = animalType
        switch animalType {
        case .dog: weaponTypeNature = .earth
        case .snake: weaponTypeNature = .earth
        case .dragon: weaponTypeNature = .air
        case .horse: weaponTypeNature = .earth
        case .aligator: weaponTypeNature = .water
        }
    }
}

/**
 Enumeration lists animalType and damages as raw Values
 
  `This enumeration:`
 - lists the animalTypes
 - mesures the additionnal damages caused during the attack if you have a animal, using raw values
 */
 enum AnimalType: Int {
    case dog = 10
    case snake = 5
    case dragon = 25
    case horse = 15
    case aligator = 20
}
