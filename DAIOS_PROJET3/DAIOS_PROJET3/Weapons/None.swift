//
//  None.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation


/**
 This class is a subclass of Weapon
 
 - Initializes the variables for None object:
 1. weaponName
 2. damage
 3. weaponNatureType
 */
class None: Weapon {
    // The character has no weapon - should he fight with his hands only
    override init() {
        /**
         Function that initializes None with specific initial values
         */
        super.init()
        weaponName = "None"
        damage = 2
        weaponNatureType = .earth
    }
}
