//
//  Game.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation
import Darwin // framework to use sleep()

class Game {
    // Array that lists all the teams of the Game
    private var listOfTeam = [Team]()
    // Array that lists all the fighters of the Game, check if Team name Unique
    private var listOfTeamName = [String]()
    // Array that lists all the fighters of the Game, check if Fighter name Unique
    private var listOfFighterName = [String]()
    private let listOfWeapon = [Sword(),Axe(),Knife(),Arrow(),Filter(), None()]
    // Variable that tracks the index of the Fighter in the TeamMembers
    private var indexOfAttacked = 0
    
    init() {
        gameStart()
    }
    
    // Function that launches the game with execution of several functions
    private func gameStart() {
        // Prints a welcome message
        welcomeMessage()
        pauseTapKeyboard()

        // CountDown
        countDown()
        
        // Creates the teams
       teamCreationCycle()
    
        // simul attack
        print("""
                Now things are getting harder
        Please be prepared for a cruel fight !!!
        Be the best, and stay alive !!
        """)
        repeat{
            attack()
        } while (listOfTeam[0].teamLife > 0 && listOfTeam[1].teamLife > 0)
        
        anotherGameMaybe()
        
    }
    
    private func teamCreationCycle(){
        // Create the first team
        print("")
        print("Here is the team 1:")
        let team1 = createTeam()
        // Makes a presentation of the first team
        print("")
        print(team1.presentation())
        appendTeam(team: team1)
        
        // Creates the second team
        print("")
        print("Here is the team 2:")
        let team2 = createTeam()
        print("")
        // Make a presentation of the second team
        print(team2.presentation())
        appendTeam(team: team2)
    }
    
    private func appendTeam(team : Team) {
        // Adds the team to list of team and name of the team to the list of teamNames to enable tests for unique names
        listOfTeamName.append(team.teamName)
        listOfTeam.append(team)
        pauseTapKeyboard()
    }
    
   

    
    // Function that prints a welcome message
    private func welcomeMessage() {
        print("""
        Welcome to this brand new game.
        Be ready to fight !!
        Build a team and choose your best fighters to win the game!
        Are you ready? Yes ?
        """)
    }
    
    // Fucntion that creates a countDown before the game is launched
    private func countDown() {
        for i in 1...5{
            sleep(1)
            print(6-i)
            print("")
        }
        sleep(1)
        print("")
        print("              Go !!")
        sleep(1)
    }
    
    // Function that creates a Team
    private func createTeam() -> Team {
        
        var nameTeam = ""
        
        // Gets the name of the team from user - check if name is unique
        repeat {
            print("What is the name of your Team?")
            if let name = readLine(){
                nameTeam = name.uppercased()
                nameTeam.removeFirstAndLastWhitespace()
            }}
            while listOfTeamName.contains(nameTeam) || nameTeam == ""
        
        // creates the team
        let teamInCreation = Team(name: nameTeam)
        
        // adds 3 fighters to the team and appends the team
        for numbF in 1...3 {
            print("")
            print("Fighter number \(numbF)")
            let fighter1 = createFighter()
            teamInCreation.teamMembers.append(fighter1)
        }
        
        // returns the created team
        return teamInCreation
    }
    
    // Function that creates a Fighter
    private func createFighter() -> Fighter {
        
        var nameMember = ""
        
        // Gets the name of the Fighter from user - check if name is unique
        repeat{
            print("What is the name of your new member?")
            if let name = readLine(){
                nameMember = name.uppercased()
                nameMember.removeFirstAndLastWhitespace()
            }}
            while listOfFighterName.contains(nameMember) || nameMember == ""
        
        // creates the Fighter
        var newFighter = Fighter(fighterName: nameMember)
        
        // adds the name of the Fighter to the listOfFighterName
        listOfFighterName.append(nameMember)
        
        // Gets the kind of character from user
        var type = ""
        repeat { print("What kind of character is it?"
            + "\n1. A warrior"
            + "\n2. A wizard"
            + "\n3. A giant"
            + "\n4. A dwarf"
            + "\n5. An elf"
            + "\n6. A witch"
            + "\n7. A soldier"
            )
            if let answer = readLine(){
                type = answer
            }
        }
            while type != "1"  && type != "2" && type != "3" && type != "4" && type != "5" && type != "6" && type != "7"
        
        switch type {
        case "1": newFighter = Warrior(fighterName: nameMember)
        case "2": newFighter = Wizard(fighterName: nameMember)
        case "3": newFighter = Giant(fighterName: nameMember)
        case "4": newFighter = Dwarf(fighterName: nameMember)
        case "5": newFighter = Elf(fighterName: nameMember)
        case "6": newFighter = Witch(fighterName: nameMember)
        case "7": newFighter = Soldier(fighterName: nameMember)
        default:
            print("There is a bug somewhere")
        }
        
        // returns the Fighter created with character type
        return newFighter
    }
    
