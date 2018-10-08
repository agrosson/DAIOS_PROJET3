//
//  None.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF WEAPON
//======================

class None: Weapon {
    // The character has no weapon - should he fight with his hands only
    override init() {
        super.init()
        weaponName = "None"
        damage = 2
        weaponNatureType = .earth
    }
}
