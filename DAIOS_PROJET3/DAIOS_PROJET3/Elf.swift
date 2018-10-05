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
    let elfMaxLife = 12
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = elfMaxLife
        fighterNatureType = .air
    }
    
    override func description() -> String {
        return "Hello, I am an elf. "
            + super.description()
    }
}
