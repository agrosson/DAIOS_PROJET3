//
//  Soldier.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

/**
 This class is a subclass of Fighter
 */

class Soldier: Fighter {
    
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterMaxLife = 80
        fighterLife =  fighterMaxLife
        fighterWeapon = Knife()
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a soldier. "
            + super.description()
    }
    override func lightDescription() -> String {
        return "\(fighterName) IS A SOLDIER !!"
    }
}
