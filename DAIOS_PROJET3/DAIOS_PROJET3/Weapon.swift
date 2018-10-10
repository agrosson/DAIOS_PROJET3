//
//  Weapon.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - CLASS WEAPON
//======================
/**
 This class set features of a Weapon

 3 variables and initial values:
 1. weaponName
 2. damage
 3. weaponNatureType
 */

class Weapon {
    /// Variable that indicates the name of the Weapon
    var weaponName = ""
    /// Variable that sets the level of damage made by the Weapon
    var damage = 0
    /// Optional that sets the NatureType of the Weapon
    var weaponNatureType: NatureType?
}
