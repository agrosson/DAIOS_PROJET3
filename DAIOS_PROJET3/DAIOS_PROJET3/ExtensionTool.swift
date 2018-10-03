//
//  ExtensionTool.swift
//  DAIOS_PROJET3
//
//  Created by ALEXANDRE GROSSON on 03/10/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation

// Extension function that removes whitespaces at a beginning and at the end of a String, returns empty String if only whitespaces
extension String {
    mutating func removeFirstAndLastWhitespace(){
        var newString = self
        repeat{
            if newString.last == " " {
                newString = String(newString.dropLast())
            }
            if newString.first == " " {
                newString = String(newString.dropFirst())
            }
        }
            while newString.first == " " || newString.last == " "
        
        self = newString
    }
}
