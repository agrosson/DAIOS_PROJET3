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
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterMaxLife = 100
        fighterLife =  fighterMaxLife
        fighterWeapon = Sword()
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a warrior. "
            + super.description()
    }
    override func lightDescription() -> String {
        return "\(fighterName) IS A WARRIOR !!"
    }
}
