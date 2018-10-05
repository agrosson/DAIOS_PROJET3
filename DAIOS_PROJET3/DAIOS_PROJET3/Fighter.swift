//
//  Fighter.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

//======================
// MARK: - CLASS FIGHTER
//======================

class Fighter {
    var fighterName: String
    var fighterLife = 8
    var fighterAnimal = [Animal]()
    var fighterWeapon:Weapon?
    var fighterNatureType:NatureType?
    
    init(fighterName: String){
        self.fighterName = fighterName
    }
    
    // Function that return text which describes features of the Fighter
    func description() -> String {
        return "My name is \(fighterName)"
            + "\n  1. My life level:" + ( fighterLife == 0 ? " \(fighterLife), I am dead! See you in Heaven !!" : " \(fighterLife)")
            + "\n  2. I have got \(fighterAnimal.count) " + (fighterAnimal.count > 1 ? "animals" : "animal")
    }
}

enum NatureType {
    case earth, air, water
}
