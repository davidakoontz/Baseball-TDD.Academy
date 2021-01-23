//
//  AtBat.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation


// The outcome of a batter's attempt to hit
public enum AtBat: String, CaseIterable {
    // typical name = Scrorecard shorthand notation
    case blank = "_"        // blank or empty
    case inBox = "AT"       // batter still AT bat or inBox
    // ways to get on base
    case single = "1B"
    case double = "2B"
    case triple = "3B"
    case homeRun = "HR"
    
    case walk = "W"         // base on balls or a walk
    case baseOnBalls = "BB" // base on balls or a walk
    
    case fildersChoice = "FC"   // typicalling a hit, but filder makes a choice to put out the lead runner
    
    // types of Outs - numbers are the positions that interact with the ball
    case doublePlay = "DP"
    case caughtStealing = "CS"
    case flyOut = "F"
    case foulOut = "FO"
    case groundOut = "G"
    case strikeoutSwinging = "K"
    case strikeoutLooking = "K.."  // the two dots are eyes
    case lineOut = "L"
    case sacrificeFly = "SF"    // batter is out - but advances the runner
    case sacrificeHit = "SH"    // also perhaps a bunt
    case triplePlay = "TP"
    case unassistedOut = "U"
    
    // errors etc
    case balk = "BK"            // batter goes to first base; a pitching mistake
    case error = "E"            // filder makes an error allowing batter to get on base
    case hitByPitch = "HBP"     // batter goes to first base
    case interference = "I"     // typically a catcher interfers with the swing
    case intentionalWalk = "IW" // pitcher walks the batter by throwing 4 balls
    case passedBall = "PB"      // ball get's passed the catcher
    case wildPitch = "WP"       // pitcher has a bad throw
}

