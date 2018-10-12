//
//  Fighter.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation


/**
 This class sets Fighter's features
 
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
 - lightDescription()
 */
class Fighter {
    /// Variable that indicates the Fighter's name
    var fighterName: String
    /// Variable that sets the maximum of level of life for the Fighter
    var fighterMaxLife = 100
    /// Variable that tracks the current level of Fighter's life
    var fighterLife = 0
    /// Array that lists the Animals held by the Fighter
    var fighterAnimal = [Animal]()
    /// Variable that tracks the Weapon held by the Fighter
    var fighterWeapon:Weapon = None()
    /// Variable that tracks the Fighter's NatureType
    var fighterNatureType:NatureType?
    /// Boolean that indicates if Fighter is a type of Wizard Fighter
    var isAWizard = false
    
    /**
     Function that initializes Fighter
     - Parameter fighterName: Fighter's name
     */

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
    /**
     Function that describes name and type of  Fighter
     - Returns: Text (String) that states the name and type of Fighter
     */
    func lightDescription() -> String {
        return "\(fighterName) IS A FIGHTER !!"
    }
}


/**
 Enum that lists the 3 NatureType available for Fighter, Weapons and Animals
 */
enum NatureType: String {
    case earth = "Earth"
    case air = "Air"
    case water = "Water"
}
