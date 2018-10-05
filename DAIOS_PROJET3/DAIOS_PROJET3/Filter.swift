//
//  Filter.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

class Filter: Weapon {
    override init() {
        super.init()
        weaponName = "Filter"
        damage = 7
        weaponNatureType = .water
    }
}
