//
//  Fighter.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - CLASS FIGHTER
//======================
/**
 This class set features of a Fighter
 
 7 variables and initial values:
 1. fighterName
 2. fighterMaxLife
 3. fighterLife
 4. fighterAnimal
 5. fighterWeapon
 6. fighterNatureType
 7. isAWizard
 
Function
 - description()
 
 */
class Fighter {
    /// Variable that indicates the name of the Fighter
    var fighterName: String
    /// Variable that sets the maximum of level of life for the Fighter
    var fighterMaxLife = 100
    /// Variable that tracks the current level of life of the Fighter
    var fighterLife = 0
    /// Array that lists the Animals held by the Fighter
    var fighterAnimal = [Animal]()
    /// Variable that tracks the Weapon held by the Fighter
    var fighterWeapon:Weapon = None()
    /// Variable that tracks the NatureType of the Fighter
    var fighterNatureType:NatureType?
    /// Boolean that indicates if Fighter is a type of Wizard Fighter
    var isAWizard = false
    
    init(fighterName: String){
        self.fighterName = fighterName
    }
    
    /**
     Function that describes features of the Fighter
     - Returns: Text (String) which is a description of main features of the Fighter
     */
    func description() -> String {
        return "My name is \(fighterName)"
            + "\n  1. My life level:" + ( fighterLife == 0 ? " \(fighterLife), I am dead! See you in Heaven !!" : " \(fighterLife)")
            + "\n  2. I have got \(fighterAnimal.count) " + (fighterAnimal.count > 1 ? "animals" : "animal")
    }
}

enum NatureType: String {
    case earth = "Earth"
    case air = "Air"
    case water = "Water"
}
