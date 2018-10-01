//
//  main.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//
import Foundation


//Test code

var game = Game()


var monEqui = Team(name: "LoulouTeam")
print(monEqui.presentation())

var fight1 = Fighter(fighterName: "Loulou")
//print(fight1.description())
monEqui.teamMembers.append(fight1)
print(monEqui.presentation())

var chien = Animal(animalName: "Doggy",animalType:.dog)
fight1.fighterAnimal.append(chien)

var weap = Sword()
//weap = Axe()

fight1.fighterWeapon = Sword()
print("Dommages causés: \(fight1.fighterWeapon!.damage)")

fight1.fighterWeapon = Axe()
print("Dommages causés: \(fight1.fighterWeapon!.damage)")

//print(fight1.fighterWeapon[0].damage)

var fighter2 = Fighter(fighterName: "Caro")
monEqui.teamMembers.append(fighter2)
print(monEqui.presentation())

//Test code
