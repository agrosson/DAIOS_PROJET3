//
//  Soldier.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF FIGHTER
//======================

class Soldier: Fighter {
    let soldierMaxLife = 8
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = soldierMaxLife
        fighterWeapon = Knife()
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a soldier. "
            + super.description()
    }
}
