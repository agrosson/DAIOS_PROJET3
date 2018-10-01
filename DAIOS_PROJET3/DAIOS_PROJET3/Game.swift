//
//  Game.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation
import Darwin

class Game {
    // Array that lists all the fighters of the Game, check if Fighter name Unique
    var listOfFighterName = [String]()
    
    init() {
        gameStart()
    }
    
    // Function that launches the game with execution of several function
    internal func gameStart() {
        // Print a welcome message
        welcomeMessage()
        // CountDown
        countDown()
        // Create the first team
    }
    
    // Function that prints a welcome message
    internal func welcomeMessage() {
        print("""
        Welcome to this brand new game.
        Be ready to fight !!
        Built a team and choose your best fighters to win the game!
        Are you ready? Yes ? Go !!
        """)
    }
    
    internal func countDown() {
        for i in 1...5{
            sleep(1)
            print(6-i)
        }
        sleep(1)
    }
    
    func createTeam(){
    }
}
