//
//  Wizard.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

/**
 This class is a subclass of Fighter
 */

class Wizard: Fighter {
    
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        isAWizard = true
        fighterMaxLife = 100
        fighterLife = fighterMaxLife
        // Wizard has no Weapon
        fighterNatureType = .water
        
    }
    
    override func description() -> String {
        return "Hello, I am a wizard. "
            + super.description()
    }
    override func lightDescription() -> String {
        return "\(fighterName) IS A WIZARD !!"
    }
}
