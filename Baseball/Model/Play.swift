//
//  Play.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import Foundation

// Global variable
var sequenceNumber: Int = 0

// A baseball play typically starts with a pitch and then the batter may or may not swing and hit the ball.
// The play continues if the batter hits the ball (In Play) and then the fielders get the ball and try to
// throw the ball to an infielder to tag a player or the base.
//
public class Play: Identifiable {
    public private(set) var number: Int
    public private(set) var id = UUID().uuidString     //  for Identifiable protocol
    public private(set) var description: String
    public private(set) var batter: Player
    public private(set) var outcome: AtBat
    
    
    
    init( description: String, batter: Player, atBat: AtBat) {
        sequenceNumber += 1                     // increment the number
        self.number = sequenceNumber            // sequence count of the plays in the game
        self.description = description          // imagine the announcer calling the game
        self.batter = batter                    // the Player at bat
        // more properties
        self.outcome = atBat
    }
    
    public func atBat() -> String {
        return outcome.rawValue
    }
}

// The outcome of a batter's attempt to hit
public enum AtBat: String, CaseIterable {
    // typical name = Scrorecard shorthand notation
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
