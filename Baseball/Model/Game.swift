//
//  Game.swift
//  Baseball
//
//  Created by David on 12/23/20.
//

import Foundation

public class Game: Sequence, IteratorProtocol, ObservableObject {
    
    // Alis for IteratorProtocol requirement
    public typealias Element = Inning
    
    var innings: [Inning] = []
    var nextInning = 0  // the starting index of Innings
    var visitorLineUp = LineUp()
    var homeLineUp = LineUp()
    var bases: Bases
    var teamAtBat: Team = Team.visitor
    var score: Score 

    //var roster: [Player]  // the platters on the team
    // future properties like home & away team names; score; play by play; etc

    // MARK: Init methods
    init() {
        self.innings = []
        self.bases = Bases()
        self.score = Score()
    }
    
    init(innings: [Inning]) {
        self.innings = innings
        self.bases = Bases()
        self.score = Score()
    }

    init(first: Inning, second: Inning, thrid: Inning, fourth: Inning, fifth: Inning, sixth: Inning, seventh: Inning, eighth: Inning, nineth: Inning) {
        self.innings = [ first, second, thrid, fourth, fifth, sixth, seventh, eighth, nineth ]
        self.bases = Bases()
        self.score = Score()
    }
    
    // MARK: Iterator methods
    // Iterator & Sequence Protocol requires Public next method.
    public func next() -> Inning? {
       
        guard nextInning >= 0 && nextInning < innings.count
            else { return nil }
        defer { nextInning += 1 }
        return innings[nextInning]
    }


    // MARK: Inning methods
    
    func appendInning(inning: Inning) {
        let currentInning = innings.count + 1
        inning.setLabel( String(currentInning) )
        innings.append(inning)
    }
    
    public func switchFields() {
        // after 3 outs the teams switch fields
        if teamAtBat == Team.visitor {
            teamAtBat = Team.home
        } else {
            teamAtBat = Team.visitor
        }
    }
    
      func whichTeamAtBat() -> Team {
          return teamAtBat
      }
      
      func whichInning() -> Int {
          return innings.count
      }
      
      func whichHalf() -> InningHalf {
          if teamAtBat == Team.visitor {
              return InningHalf.top
          } else {
              return InningHalf.bottom
          }
      }
      
      func currentInning() -> Inning {
          // Create the First Inning if none exist. then return it.
          if inningCount() <= 0 {
              let first = Inning(label: "1", game: self, top: [], bottom: [], summary: "0 to 0")
              innings.append(first)
              return first
          }
          return innings[inningCount()-1]
      }
      
      func inningCount() -> Int {
          return innings.count
      }
    
    // MARK: Batter methods
    
    /// returns next player to bat
    private func batterUp() -> Player {
        if teamAtBat == Team.visitor {
            return visitorLineUp.nextBatterInLineUp()
        } else {
            return homeLineUp.nextBatterInLineUp()
        }
    }
    
    /// factory method - creates a Play with next batter, puts the Play in the Inning top/bottom then -> returns the Play
    func nextBatter() -> Play {
        let inning = currentInning()
 
        let batter = batterUp()
        // Create a NEW Play for this batter
        let thisPlay = Play(game: self, description: "...and up to bat is...\(batter.name) number \(batter.number) playing \(batter.position)", batter: batter)
        // a play should be appended to the proper Inning half
        inning.append(thisPlay, teamAtBat: teamAtBat)

        return thisPlay
    }
    
    // MARK: Runner methods
    
    func runnerOn(_ base: BaseNames, action: RunnerActions) {
        let inning = currentInning()

        let play = inning.currentPlay()
        
        switch base {
        // we do not record runner actions for the box to first base line - that's done in  Play.called()
        case BaseNames.firstBase:
            if action == RunnerActions.advances {
                bases.secondBase = bases.firstBase        // the player moves to second
            } else if action == RunnerActions.advances2 {
                bases.thirdBase = bases.firstBase
                play.runnerOutcomes.thirdBaseLine = action
            } else if action == RunnerActions.advances3 {
                bases.homePlate = bases.firstBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.thirdBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
            }
            play.runnerOutcomes.secondBaseLine = action
        case BaseNames.secondBase:
            if action == RunnerActions.advances {
                bases.thirdBase = bases.secondBase        // the player moves to third
            } else if action == RunnerActions.advances2 {
                bases.homePlate = bases.secondBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
            } else if action == RunnerActions.advances3 {
                bases.homePlate = bases.secondBase
                play.runnerOutcomes.thirdBaseLine = action
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
            }
            play.runnerOutcomes.thirdBaseLine = action
        case BaseNames.thirdBase:
            if action == RunnerActions.advances {
                bases.homePlate = bases.thirdBase        // the player moves to home
                score.Add(runs: 1, teamAtBat: teamAtBat)
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
            } else if action == RunnerActions.advances2 {
                bases.homePlate = bases.thirdBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
            } else if action == RunnerActions.advances3 {
                bases.homePlate = bases.thirdBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
            }
        case BaseNames.homePlate:
            // there is no action for home plate
            print("baseball score is \(score.visitor) to \(score.home)")
        }
    }
    
