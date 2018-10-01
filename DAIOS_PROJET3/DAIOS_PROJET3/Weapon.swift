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
}

class Sword: Weapon {
    override init() {
        super.init()
        self.damage = 10
    }
}

class Knife: Weapon {
    override init() {
        super.init()
        self.damage = 5
    }
}

class Axe: Weapon {
    override init() {
        super.init()
        self.damage = 15
    }
}

class Arrow: Weapon {
    override init() {
        super.init()
        self.damage = 12
    }
}

class Filter: Weapon {
    override init() {
        super.init()
        self.damage = 7
    }
}

class None: Weapon {
    // The character has no weapon - should he fight with his hands only
    override init() {
        super.init()
        self.damage = 2
    }
}
