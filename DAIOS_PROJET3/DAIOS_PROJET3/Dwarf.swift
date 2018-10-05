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
    let dwarfMaxLife = 8
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = dwarfMaxLife
        fighterWeapon = Axe()
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a dwarf. "
            + super.description()
    }
}