    func currentPlay() -> Play {
        return currentInning().currentPlay()
    }
    
    func whosOn() -> Bases {
        return bases        // should this be a copy?
    }
    



    // MARK: Team LineUp methods
    
    func setLineUp( lineUp: [Player], team: Team ) {
        if team == Team.home {
            homeLineUp.assign(list: lineUp)
        } else {
            visitorLineUp.assign(list: lineUp)
        }
    }
    
    func getDefaultTeamLineUp() ->  [Player]  {
        let player1 = Player(name: "Player 1", number: "33", position: .shortStop)
        let player2 = Player(name: "Player 2", number: "4",  position: .leftField)
        let player3 = Player(name: "Player 3", number: "37", position: .centerField)
        let player4 = Player(name: "Player 4", number: "39", position: .rightField)
        let player5 = Player(name: "Player 5", number: "41", position: .pitcher)
        let player6 = Player(name: "Player 6", number: "2",  position: .catcher)
        let player7 = Player(name: "Player 7", number: "62", position: .firstBase)
        let player8 = Player(name: "Player 8", number: "99", position: .secondBase)
        let player9 = Player(name: "Player 9", number: "42", position: .thirdBase)
        return [player1, player2, player3, player4, player5, player6, player7, player8, player9]
    }
    
    func setHomeTeamLineUp() {
        let player1 = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let player2 = Player(name: "Bill Swift", number: "18",  position: .pitcher)
        let player3 = Player(name: "Jonathan Swift", number: "67", position: .leftField)
        let player4 = Player(name: "Bob Swift", number: "8", position: .catcher)
        let player5 = Player(name: "Kay Swift", number: "87", position: .firstBase)
        let player6 = Player(name: "Patrick Swift", number: "55",  position: .secondBase)
        let player7 = Player(name: "Todd Swift", number: "73", position: .thirdBase)
        let player8 = Player(name: "Connor Swift", number: "6", position: .rightField)
        let player9 = Player(name: "Ellen Swift", number: "88", position: .shortStop)
        homeLineUp.add(player1)
        homeLineUp.add(player2)
        homeLineUp.add(player3)
        homeLineUp.add(player4)
        homeLineUp.add(player5)
        homeLineUp.add(player6)
        homeLineUp.add(player7)
        homeLineUp.add(player8)
        homeLineUp.add(player9)
    }
    
    func setVisitorTeamLineUp() {
        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        visitorLineUp.add(Duke)
        visitorLineUp.add(James)
        visitorLineUp.add(Scott)
        visitorLineUp.add(BillJoy)
        visitorLineUp.add(Andy)
        visitorLineUp.add(Larry)
        visitorLineUp.add(Sun)
        visitorLineUp.add(Tzu)
        visitorLineUp.add(Nike)
    }
    
        // visitors always bat first (top of innings)
    static let duke = Player(name: "Duke Java", number: "33", position: .leftField)
    static let james = Player(name: "James Gosling", number: "4", position: .thirdBase)
    static let scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
    static let billJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
    static let andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
    static let larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
    static let sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
    static let tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
    static let nike = Player(name: "Nike Sun", number: "42", position: .shortStop)

        // home team (bottom of innings)
    static let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
    static let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
    static let jonathan = Player(name: "Jonathan Swift", number: "67", position: .leftField)
    static let bob = Player(name: "Bob Swift", number: "8", position: .catcher)
    static let kay = Player(name: "Kay Swift", number: "87", position: .firstBase)
    static let patrick = Player(name: "Patrick Swift", number: "55", position: .secondBase)
    static let todd = Player(name: "Todd Swift", number: "73", position: .thirdBase)
    static let connor = Player(name: "Connor Swift", number: "6", position: .rightField)
    static let ellen = Player(name: "Ellen Swift", number: "88", position: .shortStop)


    // first Inning - top half
    static let game = Game()    // a new game - no innings yet.

    static let play1 = Play(game: game, description: "Duke hits a grounder to left field", batter: duke, atBat: AtBat.single)
    static let play2 = Play(game: game, description: "James goes down swinning", batter: james, atBat: AtBat.strikeoutSwinging )
    static let play3 = Play(game: game, description: "Scott flys out to right field", batter: scott, atBat: AtBat.flyOut)
    static let play4 = Play(game: game, description: "Bill fouls out", batter: bill, atBat: AtBat.foulOut)

    
    // first Inning - bottom half
    static let play5 = Play(game: game, description: "Taylor walks", batter: taylor, atBat: AtBat.walk)
    static let play6 = Play(game: game, description: "Bill hits a double", batter: bill, atBat: AtBat.double)
    static let play7 = Play(game: game, description: "Jonathan hits a triple", batter: jonathan, atBat: AtBat.triple)
    static let play8 = Play(game: game, description: "Bob hits a scrafice fly to left filed - scoring Jonathan", batter: bob, atBat: AtBat.sacrificeFly)
    static let play9 = Play(game: game, description: "Kay goes down looking", batter: kay, atBat: AtBat.strikeoutLooking)
    static let play10 = Play(game: game, description: "Patrick lines out to short", batter: patrick, atBat: AtBat.lineOut)

