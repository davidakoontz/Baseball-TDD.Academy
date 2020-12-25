//
//  Game.swift
//  Baseball
//
//  Created by David on 12/23/20.
//

import Foundation

public class Game: Sequence, IteratorProtocol {
    
     var innings: [Inning] = []
    // future properties like home & away team names; score; play by play; etc
    
    // IteratorProtocol requirement
    public typealias Element = Inning
    
    var nextInning = 0  // the starting index of Innings
    // Iterator & Sequence
    public func next() -> Inning? {
       
        guard nextInning >= 0 && nextInning < innings.count
            else { return nil }
        defer { nextInning += 1 }
        return innings[nextInning]
    }

    
    
    func append(inning: Inning) {
        let currentInning = innings.count + 1
        inning.number = String(currentInning)   // set the inning number
        innings.append(inning)
    }
    
    func inningCount() -> Int {
        return innings.count
    }
    
    init(innings: [Inning]) {
        self.innings = innings
    }

    init(first: Inning, second: Inning, thrid: Inning, fourth: Inning, fifth: Inning, sixth: Inning, seventh: Inning, eighth: Inning, nineth: Inning) {
        self.innings = [ first, second, thrid, fourth, fifth, sixth, seventh, eighth, nineth ]
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
    static let play1 = Play(description: "Duke hits a grounder to left field", batter: duke, atBat: .single)
    static let play2 = Play(description: "James goes down swinning", batter: james, atBat: .strikeoutSwinging )
    static let play3 = Play(description: "Scott flys out to right field", batter: scott, atBat: .flyOut)
    static let play4 = Play(description: "Bill fouls out", batter: bill, atBat: .foulOut)
    
    // first Inning - bottom half
    static let play5 = Play(description: "Taylor walks", batter: taylor, atBat: .walk)
    static let play6 = Play(description: "Bill hits a double", batter: bill, atBat: .double)
    static let play7 = Play(description: "Jonathan hits a triple", batter: jonathan, atBat: .triple)
    static let play8 = Play(description: "Bob hits a scrafice fly to left filed - scoring Jonathan", batter: bob, atBat: .sacrificeFly)
    static let play9 = Play(description: "Kay goes down looking", batter: kay, atBat: .strikeoutLooking)
    static let play10 = Play(description: "Patrick lines out to short", batter: patrick, atBat: .lineOut)
    
    static let firstInning = Inning(number: "1",
                              top: [play1, play2, play3, play4 ],
                              bottom: [play5, play6, play7, play8, play9, play10 ],
                              summary: "0 to 3")
    

    // Second Inning
    static let play11 = Play(description: "Andy gets a double", batter: andy, atBat: .double)
    static let play12 = Play(description: "Larry is eliminated with a fast ball to the inside corner", batter: larry, atBat: .strikeoutLooking )
    static let play13 = Play(description: "Sun Li hits a short hopper to center", batter: sun, atBat: .single)
    static let play14 = Play(description: "Sun Tzu hits into a classic 6-4-3 double play", batter: tzu, atBat: .doublePlay)
    
    static let play15 = Play(description: "Todd hits a line drive down the thridbase line", batter: todd, atBat: .single)
    static let play16 = Play(description: "connor goes deep to right field - it's out of here!", batter: connor, atBat: .homeRun)
    static let play17 = Play(description: "ellen is intentionally walked", batter: ellen, atBat: .intentionalWalk)
    
    static let second = Inning(number: "2",
                               top: [play11, play12, play13, play14 ],
                               bottom: [play15, play16, play17],
                               summary: "0 to 2")
    
    static let third = Inning(number: "3", top: [], bottom: [], summary: "0 to 0")
    static let fourth = Inning(number: "4", top: [], bottom: [], summary: "0 to 0")
    static let fifth = Inning(number: "5", top: [], bottom: [], summary: "0 to 0")
    static let sixth = Inning(number: "6", top: [], bottom: [], summary: "0 to 0")
    static let seventh = Inning(number: "7", top: [], bottom: [], summary: "0 to 0")
    static let eighth = Inning(number: "8", top: [], bottom: [], summary: "0 to 0")
    static let ninth = Inning(number: "9", top: [], bottom: [], summary: "0 to 0")
    
    static var exampleInnings: [Inning] =  [
        /* zero, */ firstInning, second, third, fourth, fifth, sixth, seventh, eighth, ninth
    ]

    static var example = Game(innings: exampleInnings)
   

    
    
    


}
