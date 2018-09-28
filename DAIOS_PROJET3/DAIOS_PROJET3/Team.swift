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
    var teamLife: Int?
    
    
    init(name : String){
        teamName = name
    }
    
    func presentation() -> String {
        var presentationText = "My team \(teamName) has \(teamMembers.count) " + (teamMembers.count > 1 ? "members" : "member") + " and " + (teamMembers.count > 1 ? "they" : "he") + " will present " + (teamMembers.count > 1 ? "themselves !" : "himself !")
        for fighter in teamMembers {
            presentationText += "\n \(fighter.description())"
            
        }
        return presentationText
    }
}
