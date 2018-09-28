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
    var fighteraAnimal = [Animal]()
    
    init(fighterName: String){
        self.fighterName = fighterName
    }
    
    func description() -> String {
        return "My name is \(fighterName)"
                + "\n  1. My life level: \(fighterLife)"
                + "\n  2. I have got \(fighteraAnimal.count) " + (fighteraAnimal.count > 1 ? "animals" : "animal")
    }
}
