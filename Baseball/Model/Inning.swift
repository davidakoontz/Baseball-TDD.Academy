//
//  Inning.swift
//  Baseball
//
//  Created by David on 12/10/20.
//

import Foundation

public class Inning {
    var number: String      // an inning number 1 - 9 typical game length
    var top: [Play]         // an array of plays in the TOP half of the inning
    var bottom: [Play]    // an array of Plays in the BOTTOM half of the inning
    var summary: String     // the inning's score:  Home to Visitor
    
    init(number: String, top: [Play], bottom: [Play], summary: String) {
        self.number = number
        self.top = top
        self.bottom = bottom
        self.summary = summary
    }
    
 
}
