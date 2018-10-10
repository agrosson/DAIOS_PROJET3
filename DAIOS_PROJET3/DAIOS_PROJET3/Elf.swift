//
//  Elf.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF FIGHTER
//======================

class Elf: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterMaxLife = 130
        fighterLife = fighterMaxLife
        fighterWeapon = Arrow()
        fighterNatureType = .air
    }
    
    override func description() -> String {
        return "Hello, I am an elf. "
            + super.description()
    }
}
