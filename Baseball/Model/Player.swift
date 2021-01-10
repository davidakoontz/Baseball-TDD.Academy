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
    var number: String      // jeresy number
    var position: Position

    
    init(name: String, number: String, position: Position) {
        self.name = name
        self.number = number
        self.position = position
    }
     
     // see: https://medium.com/better-programming/what-is-hashable-in-swift-6a51627f904
     public func hash(into hasher: inout Hasher) {
         hasher.combine(number)
         hasher.combine(name)
     }
    
    
    // this code might be usefull for the Xcode Preview Canvas
    //

    // top of 1st inning
    static let duke = Player(name: "Duke Java", number: "33", position: .leftField)
    static let james = Player(name: "James Gosling", number: "4", position: .thirdBase)
    static let scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
    static let billJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
    static let andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
    static let larry = Player(name: "Larry Ellison", number: "2", position: .secondBase)
    // home team - bottom of inning
    static let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
    static let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
    static let jonathan = Player(name: "Jonathan Swift", number: "67", position: .secondBase)
    static let bob = Player(name: "Bob Swift", number: "8", position: .catcher)
    
    static var atBatList: [Player] =  [
        taylor, bill, jonathan, bob, duke, james, scott, billJoy, andy, larry
    ]

    
} // end of Player class


extension Player: Equatable {
    public static func == (lhs: Player, rhs: Player) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.number == rhs.number
        
        //  lhs.position == rhs.position &&  Player's may change position!
    }
}


class EmptyPlayer : Player{
    init() {
        super.init(name:"EMPTY Player", number: "0", position: .designatedHitter)
    }
}

public enum Position: String, CaseIterable {
    case pitcher = "1"
    case catcher = "2"
    case firstBase = "3"
    case secondBase = "4"
    case thirdBase = "5"
    case shortStop = "6"
    case leftField = "7"
    case centerField = "8"
    case rightField = "9"
    case extraOutfielder = "10"     // only in Softball - not in baseball
    case designatedHitter = "DH"    // a batter but doesn't go onto the field - bats instead of pitcher
}