    static let firstInning = Inning(label: "1", game: game,
                              top: [play1, play2, play3, play4 ],
                              bottom: [play5, play6, play7, play8, play9, play10 ],
                              summary: "0 to 3")
    

    // Second Inning
    static let play11 = Play(game: game, description: "Andy gets a double", batter: andy, atBat: AtBat.double)
    static let play12 = Play(game: game, description: "Larry is eliminated with a fast ball to the inside corner", batter: larry, atBat: AtBat.strikeoutLooking )
    static let play13 = Play(game: game, description: "Sun Li hits a short hopper to center", batter: sun, atBat: AtBat.single)
    static let play14 = Play(game: game, description: "Sun Tzu hits into a classic 6-4-3 double play", batter: tzu, atBat: AtBat.doublePlay)

    static let play15 = Play(game: game, description: "Todd hits a line drive down the thridbase line", batter: todd, atBat: AtBat.single)
    static let play16 = Play(game: game, description: "connor goes deep to right field - it's out of here!", batter: connor, atBat: AtBat.homeRun)
    static let play17 = Play(game: game, description: "ellen is intentionally walked", batter: ellen, atBat: AtBat.intentionalWalk)

    static let second = Inning(label: "2", game: game,
                               top: [play11, play12, play13, play14 ],
                               bottom: [play15, play16, play17],
                               summary: "0 to 2")
    // Third Inning
    static let play18 = Play(game: game, description: "Nike gets a double", batter: nike, atBat: AtBat.double)
    static let play19 = Play(game: game, description: "Duke is eliminated with a fast ball to the inside corner", batter: duke, atBat: AtBat.strikeoutSwinging)
    static let play20 = Play(game: game, description: "James hits a short hopper to center", batter: james, atBat: AtBat.single)
    static let play21 = Play(game: game, description: "Scott Tzu hits into a classic 6-4-3 double play", batter: scott, atBat: AtBat.doublePlay)
    // Third Inning - bottom half
    static let play22 = Play(game: game, description: "Taylor walks", batter: taylor, atBat: AtBat.walk)
    static let play23 = Play(game: game, description: "Bill hits a double", batter: bill, atBat: AtBat.double)
    static let play24 = Play(game: game, description: "Jonathan hits a triple", batter: jonathan, atBat: AtBat.triple)
    static let play25 = Play(game: game, description: "Bob hits a scrafice fly to left filed - scoring Jonathan", batter: bob, atBat: AtBat.sacrificeFly)
    static let play26 = Play(game: game, description: "Kay goes down looking", batter: kay, atBat: AtBat.strikeoutLooking)
    static let play27 = Play(game: game, description: "Patrick lines out to short", batter: patrick, atBat: AtBat.lineOut)

    static let third = Inning(label: "3", game: game,
                              top: [play18, play19, play20, play21],
                              bottom: [play22, play23, play24, play25, play26, play27],
                              summary: "0 to 3")

    static let fourth = Inning(label: "4", game: game, top: [], bottom: [], summary: "0 to 0")
    static let fifth = Inning(label: "5", game: game, top: [], bottom: [], summary: "0 to 0")
    static let sixth = Inning(label: "6", game: game, top: [], bottom: [], summary: "0 to 0")
    static let seventh = Inning(label: "7", game: game, top: [], bottom: [], summary: "0 to 0")
    static let eighth = Inning(label: "8", game: game, top: [], bottom: [], summary: "0 to 0")
    static let ninth = Inning(label: "9", game: game, top: [], bottom: [], summary: "0 to 0")
    
    static var exampleInnings: [Inning] =  [
        /* zero, */ firstInning, second, third, fourth, fifth, sixth, seventh, eighth, ninth
    ]

    static var example = Game(innings: exampleInnings)


} // end of Game class


public struct Score {
    var visitor = 0
    var home = 0
    
    mutating func Add(runs: Int, teamAtBat: Team) {
        if teamAtBat == Team.visitor {
            visitor += runs
        } else {
            home += runs
        }
    }
}

public enum Team: String {
    case visitor = "Visitors"
    case home = "Home"
}

public enum InningHalf: String {
    case top = "Top"
    case bottom = "Bottom"
}

struct Bases {
    var firstBase: Player = EmptyPlayer()
    var secondBase: Player = EmptyPlayer()
    var thirdBase: Player = EmptyPlayer()
    var homePlate: Player = EmptyPlayer()
}

public enum BaseNames: String {
    case firstBase = "first"
    case secondBase = "second"
    case thirdBase = "third"
    case homePlate = "home"
}

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

