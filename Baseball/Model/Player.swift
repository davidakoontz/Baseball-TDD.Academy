//
//  Player.swift
//  Baseball-TDD
//
//  Created by David on 11/6/20.
//

import Foundation


public class Player: Hashable, Identifiable {
    

    
    //swiftlint:disable identifier_name
    public var id = UUID().uuidString     //  for Identifiable protocol
    var name: String
    var number: String
    var position: String
    var atBat: String
    
    init(name: String, number: String, position: String, atBat: String) {
        self.name = name
        self.number = number
        self.position = position
        self.atBat = atBat
    }

    
     // players may change positions and have various atBats - but jersy # & name remain the same for a game
     // protocol Equatable
     public static func == (lhs: Player, rhs: Player) -> Bool {
         return ( lhs.id == rhs.id )
     }
     
     // see: https://medium.com/better-programming/what-is-hashable-in-swift-6a51627f904
     public func hash(into hasher: inout Hasher) {
         hasher.combine(number)
         hasher.combine(name)
     }
    
    
    // this code might be usefull for the Xcode Preview Canvas
    //

    // top of 1st inning
    static let duke = Player(name: "Duke Java", number: "33", position: "7", atBat: "1B")
    static let james = Player(name: "James Gosling", number: "4", position: "5", atBat: "2B")
    static let scott = Player(name: "Scott McNealy", number: "37", position: "8", atBat: "K..")
    static let billJoy = Player(name: "Bill Joy", number: "39", position: "9", atBat: "F8")
    static let andy = Player(name: "Andy Bechtolsheim", number: "41", position: "1", atBat: "BB")
    static let larry = Player(name: "Larry Ellison", number: "2", position: "1", atBat: "K..")
    // home team - bottom of inning
    static let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
    static let bill = Player(name: "Bill Swift", number: "18", position: "1", atBat: "K")
    static let jonathan = Player(name: "Jonathan Swift", number: "67", position: "4", atBat: "1B")
    static let bob = Player(name: "Bob Swift", number: "8", position: "2", atBat: "DP")
    
    static var atBatList: [Player] =  [
        taylor, bill, jonathan, bob, duke, james, scott, billJoy, andy, larry
    ]

}
