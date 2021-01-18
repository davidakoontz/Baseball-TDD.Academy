//
//  InningTest.swift
//  Baseball-Tests
//
//  Created by David on 12/10/20.
//

import XCTest
@testable import Baseball

class InningTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // visitors always bat first (top of innings)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testInit() throws {
        let game = Game()
        let bob = Player(name: "Bob Swift", number: "3", position: .shortStop)
        let larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let play1 = Play(game: game, description: "that a great play", batter: bob)
        play1.umpCalled(.walk)
        let play2 = Play(game: game, description: "that a great play", batter: larry)
        play2.umpCalled(.strikeoutLooking)
        
        let first = Inning(label: "1", game: game,
                              top: [ play1 ],
                              bottom: [ play2 ],
                              summary: "0 to 0")
        game.appendInning(inning: first)
        
        XCTAssertTrue( first.label.contains("1") )
        XCTAssertTrue( first.top[0].batter.name.contains("Swift"))
        XCTAssertTrue( first.bottom[0].batter.name.contains("Ellison"))
        XCTAssertTrue( first.summary.contains("0 to 0") )
        XCTAssertEqual(game.currentInning().label, "1")

    }

    func testInningHasSummary() throws {
        let game = Game()
        let firstInning = Inning(label: "1", game: game,
                              top: [],
                              bottom: [],
                              summary: "0 to 0")
        XCTAssertTrue( firstInning.summary.contains("0 to 0"))
    }
    
    
    //        static let jonathan = Player(name: "Jonathan Swift", number: "67", position: "4", atBat: "1B")
    func testInningOneJonathanHitsSingle() throws {
        let game = Game()
        let firstInning = Inning(label: "1", game: game,
                             top: [],
                             bottom: [Game.play7],
                             summary: "0 to 0")
        
        XCTAssertTrue( firstInning.bottom[0].batter.name.contains("Jonathan") )
    }
    
    func testInningConsistOfPlays() throws {
        let game = Game()
        let aPlayer = Player(name: "Test PlayerName", number: "00", position: .catcher)
        let aPlay = Play(game: game, description: "this is a test", batter: aPlayer)
        aPlay.umpCalled(.baseOnBalls)
        let firstInning = Inning(label: "1", game: game,
                                 top: [aPlay],
                                 bottom: [],
                                 summary: "0 to 0")
        
        XCTAssertEqual(firstInning.top[0].description, "this is a test")
    }
    
    func test_append_anInningWithTeamAtBat() {
        
        
        // Not setting up a proper Game upon init.  can not call currentInning()
        let game = Game()
        let aPlayer = Player(name: "Test PlayerName", number: "00", position: .catcher)
        let aPlay = Play(game: game, description: "this is a test", batter: aPlayer)
        aPlay.umpCalled(.baseOnBalls)
        let firstInning = Inning(label: "1", game: game, top: [], bottom: [], summary: "0 to 0")
        game.appendInning(inning: firstInning)
        firstInning.append(aPlay, teamAtBat: game.whichTeamAtBat() )
        
        XCTAssertEqual(game.whichHalf(), InningHalf.top)
        XCTAssertEqual(game.currentInning().currentPlay().description, "this is a test")
       
    }
    
    
    func test_whichHalf() {
        let game = Game()
        let aPlayer = Player(name: "Test PlayerName", number: "00", position: .catcher)
        let aPlay = Play(game: game, description: "this is a test", batter: aPlayer)
        aPlay.umpCalled(.baseOnBalls)
        let firstInning = Inning(label: "1", game: game,
                                 top: [aPlay],
                                 bottom: [],
                                 summary: "0 to 0")
        
        XCTAssertEqual(game.whichHalf(), InningHalf.top)
        
        firstInning.append(aPlay, teamAtBat: game.teamAtBat)
        
        game.switchFields() // this should triger the inning Half change
        
        XCTAssertEqual(game.whichHalf(), InningHalf.bottom)
    }
    
    func test_whichInning() {
        let game = Game()
        let aPlayer = Player(name: "Test PlayerName", number: "00", position: .catcher)
        let aPlay = Play(game: game, description: "this is a test", batter: aPlayer)
        aPlay.umpCalled(.baseOnBalls)
        let firstInning = Inning(label: "1", game: game,
                                 top: [aPlay],
                                 bottom: [aPlay],
                                 summary: "0 to 0")
        game.appendInning(inning: firstInning)
        XCTAssertEqual(game.whichInning(),  1)
    }
    
}
