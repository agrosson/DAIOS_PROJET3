//
//  Knife.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

class Knife: Weapon {
    override init() {
        super.init()
        weaponName = "Knife"
        damage = 5
        weaponNatureType = .earth
    }
}
