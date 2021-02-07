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


extension ScoreSheetView: Inspectable {} // 2. step TWO Extend the View to be Inspectable

class ScoreSheetViewTest: XCTestCase {
    
    func test_Has_a_Player() throws {
        // arrange
        let game = Game()
        let inning = game.currentInning()
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let play = Play(game: game, description: "that is a great play", batter: taylor)
        inning.append(play, teamAtBat: .home)
        play.umpCalled(.single)
        

        // act
        let VUT = ScoreSheetView(game: game) //.environmentObject(game)      // VUT = View Under Test
        
        // try ViewInspector find()
        let textView = try VUT.inspect().find(text: "Taylor Swift")         // use find() to print the hiearchy
        print ( "found Taylor Swift in view path: \(textView.pathToRoot)" )
        //                           .scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(2)
        let name  = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(2).string()
        let atBat = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(4).string()
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")
        XCTAssertEqual(atBat, "1B")

    }
    

    func test_Has_Two_Players() throws {
        // arrange
        let game = Game()
        let inning = game.currentInning()
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
        
        let play1 = Play(game: game, description: "that a great play", batter: taylor)
        inning.append(play1, teamAtBat: .home)
        play1.umpCalled(.walk)
        
        let play2 = Play(game: game, description: "that a great play", batter: bill)
        inning.append(play2, teamAtBat: .home)
        play2.umpCalled(.strikeoutLooking)
        
        // act
        let VUT = ScoreSheetView(game: game) //.environmentObject(game)      // VUT = View Under Test

        // try ViewInspector find()
        let textView = try VUT.inspect().find(text: "Taylor Swift")         // use find() to print the hiearchy
        print ( "** Found Taylor Swift in view path: \(textView.pathToRoot)" )
        //                              .scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(2)
        let jersey   = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(1).string()
        let name     = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(2).string()
        let position = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(3).string()
        let atBat    = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(4).string()
        
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")
        XCTAssertEqual(position, "8")
        XCTAssertEqual(jersey, "#17")
        XCTAssertEqual(atBat, "W")
        
        // Taly
        // try ViewInspector find()
        let textView2 = try VUT.inspect().find(text: "Bill Swift")         // use find() to print the hiearchy
        print ( "** Found Bill Swift in view path: \(textView2.pathToRoot)" )
        //                             .scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(1).text(2)
        let jersey2 = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(1).text(1).string()
        let name2 = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(1).text(2).string()
        let position2 = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(1).text(3).string()
        let atBat2 = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(1).text(4).string()
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name2, "Bill Swift")
        XCTAssertEqual(position2, "1")
        XCTAssertEqual(jersey2, "#18")
        XCTAssertEqual(atBat2, "K..")
        
    }

    func test_Has_Two_Innings() throws {
        // arrange
        let game = Game()
        let inning1 = game.currentInning()
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
        
        let play1 = Play(game: game, description: "that was a great play", batter: taylor)
        play1.umpCalled(.walk)
        let play2 = Play(game: game, description: "that is a great play", batter: bill)
        play2.umpCalled(.strikeoutLooking)
        
        inning1.append(play1, teamAtBat: .home)
        
        let inning2 = game.next()!
        inning2.append(play2, teamAtBat: .home)

        // Currently the ContentView -> PlayerRowView -> HStack ->  Text...
        // act
        let VUT = ScoreSheetView(game: game) //.environmentObject(game)      // VUT = View Under Test

        // try ViewInspector find()
        let textView = try VUT.inspect().find(text: "Taylor Swift")
        print ( "** Found Taylor Swift in view path: \(textView.pathToRoot)" )
        //                              .scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(2)
        let inningNo = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).header().text().string()
        //                              .scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(2)
        let name     = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(2).string()
        let atBat    = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(0).section(1).forEach(0).tupleView(0).text(4).string()
        
        print(" Inning #\(inningNo) Player \(name) atBat \(atBat)")

        // TDD - Assert step  (or BDD - THEN)
        XCTAssertTrue(inningNo.contains("inning #1") )
        XCTAssertEqual(name, "Taylor Swift")
        XCTAssertEqual(atBat, "W")
        
        // try ViewInspector find()
        let textView2 = try VUT.inspect().find(text: "Bill Swift")
        print ( "** Bill Swift in view path: \(textView2.pathToRoot)" )
        let inningNo2 = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(1).section(0).header().text().string()
        //                           .scrollView().lazyVGrid().forEach(0).tupleView(1).section(1).forEach(0).tupleView(0).text(2)
        let name4 = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(1).section(1).forEach(0).tupleView(0).text(2).string()
        let atBat4 = try VUT.inspect().scrollView().lazyVGrid().forEach(0).tupleView(1).section(1).forEach(0).tupleView(0).text(4).string()
        
        print(" Inning #\(inningNo2) Player \(name4) atBat \(atBat4)")

        // TDD - Assert step  (or BDD - THEN)
        XCTAssertTrue(inningNo2.contains("inning #2") )
        XCTAssertEqual(name4, "Bill Swift")
        XCTAssertEqual(atBat4, "K..")
    }
    
}
