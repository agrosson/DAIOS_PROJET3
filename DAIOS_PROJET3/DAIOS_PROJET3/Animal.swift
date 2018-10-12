//
//  Animal.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation


//======================
// MARK: Class animal
//======================
class Animal {
    /// Name of the Animal
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
//======================
// MARK: Enum AnimalType
//======================
/**
 Enumeration lists animalType and damages as raw Values
 
  `This enumeration:`
 - lists the animalTypes
 - mesures the additionnal damage caused during the attack if you have a animal, using raw values
 */
 enum AnimalType: Int {
    case dog = 10
    case snake = 5
    case dragon = 25
    case horse = 15
    case aligator = 20
}
