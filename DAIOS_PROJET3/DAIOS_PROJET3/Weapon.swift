//
//  Weapon.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

class Weapon {
    var damage = 0
    var weaponNatureType: NatureType?
}

class Sword: Weapon {
    override init() {
        super.init()
        damage = 10
        weaponNatureType = .earth
    }
}

class Knife: Weapon {
    override init() {
        super.init()
        damage = 5
        weaponNatureType = .earth
    }
}

class Axe: Weapon {
    override init() {
        super.init()
        damage = 15
        weaponNatureType = .earth
    }
}

class Arrow: Weapon {
    override init() {
        super.init()
        damage = 12
        weaponNatureType = .air
    }
}

class Filter: Weapon {
    override init() {
        super.init()
        damage = 7
        weaponNatureType = .water
    }
}

class None: Weapon {
    // The character has no weapon - should he fight with his hands only
    override init() {
        super.init()
        damage = 2
        weaponNatureType = .water
    }
}
