//
//  Arrow.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF WEAPON
//======================

class Arrow: Weapon {
    override init() {
        super.init()
        weaponName = "Arrow"
        damage = 18
        weaponNatureType = .air
    }
}
