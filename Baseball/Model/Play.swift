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
    var number: Int
    public var id = UUID().uuidString     //  for Identifiable protocol
    var description: String
    var batter: Player
    var outcome: AtBat
    
    private var runnerOutcomes : RunnerOutcomes
    
    
    init( description: String, batter: Player) {
        sequenceNumber += 1                     // increment the number
        self.number = sequenceNumber            // sequence count of the plays in the game
        self.description = description          // imagine the announcer calling the game
        self.batter = batter                    // the Player at bat
        // more properties
        self.outcome = AtBat.inBox              // Batter in the batter's Box - still at bat
        runnerOutcomes = RunnerOutcomes()
    }
    
    func called(_ atBat: AtBat) {        // called by Umpire
        outcome = atBat
    }
    
    func atBat() -> AtBat {
        return outcome
    }
    
    func whosOn() -> RunnerOutcomes {
        return runnerOutcomes        // should this be a copy?
    }
    
    func runnerAdvances(action: RunnerActions, base: Bases) {
        /*switch base {
         case .firstBase:
         if action == RunnerActions.advances {
         runnerOutcomes.secondBase = "H"
         //runnerOutcomes.firstBase = ""
         }
         runnerOutcomes.firstBase = action.rawValue
         case .secondBase:
         runnerOutcomes.secondBase = action.rawValue
         case .thirdBase:
         runnerOutcomes.thirdBase = action.rawValue
         }
         }
         
         */
    }
}

class EmptyPlayer : Player{
    init() {
        super.init(name:"", number: "0", position: .designatedHitter)
    }
}

struct RunnerOutcomes {
    var firstBase: Player = EmptyPlayer()
    var firstBaseOutcomes: String = ""
    var secondBase: Player = EmptyPlayer()
    var secondBaseOutcomes: String = ""
    var thirdBase: Player = EmptyPlayer()
    var thirdBaseOutcomes: String = ""
}

enum RunnerActions: String {
    case advances = "AB"
    case caughtStealing = "CS"
    case baseIsHeld = "H"
}

enum Bases: String {
    case firstBase = "1B"
    case secondBase = "2B"
    case thirdBase = "3B"
}

// The outcome of a batter's attempt to hit
public enum AtBat: String, CaseIterable {
    // typical name = Scrorecard shorthand notation
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

