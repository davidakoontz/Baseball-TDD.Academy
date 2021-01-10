//
//  Game.swift
//  Baseball
//
//  Created by David on 12/23/20.
//

import Foundation

public class Game: Sequence, IteratorProtocol {
    
    // Alis for IteratorProtocol requirement
    public typealias Element = Inning
    
    var innings: [Inning] = []
    var nextInning = 0  // the starting index of Innings
    var visitorLineUp = RingBuffer<Player>(count: 9)
    var homeLineUp = RingBuffer<Player>(count: 9)
    var bases: Bases

    //var roster: [Player]  // the platters on the team
    // future properties like home & away team names; score; play by play; etc


    public func whichInning() -> Int {
        return innings.count
    }
    
    // Iterator & Sequence
    public func next() -> Inning? {
       
        guard nextInning >= 0 && nextInning < innings.count
            else { return nil }
        defer { nextInning += 1 }
        return innings[nextInning]
    }

    /// returns next player to bat
    func batterUp() -> Player {
        if let unwrapped = visitorLineUp.read() {
            return unwrapped
        } else {
            return EmptyPlayer()
        }
    }
    
    /// factory method - creates a Play with next batter -> returns the Play
    func nextBatter() -> Play {
        let batter = batterUp()
        let thisPlay = Play(game: self, description: "...and up to bat is...\(batter.name) number \(batter.number) playing \(batter.position)", batter: batter)
        return thisPlay
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
        _ = visitorLineUp.write(Duke)
        _ = visitorLineUp.write(James)
        _ = visitorLineUp.write(Scott)
        _ = visitorLineUp.write(BillJoy)
        _ = visitorLineUp.write(Andy)
        _ = visitorLineUp.write(Larry)
        _ = visitorLineUp.write(Sun)
        _ = visitorLineUp.write(Tzu)
        _ = visitorLineUp.write(Nike)
    }
    
    func append(inning: Inning) {
        let currentInning = innings.count + 1
        //inning.number = String(currentInning)   // set the inning number
        inning.setNumber( String(currentInning) )
        innings.append(inning)
    }
    
    func inningCount() -> Int {
        return innings.count
    }
    
    init() {
        self.innings = []
        self.bases = Bases()
    }
    
    init(innings: [Inning]) {
        self.innings = innings
        self.bases = Bases()
    }

    init(first: Inning, second: Inning, thrid: Inning, fourth: Inning, fifth: Inning, sixth: Inning, seventh: Inning, eighth: Inning, nineth: Inning) {
        self.innings = [ first, second, thrid, fourth, fifth, sixth, seventh, eighth, nineth ]
        self.bases = Bases()
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
    static let jonathan = Player(name: "Jonathan Swift", number: "67", position: .secondBase)
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

    static let firstInning = Inning(label: "1",
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

    static let second = Inning(label: "2",
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

    static let third = Inning(label: "3",
                              top: [play18, play19, play20, play21],
                              bottom: [play22, play23, play24, play25, play26, play27],
                              summary: "0 to 3")

    static let fourth = Inning(label: "4", top: [], bottom: [], summary: "0 to 0")
    static let fifth = Inning(label: "5", top: [], bottom: [], summary: "0 to 0")
    static let sixth = Inning(label: "6", top: [], bottom: [], summary: "0 to 0")
    static let seventh = Inning(label: "7", top: [], bottom: [], summary: "0 to 0")
    static let eighth = Inning(label: "8", top: [], bottom: [], summary: "0 to 0")
    static let ninth = Inning(label: "9", top: [], bottom: [], summary: "0 to 0")
    
    static var exampleInnings: [Inning] =  [
        /* zero, */ firstInning, second, third, fourth, fifth, sixth, seventh, eighth, ninth
    ]

    static var example = Game(innings: exampleInnings)


}






struct Bases {
    var firstBase: Player = EmptyPlayer()
    var secondBase: Player = EmptyPlayer()
    var thirdBase: Player = EmptyPlayer()
}

public enum BaseNames: String {
    case firstBase = "first"
    case secondBase = "second"
    case thirdBase = "third"
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

