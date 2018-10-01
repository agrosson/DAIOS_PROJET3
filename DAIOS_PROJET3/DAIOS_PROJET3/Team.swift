//
//  Team.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 28/09/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

class Team {
    var teamName: String
    var teamMembers = [Fighter]()
    var teamLife: Int {
        get { var total = 0
            for i in 0..<teamMembers.count {
                total += teamMembers[i].fighterLife
            }
            return total}
       
    }
    
    
    init(name : String){
        teamName = name
    }
    
    func presentation() -> String {
        var presentationText = "My team \(teamName) has \(teamMembers.count) " + (teamMembers.count > 1 ? "members" : "member") + ". The total life of the team is \(teamLife) and " + (teamMembers.count > 1 ? "they" : "he") + " will present " + (teamMembers.count > 1 ? "themselves !" : "himself !")
        for fighter in teamMembers {
            presentationText += "\n \(fighter.description())"
            
        }
        return presentationText
    }
}
