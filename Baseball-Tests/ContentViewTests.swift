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
    
    func test_Has_a_Player() throws {
        // arrange
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let play = Play(description: "that a great play", batter: taylor, atBat: .single)
        
        let inning = Inning(number: "1", top: [play], bottom: [], summary: "0 to 0")
        let arrayOfInnings: [Inning]  = [ inning]
        let aGame = Game(innings: arrayOfInnings)
        
        print( inning.number )
        print(arrayOfInnings.count)
        // Currently the ContentView -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView(game: aGame)
        
        let name = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(2).string()
        //let atBat = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(4).string()
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")    
        //XCTAssertEqual(atBat, "BB")
        
    }
    

    func test_Has_Two_Players() throws {
        // arrange
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
        let play1 = Play(description: "that a great play", batter: taylor, atBat: .walk)
        let play2 = Play(description: "that a great play", batter: bill, atBat: .strikeoutLooking )
        
        
        let inning = Inning(number: "1", top: [ play1, play2 ], bottom: [], summary: "0 to 0")
        let arrayOfInnings: [Inning]  = [ inning]
        let aGame = Game(innings: arrayOfInnings)
        
        // Currently the ContentView -> ForEach -> PlayerRowView -> HStack ->  Text...
        // act
        let cView = ContentView(game: aGame)


        let jersey = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(1).string()
        let name = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(2).string()
        let position = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(3).string()
        //let atBat = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(0).text(4).string()
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")
        XCTAssertEqual(position, "8")
        XCTAssertEqual(jersey, "#17")
       // XCTAssertEqual(atBat, "BB")
        

        let jersey2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(1).string()
        let name2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(2).string()
        let position2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(3).string()
       // let atBat2 = try cView.inspect().scrollView().lazyVGrid().section(0).forEach(0).tupleView(1).text(4).string()
        
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name2, "Bill Swift")
        XCTAssertEqual(position2, "1")
        XCTAssertEqual(jersey2, "#18")
       // XCTAssertEqual(atBat2, "K")
        
    }

}
