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
    /// Array that lists all the teams of the Game
    private var listOfTeam = [Team]()
    /// Array that lists all the team names of the Game, used to check if Team name is unique
    private var listOfTeamName = [String]()
    /// Array that lists all the fighter names of the Game, used to check if Fighter name is unique
    private var listOfFighterName = [String]()
    /// Array that lists all the Weapons available in the Game
    private let listOfWeapon = [Sword(),Axe(),Knife(),Arrow(),Filter(), None()]
    /// Variable that tracks the index of the Fighter in the TeamMembers
    private var indexOfAttacked = 0
    /// Variable that tracks if game is over
    private var gameOver = false
    /// Variable used as a factor that increases or decreases damages of a Weapon depending on both NatureType of Weapon and Fighter
    private var coefDamage = 1
    /// Variable that tracks the number of attack/healing cycle, considered as day
    private var day = 0
    
    init() {
        gameStart()
    }
    
    /** Function that launches the game with execution of several other functions
     */
    private func gameStart() {
        // Prints a welcome message and make a pause
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
        } while gameOver == false
        
        anotherGameMaybe()
        
    }
    /**
     Function that creates two teams
     # Important Notes #
     - A test is made to check if team is composed only with Wizards
     
     */
    private func teamCreationCycle(){
        // Create the first team
        print("")
        print("Here is the team 1:")
        let team1 = createTeam()
        
        // test if numberOfWizard = 3 in team1
        onlyWizardsInTeam(team : team1)
        
        // Makes a presentation of the first team
        print("")
        print(team1.presentation())
        appendTeam(team: team1)
        
        // Creates the second team
        print("")
        print("Here is the team 2:")
        let team2 = createTeam()
        
        // test if numberOfWizard = 3
        onlyWizardsInTeam(team : team2)
        
        print("")
        // Make a presentation of the second team
        print(team2.presentation())
        appendTeam(team: team2)
    }
    
    /**
     Function that appends the Team name into listOfTeamName and the Team into listOfTeam
     - Parameter team : The team that has to be appended into the 2 arrays
     */
    private func appendTeam(team : Team) {
        // Adds the team to list of team and name of the team to the list of teamNames to enable tests for unique names
        listOfTeamName.append(team.teamName)
        listOfTeam.append(team)
        pauseTapKeyboard()
    }
    
    /**
     Function that checks if the Team is composed with only Wizards
     - Parameter team : The team that has to be checked
     */
    private func onlyWizardsInTeam(team : Team){
        var numberOfWizard = 0
        for fighter in team.teamMembers{
            if fighter.isAWizard {
                numberOfWizard += 1
            }
        }
        if numberOfWizard == 3 {
            print("You can not have a team with only Wizards. Restart in 3 seconds")
            countDown()
            game = Game()
        }
        
    }
    /** Function that prints a welcome message at begining of the game
     */
    private func welcomeMessage() {
        print("""
        Welcome to this brand new game.
        Be ready to fight !!
        Build a team and choose your best fighters to win the game!
        Are you ready? Yes ?
        """)
    }
    
    /** Function that creates a countdown
     */
    private func countDown() {
        for i in 1...3{
            sleep(1)
            print(4-i)
            print("")
        }
        sleep(1)
        print("")
        print("              Go !!")
        sleep(1)
    }
    
    /**
     Function that creates a Team with 3 Fighters
     - Returns: The Team thats has been created
     
     # Important Notes #
     - Several controls are made:
     1. Name of Team is got from user
     2. Name of Team has to be unique
     
     */
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
    
    /**
     Function that creates a Fighter
     - Returns: The Fighter thats has been created
     
     # Important Notes #
     - Several controls are made:
     1. Name of Fighter is got from user
     2. Name of Fighter has to be unique
     */
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
    /**
     Function that processes an attack or a healing cycle
     
     # Important Notes #
     - Control flow ( i == 1 ? 1 : 0) is used to switch from one team to another within the loop for i in 0...1
     - Healing cycle is processed when Wizard type of Fighter is chosen
     - Attack cycle is processed when another type of Fighter is chosen:
     1. If fighterLife < 1 : Fighter is dead and is removed from Team
     2. If no member left in Team : End of game
     3. If only Wizards left in Team : End of game
     */
    private func attack(){
        
        
        // event before attack cycle
        if day > 0 {
            print("***********************************************************************")
            print("Day \(day+1)")
            /// variable to check if specific event occurs
            let event = Int.random(in: 1...4)
            if event == 4 {
                eventHasOccured()
                
            } else {
                
                print("The night was calm, nothing happened")
                print("***********************************************************************")
            }
            
        }
        // Increment day value
        day += 1
        
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
            
            
            
            // Here : let a test to see if Wizard is chosen
            // do the following block of code if Wizard is chosen
            if attacking.isAWizard {
                // do something mister Wizard
                print("You have choosen a Wizard. Who do you want to heal?")
                let fighterToHeal = chooseFighterForAttack(ofTeamAttacker: ( i == 1 ? 1 : 0), teamNameForAction: ( i == 1 ? 1 : 0))
                print("Here is the fighter to be healed by the Wizard!!!")
                print(fighterToHeal.description())
                fighterToHeal.fighterLife = min(Int(Double(fighterToHeal.fighterLife) * 1.5), fighterToHeal.fighterMaxLife)
                print("Here is the fighter healed by the Wizard!!!")
                print(fighterToHeal.description())
                
            }
            else {
                // do the following block of code if Wizard is not chosen
                
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
                
                // calculate the coefDamage: damage * 2 if same NatureType
                
                if randomWeapon!.weaponNatureType == attacking.fighterNatureType {
                    coefDamage *= 2
                    print("Outch !! The Fighter knows the weapon very well !!"
                        + "\nThe damages are double !!")
                }
                
                attacking.fighterWeapon = randomWeapon!
                print("")
                print("Damages caused : \(coefDamage * attacking.fighterWeapon.damage)")
                print("")
                // calculate impact of attack
                attacked.fighterLife = max(attacked.fighterLife - (coefDamage * attacking.fighterWeapon.damage), 0)
                
                // Set coefDamage back to 1
                coefDamage = 1
                
                // Test on fighterLife : dead (remove from team) and is the game over?
                if attacked.fighterLife < 1 {
                    print("Oh my Good !! \(attacked.fighterName) is dead !!")
                    listOfTeam[( i == 0 ? 1 : 0)].teamMembers.remove(at: indexOfAttacked)
                    
                    // Count how many Wizards in the team
                    var countWizard = 0
                    for j in 0..<listOfTeam[( i == 0 ? 1 : 0)].teamMembers.count{
                        if listOfTeam[( i == 0 ? 1 : 0)].teamMembers[j].isAWizard {
                            countWizard += 1
                        }
                    }
                    // Test on Team : if only Wizards in the team, the game is over
                    if listOfTeam[( i == 0 ? 1 : 0)].teamMembers.count == countWizard && countWizard > 0
                    {
                        print("End of game. Team \(listOfTeam[( i == 0 ? 1 : 0)].teamName) is only composed of Wizards and is surrendering !!"
                            + "\nTeam \(listOfTeam[( i == 1 ? 1 : 0)].teamName) wins !!! ")
                        gameOver = true
                        break
                    }
                    
                    // Test on Team : if no member in the team, the game is over
                    if listOfTeam[( i == 0 ? 1 : 0)].teamMembers.count == 0 {
                        print("End of game. All fighter members of team \(listOfTeam[( i == 0 ? 1 : 0)].teamName) are dead now."
                            + "\nTeam \(listOfTeam[( i == 1 ? 1 : 0)].teamName) wins !!! ")
                        gameOver = true
                        break
                    }
                }
                print("Here are the damages on the attacked fighter: ")
                print(attacked.description())
                
            }
            
        }
    }
    // First player choose its opponent
    // random trunck
    // bonus : send animal if any
    // attack
    // Sum up
    
    /**
     Function that creates an event and choose between 4 events
     */
    private func eventHasOccured(){
        
        print("this is an event")
        let indexOfEvent = Int.random(in: 1...4)
        let indexTeamForEvent = Int.random(in: 0...1)
        let indexSecondTeam = indexTeamForEvent == 0 ? 0 : 1
        let teamForEvent = listOfTeam[indexTeamForEvent]
        let secondTeam = listOfTeam[indexSecondTeam]
        let fighterIndex = Int.random(in: 0..<teamForEvent.teamMembers.count)
        
        switch indexOfEvent {
        case 1: food(team: teamForEvent)
        case 2: storm(team: teamForEvent)
        case 3: findAnimal(team: teamForEvent, index: fighterIndex)
        case 4: betray(teamBetrayed: teamForEvent, indexTraitor: fighterIndex, newTeam: secondTeam)
            
        default:
            print("Error : but it should not happen")
        }
        
        
    }
    /**
     Function that increases life for all Fighter of a given Team
     */
    private func food(team : Team) {
        // to do: code for food
        
        print("Lucky Team \(team.teamName) !! You have found food and medicine during the night. Every fighter is feeling better now")
        sleep(2)
        print("***********")
        print("Before event")
        print(team.presentation())
        print("***********")
        print("After event")
        for fighter in team.teamMembers{
            fighter.fighterLife = min(fighter.fighterMaxLife, fighter.fighterLife + 20)
        }
        print(team.presentation())
        print("***********************************************************************")
    }
    
    /**
     Function that decreases life for all Fighter of a given Team
     */
    private func storm(team : Team) {
    
        print("Bad luck for Team \(team.teamName) !! There was a lot of damage during the storm last night. Every fighter is feeling weaker now")
        sleep(2)
        print("***********")
        print("Before event")
        print(team.presentation())
        print("***********")
        print("After event")
        for fighter in team.teamMembers{
            fighter.fighterLife = max(fighter.fighterLife/2, fighter.fighterLife - 15)
        }
        print(team.presentation())
        print("***********************************************************************")
    }
    
    /**
     Function that adds an animal to one Fighter of a given Team
     */
    private func findAnimal(team : Team, index: Int) {
        // to do: code for findAnimal
        let indexAnimal = Int.random(in: 1...5)
        var animalFoundType = .dog
        switch indexAnimal {
        case 1: animalFoundType = .dog; print("You found a dog")
        case 2: animalFoundType = .snake;print("You found a snake")
        case 3: animalFoundType = .dragon;print("You found a dragon")
        case 4: animalFoundType = .horse;print("You found a horse")
        case 5: animalFoundType = .aligator; print("You found a aligator")
        default:
            print("error in findAnimal event")
        }
        
        
        var animalFoundName = ""
        repeat{
            
            print("What is the name of your new animal?")
            if let name = readLine(){
                animalFoundName = name.uppercased()
                animalFoundName.removeFirstAndLastWhitespace()
            }}
            while animalFoundName == ""
        
        let animalFound = Animal(animalName: animalFoundName, animalType: animalFoundType)
        
        
        
        print("Lucky Team \(team.teamName) !! \(team.teamMembers[index].fighterName) has found an animal")
        sleep(2)
        print("***********")
        print("Before event")
        print(team.presentation())
        print("***********")
        print("After event")
        team.teamMembers[index].fighterAnimal.append(animalFound)
        print("animal")
        print(team.presentation())
        print("***********************************************************************")
    }
    
    
    /**
     Function that removes one Fighter from a given Team and adds this Fighter to the other Team
     */
    private func betray(teamBetrayed : Team, indexTraitor: Int, newTeam: Team) {
        // to do: code for betrayal
        print("traitor")
        print("***********************************************************************")
    }
    
    /**
     Function that selects a Fighter for the attack cycle
     - Parameter ofTeamAttacker : Index of selected team (in listOfTeam)
     - Parameter teamNameForAction : Index of selected team (in listOfTeam) to print relevant name of the team in the attack cycle
     - Returns: Fighter that attacks, heals, is attacked or is healed
     
     */
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
            
        default: break
        }
    }
    
    // to be created: an event between a attack cycle
    // catch an animal : add to list animal
    // betrayal : change team if not alone in the team
    // storm: remove lives
    // food : add lives +10
    // drugs : add lives +20 
}
