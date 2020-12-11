//
//  ContentViewTests.swift
//  Baseball-TDDTests
//
//  Created by David on 11/13/20.
//

import Foundation
import XCTest
import ViewInspector // 1. step ONE of ViewInspector

@testable import Baseball


extension ContentView: Inspectable {} // 2. step TWO Extend the View to be Inspectable

class ContentViewTests: XCTestCase {
    
    func test_empty_Player_array() throws {
        let emptyPlayers : [Player] = []
        let emptyPlayerInning = Inning(number: "1", top: emptyPlayers, bottom: [], summary: "0 to 0")
        let arrayOfInnings: [Inning]  = [ emptyPlayerInning]
        
        let cView = ContentView(game: arrayOfInnings)
        
        //let feView = try cView.inspect().forEach().view(PlayerRowView.self, 0)
        
        //hStack = try feView.hStack()
        let message = try cView.inspect().text().string()
        
        XCTAssertEqual(message, "No Players!")
    }
    
    func test_Has_a_Player() throws {
        // arrange
        let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        let inning = Inning(number: "1", top: [taylor], bottom: [], summary: "0 to 0")
        let arrayOfInnings: [Inning]  = [ inning]
        // Currently the ContentView -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView(game: arrayOfInnings)


        
        let name = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(2).string()
        let atBat = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(4).string()
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")    // player from data.json
        XCTAssertEqual(atBat, "BB")
        
    }
    

    func test_Has_Two_Players() throws {
        // arrange
        let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        let bill = Player(name: "Bill Swift", number: "18", position: "1", atBat: "K")
        let array: [Player]  = [ taylor, bill ]
        
        let inning = Inning(number: "1", top: array, bottom: [], summary: "0 to 0")
        let arrayOfInnings: [Inning]  = [ inning]
        
        // Currently the ContentView -> ForEach -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView(game: arrayOfInnings)


        let jersey = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(1).string()
        let name = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(2).string()
        let position = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(3).string()
        let atBat = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(4).string()
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")    // player from data.json
        XCTAssertEqual(position, "8")
        XCTAssertEqual(jersey, "#17")
        XCTAssertEqual(atBat, "BB")
        

        let jersey2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(1).string()
        let name2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(2).string()
        let position2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(3).string()
        let atBat2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(4).string()
        
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name2, "Bill Swift")    // player from data.json
        XCTAssertEqual(position2, "1")
        XCTAssertEqual(jersey2, "#18")
        XCTAssertEqual(atBat2, "K")
        
    }

}