    private func attack(){
        /* in this function we will use control flow ( i == 1 ? 1 : 0) to switch from one team to another within the loop for i in 0...1
         */
        
        // for loop with elements from listOfTeam
        for i in 0...1 {
            pauseTapKeyboard()
            
            // Both team presents themselves
            print(" THE TEAM \(listOfTeam[( i == 1 ? 1 : 0)].teamName) IS ATTACKING !!!!")
            print("")
            print(listOfTeam[( i == 1 ? 1 : 0)].presentation())
            print("")
            print(" THE TEAM \(listOfTeam[( i == 0 ? 1 : 0)].teamName) IS BEING ATTACKED !!!!")
            print("")
        
            print(listOfTeam[( i == 0 ? 1 : 0)].presentation())
            print("")
            pauseTapKeyboard()
            
            let attacking = chooseFighterForAttack(ofTeamAttacker: ( i == 1 ? 1 : 0), teamNameForAction: ( i == 1 ? 1 : 0))
            for _ in 1...3{
                print("")
            }
            print("Here is the Attacker !!!")
            print(attacking.description())
            pauseTapKeyboard()
            print("Now chose your opponent !!")
            // teamNameForAction is turn into ( i == 1 ? 1 : 0)) because it is the attacker that is choosing the opponent from the opponent team ( i == 0 ? 1 : 0)
            let attacked = chooseFighterForAttack(ofTeamAttacker: ( i == 0 ? 1 : 0), teamNameForAction: ( i == 1 ? 1 : 0))
            for _ in 1...3{
                print("")
            }
            print("Here is the Attacked fighter !!!")
            print(attacked.description())
            
            for _ in 1...3{
                print("The fight is on !!!")
            }
            pauseTapKeyboard()
            print("Here is the the result")
            
            // random weapon
            let randomWeapon = listOfWeapon.randomElement()
            
            print("The attacker gets a \(randomWeapon!.weaponName)")
            for _ in 1...3{
                print("")
            }
            attacking.fighterWeapon = randomWeapon!
            
            // calculate impact of attack
            attacked.fighterLife = max(attacked.fighterLife-attacking.fighterWeapon.damage, 0)
            
            //tests
            if attacked.fighterLife < 1 {
                // Test on fighterLife : dead (remove from team)
                print("Oh my Good !! \(attacked.fighterName) is dead !!")
                listOfTeam[( i == 0 ? 1 : 0)].teamMembers.remove(at: indexOfAttacked)
                // Test on Team : if no member, the game is over
                if listOfTeam[( i == 0 ? 1 : 0)].teamMembers.count == 0 {
                    print("End of game. All members of team \(listOfTeam[( i == 0 ? 1 : 0)].teamName) are dead now."
                        + "\n team \(listOfTeam[( i == 1 ? 1 : 0)].teamName) wins !!! ")
                    break
                }
            }
            print("Here are the damages on the attacked fighter: ")
            print(attacked.description())
        }
    }
    // First player choose its opponent
    // random trunck
    // bonus : send animal if any
    // attack
    // Sum up
    
    private func chooseFighterForAttack(ofTeamAttacker: Int, teamNameForAction: Int) -> Fighter {
        let chosenFighter: Fighter
        var choice = ""
        var listOfChoice = [String]()
        repeat{
            var counter = 1
            print("\(listOfTeam[teamNameForAction].teamName): What is your selected fighter?")
            for fighter in listOfTeam[ofTeamAttacker].teamMembers {
                print("\(counter). \(fighter.fighterName)")
                listOfChoice.append("\(counter)")
                counter += 1
            }
            if let answer = readLine(){
                choice = answer
            }
        } while !listOfChoice.contains(choice)
        
        chosenFighter = listOfTeam[ofTeamAttacker].teamMembers[Int(choice)!-1]
        indexOfAttacked = Int(choice)!-1
        
        return chosenFighter
    }
    
    private func pauseTapKeyboard(){
        for _ in 1...3{
            print("")
        }
        print("Tap enter key to continue")
        if readLine() != nil {
            print("")
        }
    }
    
    //
    private func anotherGameMaybe(){
        var newGame = ""
        repeat{
            print("Do you want to play again?"
                + "\n1. Yes"
                + "\n2. No"
            )
            if let answer = readLine(){
                newGame = answer
            }
        } while newGame != "1"  && newGame != "2"
        
        switch newGame {
        case "1": game = Game()
            
        default: print("Goodbye")
        }
    }
    
    // to be created: an event between a attack cycle
    // catch an animal : add to list animal
    // betrayal : change team if not alone in the team
    // storm: remove lives
    // food : add lives +10
    // drugs : add lives +20 
}
