//
//  Game.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation
import Darwin // framework to use sleep()

/**
 Class that defines all the features of the Game and sets the process of the game
 
 9 variables and initial values:
 1. listOfTeam
 2. listOfTeamName
 3. listOfFighterName
 4. listOfWeapon
 5. indexOfAttacked
 6. gameOver
 7. coefDamage
 8. totalDamageAnimalDuringFight
 9. day
 
 19 Functions
 - init()
 - gameStart()
 
 */

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
    private var indexOfFighter = 0
    /// Variable that tracks if game is over
    private var gameOver = false
    /// Variable used as a factor that increases or decreases damages of a Weapon depending on both NatureType of Weapon and Fighter
    private var coefDamage = 1
    /// Variable mesures damages of one or several Animals during a fight depending on both NatureType of Animal and Fighter
    private var totalDamageAnimalDuringFight = 0
    /// Variable that tracks the number of attack/healing cycle, considered as day
    private var day = 0
    
    /**
     Function that initializes Game and launches the game
     
     */
    init() {
        gameStart()
    }
    
    /**
     Function that launches the game and executes functions to process the game
     
     # Important Notes #
     The sequence is the following
        1. welcomeMessage()
        2. countDown()
        3. teamCreationCycle()
        4. repeat/while loop for attack() until game ends
        5. anotherGameMaybe()
     
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
        ************************************************************
        Now things are getting harder
        Please be prepared for a cruel fight !!!
        Be the best, and stay alive !!
        ************************************************************
        """)
        
        // repeat/while loop that repeat attack cycle until the game is over
        repeat{
            attack()
        } while gameOver == false
        
        // function that ask the players to play again or exit
        anotherGameMaybe()
        
    }
    
    /** Function that prints a welcome message at begining of the game
     */
    private func welcomeMessage() {
        print("""
        ************************************************************
        Welcome to this brand new game.
        Be ready to fight !!
        Build a team and choose your best fighters to win the game!
        Are you ready? Yes ?
        ************************************************************
        """)
    }
    
    /** Function that prints a message and asks the player to touch enter key to continue
     */
    private func pauseTapKeyboard(){
        for _ in 1...3{
            print("")
        }
        print("Tap enter key to continue")
        if readLine() != nil {
            print("")
        }
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
        print("Go !!")
        print("************************************************************")
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
        print("************************************************************")
        print(team1.presentation())
        appendTeam(team: team1)
        
        // Creates the second team
        print("************************************************************")
        print("Here is the team 2:")
        let team2 = createTeam()
        
        // test if numberOfWizard = 3 in team2
        onlyWizardsInTeam(team : team2)
        
        print("************************************************************")
        // Make a presentation of the second team
        print(team2.presentation())
        appendTeam(team: team2)
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
            print("************************************************************")
            print("Fighter number \(numbF)")
            print("")
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
        print("")
        var nameMember = ""
        
        // Gets the name of the Fighter from user - checks if name is unique
        repeat{
            print("What is the name of your new member?")
            if let name = readLine(){
                nameMember = name.uppercased()
                nameMember.removeFirstAndLastWhitespace()
            }}
            while listOfFighterName.contains(nameMember) || nameMember == ""
        
        // creates the Fighter
        var newFighter = Fighter(fighterName: nameMember)
        
        // adds the Fighter's name to the listOfFighterName
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
     Function that appends the Team name into listOfTeamName and the Team into listOfTeam
     - Parameter team : The team that has to be appended into the 2 arrays
     */
    private func appendTeam(team : Team) {
        // Adds the team to list of team and Team's name to the list of teamNames to enable tests for unique names
        listOfTeamName.append(team.teamName)
        listOfTeam.append(team)
        pauseTapKeyboard()
    }
    
    /**
     Function that checks if the Team is composed with only Wizards
     - Parameter team : The team that has to be checked out
     */
    private func onlyWizardsInTeam(team : Team){
        var numberOfWizard = 0
        // counts the number of Wizards in the Team
        for fighter in team.teamMembers{
            if fighter.isAWizard {
                numberOfWizard += 1
            }
        }
        // Restart the game if only Wizards in the Team
        if numberOfWizard == 3 {
            print("You can not have a team with only Wizards. Restart in 3 seconds")
            countDown()
            game = Game()
        }
        
    }
    
    /**
     Function that processes an attack or a healing cycle
     
     # Important Notes #
     - An event could occur from day 2
     - Control flow ( i == 1 ? 1 : 0) is used to switch from one team to another within the loop for i in 0...1
     - Healing cycle is processed when Wizard type of Fighter is chosen
     - Attack cycle is processed when another type of Fighter is chosen
      # End of game test #
     If fighterLife < 1 : Fighter is dead and is removed from Team :
     1. If no member left in Team : End of game
     2. If only Wizards left in Team : End of game
     */
    private func attack(){
        
        // event before attack cycle - appears from day 2 only
        if day > 0 {
            print("***********************************************************************")
            print("Day \(day+1)")
            /// variable to check if specific event occurs : 1 chance out of 4
            let event = Int.random(in: 1...4)
            if event == 4 {
                // functions that launches the event cycle
                eventHasOccured()
                
            } else {
                // Message if no event
                print("The night was calm, nothing happened")
                print("***********************************************************************")
            }
            
        }
        
        // Increment day value
        day += 1
        
        // for loop with elements from listOfTeam : team1 attacks first then team2 attacks
        for i in 0...1 {
            pauseTapKeyboard()
            
            // Both team presents themselves
            print("************************************************************")
            print(" THE TEAM \(listOfTeam[( i == 1 ? 1 : 0)].teamName) IS ATTACKING !!!!")
            print("")
            print(listOfTeam[( i == 1 ? 1 : 0)].presentation())
            print("")
            print("************************************************************")
            print(" THE TEAM \(listOfTeam[( i == 0 ? 1 : 0)].teamName) IS BEING ATTACKED !!!!")
            print("")
            
            print(listOfTeam[( i == 0 ? 1 : 0)].presentation())
            print("")
            pauseTapKeyboard()
            
            // Player is asked to choose a Fighter for the attack
            let attacking = chooseFighterForAttack(ofTeamAttacker: ( i == 1 ? 1 : 0), teamNameForAction: ( i == 1 ? 1 : 0))
            
            
            // Wizard is chosen : do the following block of code
            if attacking.isAWizard {
                // Message to ask player to choose a Fighter for the healing cycle
                print("You have choosen a Wizard. Who do you want to heal?")
                let fighterToHeal = chooseFighterForAttack(ofTeamAttacker: ( i == 1 ? 1 : 0), teamNameForAction: ( i == 1 ? 1 : 0))
                // Message to show the Fighter that will be healed
                print("Here is the fighter to be healed by the Wizard!!!")
                print(fighterToHeal.description())
                // The Fighter is cured : fighterLife * 1,5 with max fighterMaxLife
                fighterToHeal.fighterLife = min(Int(Double(fighterToHeal.fighterLife) * 1.5), fighterToHeal.fighterMaxLife)
                //
                print("Here is the fighter healed by the Wizard!!!")
                print(fighterToHeal.description())
            }
                
                // The Fighter chosen is not a Wizard - do the following block of code
            else {
                for _ in 1...3{
                    print("")
                }
                // Message to indicate to player who attacks
                print("Here is the Attacker !!!")
                print(attacking.description())
                print("************************************************************")
                pauseTapKeyboard()
                
                // Message to ask player to choose opponent
                print("************************************************************")
                print("Now chose your opponent !!")
                // teamNameForAction is turn into ( i == 1 ? 1 : 0)) because it is the attacker that is choosing the opponent from the opponent team ( i == 0 ? 1 : 0)
                let attacked = chooseFighterForAttack(ofTeamAttacker: ( i == 0 ? 1 : 0), teamNameForAction: ( i == 1 ? 1 : 0))
                for _ in 1...3{
                    print("")
                }
                // Message to indicate to player who is attacked
                print("Here is the Attacked fighter !!!")
                print(attacked.description())
                print("************************************************************")
                print("")
                for _ in 1...3{
                    print("The fight is on !!!")
                }
                pauseTapKeyboard()
                
                // The Fighter gets a random Weapon from the trunck
                print("************************************************************")
                print("The fighter is openning a trunck to get (or not) a new weapon!!")
                
                // random weapon
                let randomWeapon = listOfWeapon.randomElement()
                for _ in 1...3{
                    print("")
                }
                
                // Message to indicate which Weapon has been found in the trunck
                print("The attacker gets a \(randomWeapon!.weaponName) from the trunck")
                print("************************************************************")
                pauseTapKeyboard()
                print("************************************************************")
                
                // calculate the coefDamage: damage * 2 if same NatureType
                if randomWeapon!.weaponNatureType == attacking.fighterNatureType {
                    coefDamage *= 2
                    print("Outch !! \(attacking.fighterName) knows the weapon very well !!"
                        + "\nThe damages are double !!")
                }
                
                attacking.fighterWeapon = randomWeapon!
                
                // Message to indicate the level of damages
                print("")
                print("Damages caused by Weapon: \(coefDamage * attacking.fighterWeapon.damage)")
                sleep(2)
                print("")
                print("************************************************************")
                print("")
                
                // check if attacking has animals
                if attacking.fighterAnimal.count > 0 {
                    print("Outch !! \(attacking.fighterName) has \(attacking.fighterAnimal.count) " + (attacking.fighterAnimal.count > 1 ? "animals" : "animal"))
                    print("Hard time for its opponent !!")
                    for animal in attacking.fighterAnimal {
                        // Double if Fighter and animal have same NatureType
                        if animal.weaponTypeNature == attacking.fighterNatureType {
                            totalDamageAnimalDuringFight += animal.animalDamage
                        }
                        totalDamageAnimalDuringFight += animal.animalDamage
                        // decrease for 1 the number of fight for the animal
                        animal.numberOfFight -= 1
                    }
                    print("")
                    // Message to indicate the level of damages from animal
                    print("Damages caused by animals: \(totalDamageAnimalDuringFight)")
                    print("")
                }
                
                
                // calculate impact of attacks (weapon and animal)
                attacked.fighterLife = max(attacked.fighterLife - (coefDamage * attacking.fighterWeapon.damage) - totalDamageAnimalDuringFight, 0)
                
                // Set coefDamage back to 1
                coefDamage = 1
                // Set totalDamageAnimalDuringFight back to  0
                totalDamageAnimalDuringFight = 0
                
                // remove animal from fighterAnimal if numberOfFight = 0
                removeAnimal(fighter: attacking)
                
                // Test on fighterLife : dead (remove from team) and is the game over?
                if attacked.fighterLife < 1 {
                    print("Oh my Good !! \(attacked.fighterName) is dead !!")
                    listOfTeam[( i == 0 ? 1 : 0)].teamMembers.remove(at: indexOfFighter)
                    
                    // Count how many Wizards in the team
                    var countWizard = 0
                    for j in 0..<listOfTeam[( i == 0 ? 1 : 0)].teamMembers.count{
                        if listOfTeam[( i == 0 ? 1 : 0)].teamMembers[j].isAWizard {
                            countWizard += 1
                        }
                    }
                    // Test on Team : if only Wizards in the team, the game is over
                    if listOfTeam[( i == 0 ? 1 : 0)].teamMembers.count == countWizard && countWizard > 0
                    {   print("")
                        print("************************************************************")
                        print("End of game. Team \(listOfTeam[( i == 0 ? 1 : 0)].teamName) is only composed of Wizards and is surrendering !!"
                            + "\nTeam \(listOfTeam[( i == 1 ? 1 : 0)].teamName) wins !!! ")
                        gameOver = true
                        break
                    }
                    
                    // Test on Team : if no member in the team, the game is over
                    if listOfTeam[( i == 0 ? 1 : 0)].teamMembers.count == 0 {
                        print("")
                        print("************************************************************")
                        print("End of game. All fighter members of team \(listOfTeam[( i == 0 ? 1 : 0)].teamName) are dead now."
                            + "\nTeam \(listOfTeam[( i == 1 ? 1 : 0)].teamName) wins !!! ")
                        gameOver = true
                        break
                    }
                }
                // Final message to display the attacked Fighter's decription after the fight if he is still alive
                print("Here are the damages on the attacked fighter: ")
                print(attacked.description())
            }
        }
    }
    
    /**
    Function that removes an animal from array fighterAnimal of a Fighter when numberOFight of Animal is 0
    - Parameter fighter : The Fighter that looses its animal (animal is gone when having fought 3 times)
    */
    private func removeAnimal(fighter: Fighter) {
        var trackIndex = [Int]()
        for i in 0..<fighter.fighterAnimal.count {
            if fighter.fighterAnimal[i].numberOfFight == 0 {
                trackIndex.append(i)
            }
        }
        for j in trackIndex {
            fighter.fighterAnimal.remove(at: j)
        }
    }
    
    /**
     Function that creates an event and choose between 4 events
     */
    private func eventHasOccured(){
        
        print("this is an event")
        // The variable is used to choose the event that will occur
        let indexOfEvent = Int.random(in: 1...4)
        // Variable that tracks the team impacted by the event
        let indexTeamForEvent = Int.random(in: 0...1)
        // Variable that tracks the team not impacted by the event
        let indexSecondTeam = indexTeamForEvent == 0 ? 1 : 0
        let teamForEvent = listOfTeam[indexTeamForEvent]
        let secondTeam = listOfTeam[indexSecondTeam]
        // Variable that tracks the Fighter impacted by event
        let fighterIndex = Int.random(in: 0..<teamForEvent.teamMembers.count)
        
        // Random choice of event with variable indexOfEvent
        switch indexOfEvent {
        case 1: food(team: teamForEvent)
        case 2: storm(team: teamForEvent)
        // case 3: A Wizard can not have an animal because Wizard doesn't fight
        case 3: teamForEvent.teamMembers[fighterIndex].isAWizard ? print("The Wizard missed to catch an animal") : findAnimal(team: teamForEvent, index: fighterIndex)
        // Team Should have at least two members of betray event
        case 4: teamForEvent.teamMembers.count == 1 ? print(" Team \(teamForEvent.teamName) has nearly stepped down but found energy to go back to fight !") : betray(teamBetrayed: teamForEvent, indexTraitor: fighterIndex, newTeam: secondTeam)
            
        default:
            print("Error : but it should not happen")
        }
        
        
    }
    
    /**
     Function that increases life for all Fighters of a given Team
     - Parameter team : The team that gets the food
     */
    
    private func food(team : Team) {
 
        // Message to describe event
        print("Lucky Team \(team.teamName) !! You have found food and medicine during the night. Every fighter is feeling better now")
        sleep(2)
        print("***********")
        print("Before event")
        print(team.presentation())
        print("***********")
        print("After event")
        // Add life to all members of the team
        for fighter in team.teamMembers{
            fighter.fighterLife = min(fighter.fighterMaxLife, fighter.fighterLife + 20)
        }
        print(team.presentation())
        print("***********************************************************************")
    }
    
    /**
     Function that decreases life for all Fighters of a given Team
      - Parameter team : The team that is impacted by the storm
     */
    private func storm(team : Team) {
    
        print("Bad luck for Team \(team.teamName) !! There was a lot of damage during the storm last night. Every fighter is feeling weaker now")
        sleep(2)
        print("***********")
        print("Before event")
        print(team.presentation())
        print("***********")
        print("After event")
        // a Fighter can not die because of the storm, so at least keeps 1)
        for fighter in team.teamMembers{
            fighter.fighterLife = max(1, fighter.fighterLife - 15)
        }
        print(team.presentation())
        print("***********************************************************************")
    }
    
    /**
     Function that creates and adds an animal to Fighter of a given Team
      - Parameter team : The team that gets an animal
      - Parameter index : The Fighter of team that gets an animal
     */
    private func findAnimal(team : Team, index: Int) {
        // Random type of animal
        let indexAnimal = Int.random(in: 1...5)
        var animalFoundType: AnimalType = .dog
        switch indexAnimal {
        case 1: animalFoundType = .dog; print("You found a dog")
        case 2: animalFoundType = .snake;print("You found a snake")
        case 3: animalFoundType = .dragon;print("You found a dragon")
        case 4: animalFoundType = .horse;print("You found a horse")
        case 5: animalFoundType = .aligator; print("You found a aligator")
        default:
            print("error in findAnimal event")
        }
        
        // Creates an animal
        var animalFoundName = ""
        repeat{
            
            print("What is the name of your new animal?")
            if let name = readLine(){
                animalFoundName = name.uppercased()
                animalFoundName.removeFirstAndLastWhitespace()
            }}
            while animalFoundName == ""
        
        let animalFound = Animal(animalName: animalFoundName, animalType: animalFoundType)
        
        
        // Adds animal to the Fighter list of animal
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
     - Parameter teamBetrayed : The team that is betrayed
     - Parameter indexTraitor : The Fighter traitor
     - Parameter newTeam : The traitor's new team
     */
    private func betray(teamBetrayed : Team, indexTraitor: Int, newTeam: Team) {
        print("***********************************************************************")
        let traitor = teamBetrayed.teamMembers[indexTraitor]
        // remove traitor from current team
        teamBetrayed.teamMembers.remove(at: indexTraitor)
        var countLeftMembers = 0
        
        // test to check if all members but the traitor are Wizards - if so, the traitor stay in its team
        for leftMembers in teamBetrayed.teamMembers {
            if leftMembers.isAWizard {
                countLeftMembers += 1
            }
        }
        // the traitor stays in its team is true
        if countLeftMembers == teamBetrayed.teamMembers.count {
            print(" Team \(teamBetrayed.teamName) has nearly stepped down but found energy to go back to fight !")
            // the traitor goes back to its team
            teamBetrayed.teamMembers.append(traitor)
        }
        // the traitor moves from current team to second team
        else {
            print("This is crazy !! \(traitor.fighterName) has betrayed and left Team \(teamBetrayed.teamName) to join Team \(newTeam.teamName)")
            newTeam.teamMembers.append(traitor)
        }
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
            print("************************************************************")
            print("\(listOfTeam[teamNameForAction].teamName): What is your selected fighter?")
            for fighter in listOfTeam[ofTeamAttacker].teamMembers {
                print("\(counter). \(fighter.lightDescription())")
                listOfChoice.append("\(counter)")
                counter += 1
            }
            if let answer = readLine(){
                choice = answer
            }
        } while !listOfChoice.contains(choice)
        
        chosenFighter = listOfTeam[ofTeamAttacker].teamMembers[Int(choice)!-1]
        indexOfFighter = Int(choice)!-1
        
        return chosenFighter
    }

    
    /**
     Function that proposes to restart or exit the game
     */
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
}
