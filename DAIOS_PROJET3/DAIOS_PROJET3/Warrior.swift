//
//  Warrior.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF FIGHTER
//======================

class Warrior: Fighter {
    let warriorMaxLife = 10
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = warriorMaxLife
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a warior. "
            + super.description()
    }
}