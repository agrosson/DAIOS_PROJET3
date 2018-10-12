//
//  Team.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation
/**
 This class sets features of a Team
 
 3 variables and initial values:
 1. teamName
 2. teamMembers
 3. teamLife
 
 2 functions
 - init()
 - presentation()

 */
class Team {
    /// Variable that indicates the Team's name
    var teamName: String
    /// Array that lists all the Team's Fighters
    var teamMembers = [Fighter]()
    /// Variable that tracks the sum of all fighterLife of the Team's Fighters
    var teamLife: Int {
        get { var total = 0
            for i in 0..<teamMembers.count {
                total += teamMembers[i].fighterLife
            }
            return total}
       
    }
    /**
     Function that initializes Team
     - Parameter name: Team's name
     */
    init(name : String){
        teamName = name
    }
    /**
     Function that describes Team's features
     - Returns: Text (String) which is a description of main Team's features
     */
    func presentation() -> String {
        var presentationText = "The team \(teamName) has \(teamMembers.count) " + (teamMembers.count > 1 ? "members" : "member") + ". The total life of the team is \(teamLife) and " + (teamMembers.count > 1 ? "they" : "he") + " will present " + (teamMembers.count > 1 ? "themselves !" : "himself !")
        for fighter in teamMembers {
            presentationText += "\n \(fighter.description())"
            
        }
        return presentationText
    }
}
