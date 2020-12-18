//
//  Inning.swift
//  Baseball
//
//  Created by David on 12/10/20.
//

import Foundation

public class Inning {
    var number: String  // an inning number 1 - 9 typical game length
    var top: [Player]
    var bottom: [Player]
    var summary: String  // the inning's score:  Home to Visitor
    
    init(number: String, top: [Player], bottom: [Player], summary: String) {
        self.number = number
        self.top = top
        self.bottom = bottom
        self.summary = summary
    }
    
    // just so array indexes match names of innings e.g.  index 1 = first inning
    //static let zero = Inning(number: "0", top: [], bottom: [], summary: "0 to 0")

        // visitors always bat first (top of innings)
        static let duke = Player(name: "Duke Java", number: "33", position: "7", atBat: "1B")
        static let james = Player(name: "James Gosling", number: "4", position: "5", atBat: "2B")
        static let scott = Player(name: "Scott McNealy", number: "37", position: "8", atBat: "K..")
        static let billJoy = Player(name: "Bill Joy", number: "39", position: "9", atBat: "F8")
        static let andy = Player(name: "Andy Bechtolsheim", number: "41", position: "1", atBat: "BB")
        static let larry = Player(name: "Larry Ellison", number: "2", position: "2", atBat: "K")
        // home team (bottom of innings)
        static let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        static let bill = Player(name: "Bill Swift", number: "18", position: "1", atBat: "K")
        static let jonathan = Player(name: "Jonathan Swift", number: "67", position: "4", atBat: "1B")
        static let bob = Player(name: "Bob Swift", number: "8", position: "2", atBat: "DP")
        
    
    static let first = Inning(number: "1",
                              top: [duke, james, scott, billJoy, andy, larry],
                              bottom: [taylor, bill, jonathan, bob],
                              summary: "0 to 0")
    
        static let kay = Player(name: "Kay Swift", number: "87", position: "3", atBat: "BK")
        static let patrick = Player(name: "Patrick Swift", number: "55", position: "4", atBat: "K")
        static let todd = Player(name: "Todd Swift", number: "73", position: "5", atBat: "2B")
        static let connor = Player(name: "Connor Swift", number: "6", position: "9", atBat: "1B")
        static let ellen = Player(name: "Ellen Swift", number: "88", position: "6", atBat: "DP")
     
        static let sun  = Player(name: "Sun Li", number: "62", position: "3", atBat: "1B")
        static let tzu = Player(name: "Sun Tzu", number: "99", position: "4", atBat: "2B")
        static let nike = Player(name: "Nike Sun", number: "42", position: "6", atBat: "TP")
       
           
    static let second = Inning(number: "2",
                               top: [sun, tzu, nike],
                               bottom: [kay, patrick, todd, connor, ellen],
                               summary: "0 to 0")
    
    // visitors always bat first (top of innings)
    //static let duke = Player(name: "Duke Java", number: "33", position: "7", atBat: "2B")
    
    static let third = Inning(number: "3", top: [], bottom: [], summary: "0 to 0")
    static let fourth = Inning(number: "4", top: [], bottom: [], summary: "0 to 0")
    static let fifth = Inning(number: "5", top: [], bottom: [], summary: "0 to 0")
    static let sixth = Inning(number: "6", top: [], bottom: [], summary: "0 to 0")
    static let seventh = Inning(number: "7", top: [], bottom: [], summary: "0 to 0")
    static let eighth = Inning(number: "8", top: [], bottom: [], summary: "0 to 0")
    static let ninth = Inning(number: "9", top: [], bottom: [], summary: "0 to 0")
    
    static var exampleGame: [Inning] =  [
        /* zero, */ first, second, third, fourth, fifth, sixth, seventh, eighth, ninth
    ]

    
    


}
