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
    var game: Game
    /// unique to each play
    var description: String
    var batter: Player
    var atBat: AtBat
    
    var runnerOutcomes : RunnerOutcomes
    
    
    init(game: Game, description: String, batter: Player) {
        self.game = game                        // a play needs to know the Game so it can access the bases, etc.
        sequenceNumber += 1                     // increment the number
        self.number = sequenceNumber            // sequence count of the plays in the game
        self.description = description          // imagine the announcer calling the game
        self.batter = batter                    // the Player at bat
        // more properties
        self.atBat = AtBat.inBox              // Batter in the batter's Box - still at bat
        runnerOutcomes = RunnerOutcomes()
    }
    
    
    init(game: Game, description: String, batter: Player, atBat: AtBat) {
        self.game = game                        // a play needs to know the Game so it can access the bases, etc.
        sequenceNumber += 1                     // increment the number
        self.number = sequenceNumber            // sequence count of the plays in the game
        self.description = description          // imagine the announcer calling the game
        self.batter = batter                    // the Player at bat
        // more properties
        self.atBat = atBat                      // Batter in the batter's Box - still at bat
        runnerOutcomes = RunnerOutcomes()
    }
    
    func umpCalled(_ atBat: AtBat) {        // called by Umpire
        self.atBat = atBat
        switch atBat {
        case .triple:
            game.bases.thirdBase = batter
            runnerOutcomes.firstBaseLine = atBat
            
        //        case .balk, .baseOnBalls, .walk:
        //            runnerOutcomes.firstBase = batter
        //        case .single:
        //            runnerOutcome.firstBase = batter
        default:
            game.bases.firstBase = batter
            runnerOutcomes.firstBaseLine = atBat
        }
    }

} // end of class Play

class EmptyPlay : Play {
    init(theGame: Game) {
        super.init(game: theGame, description: "Empty Play", batter: EmptyPlayer() )
    }
}

/// runner outcomes are displayed on the baseLines (between bases) - there are 4 lines
struct RunnerOutcomes {
    
    var firstBaseLine: AtBat = .blank               // from batter's box (arround home plate) to first
    var secondBaseLine: RunnerActions = .blank      // from first to second
    var thirdBaseLine: RunnerActions = .blank       // from second to third
    var homeBaseLine: RunnerActions = .blank        // from thrid to home plate
}


enum RunnerActions: String {
    case blank = "_"                // an empty or blank runner action
    case advances = "AB"            // with a batter number e.g. AB4 = Advanced by Batter #4 in line up
    case advances2 = "2xAB"         // Advanced 2 bases by Batter X
    case advances3 = "3xAB"         // Advances 3 bases by Batter X
    case caughtStealing = "CS"
    case baseIsHeld = "H"
    case scores = "SCORES"
    
}
