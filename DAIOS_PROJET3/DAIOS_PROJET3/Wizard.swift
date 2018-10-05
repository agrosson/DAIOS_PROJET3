//
//  Wizard.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 05/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - SUBCLASS OF FIGHTER
//======================

class Wizard: Fighter {
    let wizardMaxLife = 10
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        isAWizard = true
        fighterLife = wizardMaxLife
        // fighterWeapon = Potion() à créer
        fighterNatureType = .water
        
    }
    
    override func description() -> String {
        return "Hello, I am a wizard. "
            + super.description()
    }
}
