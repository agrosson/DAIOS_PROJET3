//
//  Knife.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

/**
 This class is a subclass of Weapon
 
 - Initializes the variables for Knife object:
 1. weaponName
 2. damage
 3. weaponNatureType
 */
class Knife: Weapon {
    /**
     Function that initializes Knife with specific initial values
     */
    override init() {
        super.init()
        weaponName = "Knife"
        damage = 8
        weaponNatureType = .earth
    }
}
