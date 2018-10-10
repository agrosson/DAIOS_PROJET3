//
//  Dwarf.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF FIGHTER
//======================

class Dwarf: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterMaxLife = 80
        fighterLife = fighterMaxLife
        fighterWeapon = Axe()
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a dwarf. "
            + super.description()
    }
}
