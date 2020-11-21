//
//  Player.swift
//  Baseball-TDD
//
//  Created by David on 11/6/20.
//

import Foundation


public class Player : Codable, Identifiable {

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
    
    
    static let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
    static let bill = Player(name: "Bill Swift", number: "18", position: "1", atBat: "K")
    
    static var example: [Player] =  [
        taylor, bill
    ]

}
