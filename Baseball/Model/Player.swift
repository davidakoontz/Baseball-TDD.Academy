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
        super.init(name:"Empty Player", number: "0", position: .designatedHitter)
    }
}

extension Player {
    // this code might be usefull for the Xcode Preview Canvas
    //
    static var visitorsAtBatList: [Player] =  [
        duke, james, scott, billJoy, andy, larry, sun, tzu, nike ]
    static var homeAtBatList: [Player] =  [
        taylor, bill, jonathan, bob, kay, patrick, todd, connor, ellen ]
    
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
    
    // home team (bat bottom of innings)
   static let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
   static let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
   static let jonathan = Player(name: "Jonathan Swift", number: "67", position: .leftField)
   static let bob = Player(name: "Bob Swift", number: "8", position: .catcher)
   static let kay = Player(name: "Kay Swift", number: "87", position: .firstBase)
   static let patrick = Player(name: "Patrick Swift", number: "55", position: .secondBase)
   static let todd = Player(name: "Todd Swift", number: "73", position: .thirdBase)
   static let connor = Player(name: "Connor Swift", number: "6", position: .rightField)
   static let ellen = Player(name: "Ellen Swift", number: "88", position: .shortStop)
   
    
}
