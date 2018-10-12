//
//  Arrow.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

/**
 This class is a subclass of Weapon

 - Initializes the variables for Arrow object:
 1. weaponName
 2. damage
 3. weaponNatureType
 */
class Arrow: Weapon {
    /**
     Function that initializes Arrow with specific initial values
     */
    override init() {
        super.init()
        weaponName = "Arrow"
        damage = 30
        weaponNatureType = .air
    }
}
