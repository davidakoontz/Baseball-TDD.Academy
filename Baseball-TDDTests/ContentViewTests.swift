//
//  ContentViewTests.swift
//  Baseball-TDDTests
//
//  Created by David on 11/13/20.
//

import Foundation
import XCTest
import ViewInspector // 1. step ONE of ViewInspector

@testable import Baseball_TDD


extension ContentView: Inspectable {} // 2. step TWO Extend the View to be Inspectable

class ContentViewTests: XCTestCase {
    
    func test_empty_Player_array() throws {
        let players : [Player] = []
        
        let cView = ContentView(players: players)
        
        //let feView = try cView.inspect().forEach().view(PlayerRowView.self, 0)
        
        //hStack = try feView.hStack()
        let message = try cView.inspect().text().string()
        
        XCTAssertEqual(message, "No Players!")
    }
    
    func test_Has_a_Player() throws {
        // arrange
        let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        
        // Currently the ContentView -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView(players: [taylor])

        // note: ViewInspector notation for a Custom View
        let prView = try cView.inspect().forEach().view(PlayerRowView.self, 0)
        let hStack = try prView.hStack()
        let name = try hStack.text(2).string() // 4. step FOUR inspect the view (see Guide.md for methods)
        let atBat = try hStack.text(6).string()  // 4. (the 2 & 6) are indexes in the HStack
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")    // player from data.json
        XCTAssertEqual(atBat, "BB")
        
    }
    

    func test_Has_Two_Players() throws {
        // arrange
        let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        let bill = Player(name: "Bill Swift", number: "18", position: "1", atBat: "K")
        var array: [Player]  = [ taylor, bill ]
        
        
        // Currently the ContentView -> ForEach -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView(players: array)

        // note: ViewInspector notation for a Custom View
        let prView = try cView.inspect().forEach().view(PlayerRowView.self, 0) // the 0th item in forEach
        let hStack = try prView.hStack()
        let name = try hStack.text(2).string() // 4. step FOUR inspect the view (see Guide.md for methods)
        let position = try hStack.text(4).string()
        let jersey = try hStack.text(1).string()
        let atBat = try hStack.text(6).string()  // 4. (the 2 & 6) are indexes in the HStack
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")    // player from data.json
        XCTAssertEqual(position, "8")
        XCTAssertEqual(jersey, "#17")
        XCTAssertEqual(atBat, "BB")
        
        // note: ViewInspector notation for a Custom View
        let prView2 = try cView.inspect().forEach().view(PlayerRowView.self, 1)
        let hStack2 = try prView2.hStack()
        let name2 = try hStack2.text(2).string() // 4. step FOUR inspect the view (see Guide.md for methods)
        let position2 = try hStack2.text(4).string()
        let jersey2 = try hStack2.text(1).string()
        let atBat2 = try hStack2.text(6).string()  // 4. (the 2 & 6) are indexes in the HStack
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name2, "Bill Swift")    // player from data.json
        XCTAssertEqual(position2, "1")
        XCTAssertEqual(jersey2, "#18")
        XCTAssertEqual(atBat2, "K")
        
    }

}
