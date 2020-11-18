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
        //let players: [Player] = []
        
        let cView = ContentView()
        
        //let feView = try cView.inspect().forEach().view(PlayerRowView.self, 0)
        
        //hStack = try feView.hStack()
        let message = try cView.inspect().text().string()
        
        XCTAssertEqual(message, "No Players!")
    }
    
    func test_Has_a_Player() throws {
        // arrange
        //let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        
        // Currently the ContentView -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView()

        // note: ViewInspector notation for a Custom View
        let prView = try cView.inspect().view(PlayerRowView.self)
        let hStack = try prView.hStack()
        let name = try hStack.text(2).string() // 4. step FOUR inspect the view (see Guide.md for methods)
        let atBat = try hStack.text(6).string()  // 4. (the 2 & 6) are indexes in the HStack
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "T. Swift")    // player from data.json
        XCTAssertEqual(atBat, "BB")
        
    }
    
    func test_Has_Two_Players() throws {
        // arrange
   
        // Currently the ContentView -> ForEach -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView()

        // note: ViewInspector notation for a Custom View
        let prView = try cView.inspect().forEach().view(PlayerRowView.self, 0) // the 0th item in forEach
        let hStack = try prView.hStack()
        let name = try hStack.text(2).string() // 4. step FOUR inspect the view (see Guide.md for methods)
        let atBat = try hStack.text(6).string()  // 4. (the 2 & 6) are indexes in the HStack
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "T. Swift")    // player from data.json
        XCTAssertEqual(atBat, "BB")
        
    }
}
