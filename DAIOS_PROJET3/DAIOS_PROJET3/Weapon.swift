//
//  Weapon.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

class Weapon {
    var weaponName = ""
    var damage = 0
    var weaponNatureType: NatureType?
}

class Sword: Weapon {
    override init() {
        super.init()
        weaponName = "Sword"
        damage = 10
        weaponNatureType = .earth
    }
}

class Knife: Weapon {
    override init() {
        super.init()
        weaponName = "Knife"
        damage = 5
        weaponNatureType = .earth
    }
}

class Axe: Weapon {
    override init() {
        super.init()
        weaponName = "Axe"
        damage = 15
        weaponNatureType = .earth
    }
}

class Arrow: Weapon {
    override init() {
        super.init()
        weaponName = "Arrow"
        damage = 12
        weaponNatureType = .air
    }
}

class Filter: Weapon {
    override init() {
        super.init()
        weaponName = "Filter"
        damage = 7
        weaponNatureType = .water
    }
}

class None: Weapon {
    // The character has no weapon - should he fight with his hands only
    override init() {
        super.init()
        weaponName = "None"
        damage = 2
        weaponNatureType = .water
    }
}
