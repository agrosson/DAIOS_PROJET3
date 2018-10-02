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
    var animalName: String
    var animalType: AnimalType
    var weaponTypeNature: NatureType
    var animalDamage: Int {
        get { return animalType.rawValue}
    }
    
    init(animalName: String, animalType : AnimalType) {
        self.animalName = animalName
        self.animalType = animalType
        switch animalType {
        case .dog: weaponTypeNature = .earth
        case .snake: weaponTypeNature = .earth
        case .dragon: weaponTypeNature = .air
        case .horse: weaponTypeNature = .earth
        }
    }
}
//======================
// MARK: Enum AnimalType
//======================
/* :
  `This enumeration:`
 - lists the animalTypes
 - mesures the additionnal damage caused during the attack if you have a animal, using raw values
 */
 enum AnimalType: Int {
    case dog = 10
    case snake = 5
    case dragon = 20
    case horse = 15
}
