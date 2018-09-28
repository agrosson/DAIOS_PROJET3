//
//  main.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//
import Foundation


//Test code


print("Test")

var monEqui = Team(name: "LoulouTeam")
print(monEqui.presentation())

var fight1 = Fighter(fighterName: "Loulou")
//print(fight1.description())
monEqui.teamMembers.append(fight1)
print(monEqui.presentation())

var chien = Animal(animalName: "Doggy")
fight1.fighterAnimal.append(chien)
print(monEqui.presentation())

//Test code
