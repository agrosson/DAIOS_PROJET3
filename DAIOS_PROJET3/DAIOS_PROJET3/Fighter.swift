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

//======================
// MARK: - SUBCLASSES OF FIGHTER
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
class Giant: Fighter {
    let giantMaxLife = 20
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = giantMaxLife
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a giant. "
            + super.description()
    }
}
class Dwarf: Fighter {
    let dwarfMaxLife = 8
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = dwarfMaxLife
        fighterNatureType = .earth
    }
    
    override func description() -> String {
        return "Hello, I am a dwarf. "
            + super.description()
    }
}

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
class Wizard: Fighter {
    let wizardMaxLife = 10
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = wizardMaxLife
        fighterNatureType = .water
    }
    
    override func description() -> String {
        return "Hello, I am a wizard. "
            + super.description()
    }
}

enum NatureType {
    case earth, air, water
}
