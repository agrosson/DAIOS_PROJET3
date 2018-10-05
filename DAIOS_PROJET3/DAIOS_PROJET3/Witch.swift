//
//  Witch.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF FIGHTER
//======================

class Witch: Fighter {
    let witchMaxLife = 15
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = witchMaxLife
        fighterNatureType = .water
    }
    
    override func description() -> String {
        return "Hello, I am a witch. "
            + super.description()
    }
}
