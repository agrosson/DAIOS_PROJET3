//
//  Fighter.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

class Fighter {
    var fighterName: String
    var fighterLife = 0
    var weapon: Weapon?
    var fighteraAnimal = [Animal]()
    
    init(fighterName: String){
        self.fighterName = fighterName
    }
    
}
