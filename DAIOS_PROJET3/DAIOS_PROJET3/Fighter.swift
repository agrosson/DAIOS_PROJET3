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
    var fighterLife = 10
    var fighterAnimal = [Animal]()
    var fighterWeapon:Weapon?
    
    init(fighterName: String){
        self.fighterName = fighterName
    }
    
    // Function that return text which describes features of the Fighter
    func description() -> String {
        return "My name is \(fighterName)"
                + "\n  1. My life level: \(fighterLife)"
                + "\n  2. I have got \(fighterAnimal.count) " + (fighterAnimal.count > 1 ? "animals" : "animal")
    }
}

//======================
// MARK: - SUBCLASSES OF FIGHTER
//======================

class Warrior: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = 100
    }
    
    override func description() -> String {
        return "I am a warior. "
                + super.description()
    }
}
class Giant: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        self.fighterLife = 200
    }

    override func description() -> String {
        return "I am a giant. "
            + super.description()
    }
}
class Dwarf: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        self.fighterLife = 80
    }

    override func description() -> String {
        return "I am a dwarf. "
            + super.description()
    }
}

class Elf: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        self.fighterLife = 120
    }

    override func description() -> String {
        return "I am an elf. "
            + super.description()
    }
}

class Witch: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = 150
    }

    override func description() -> String {
        return "I am a witch. "
            + super.description()
    }
}
class Wizard: Fighter {
    override init(fighterName: String) {
        super.init(fighterName: fighterName)
        fighterLife = 100
    }

    override func description() -> String {
        return "I am a wizard. "
            + super.description()
    }
}
