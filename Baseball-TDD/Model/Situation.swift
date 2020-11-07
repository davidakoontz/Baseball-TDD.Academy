//
//  Situation.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import Foundation

// the current game situation - I don't know what this is yet
// but think it is the Game Situation like
// Top of the 5th Inning
// 1 Out  0 Strikes 2 Balls
// Runners on 1st

public class Situation {
    var outs : Int   // the current (offense) team's count of outs - they only get 3.
    
    init() {
        outs = 0
    }
    
}
