//
//  InningTest.swift
//  Baseball-Tests
//
//  Created by David on 12/10/20.
//

import XCTest
@testable import Baseball

class InningTest: XCTestCase {

    func test_init_InningHasSummary() {
        let game = Game()
        let firstInning = game.currentInning()
        XCTAssertTrue( firstInning.summary.contains("0 to 0"))
    }
 
    func test_init_currentInningONE() {
        let game = Game()
        let firstInning = game.currentInning()
        XCTAssertEqual( firstInning.label, "1" )
    }
    
    func test_currentInning_getsFirstInning() {

        let larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let bob = Player(name: "Bob Swift", number: "3", position: .shortStop)

        
        let game = Game()       // created with 9 innings
        let inning = game.currentInning()
        
        let play1 = Play(game: game, description: "that a great play", batter: larry)
        play1.umpCalled(.walk)
        inning.append(play1, teamAtBat: .visitor)
        

        
        let play2 = Play(game: game, description: "that a great play", batter: bob)
        play2.umpCalled(.strikeoutLooking)
        inning.append(play2, teamAtBat: .home)

        
        XCTAssertEqual( game.currentInning().label, "1")
        XCTAssertTrue( game.currentInning().top[0].batter.name.contains("Ellison"))
        
        XCTAssertTrue( game.currentInning().bottom[0].batter.name.contains("Swift"))
        XCTAssertTrue( game.currentInning().summary.contains("0 to 0") )


    }

   
    
    func testInningOneJonathanHitsSingle() {
        let game = Game()
        let jonathan = Player(name: "Jonathan Swift", number: "18", position: .centerField)
        let play = Play(game: game, description: "", batter: jonathan )
        
        play.umpCalled(.single)
        
        let firstInning = Inning(label: "1", game: game,
                             top: [],
                             bottom: [play])
        
        XCTAssertTrue( firstInning.bottom[0].batter.name.contains("Jonathan") )
        XCTAssertEqual( game.whosOn().firstBase.ongoingPlay?.runnerOutcomes.firstBaseLine[1], .single)
    }
    
    func testInningConsistOfPlays() {
        let game = Game()
        let aPlayer = Player(name: "Test PlayerName", number: "00", position: .catcher)
        let aPlay = Play(game: game, description: "this is a test", batter: aPlayer)
        aPlay.umpCalled(.baseOnBalls)
        let firstInning = Inning(label: "1", game: game,
                                 top: [aPlay],
                                 bottom: [])
        
        XCTAssertEqual(firstInning.top[0].description, "this is a test")
    }
    
    func test_append_anInningWithTeamAtBat() {

        let game = Game()   // created with 9 innings
        let aPlayer = Player(name: "Test PlayerName", number: "00", position: .catcher)
        let aPlay = Play(game: game, description: "this is a test", batter: aPlayer)
        aPlay.umpCalled(.baseOnBalls)
        let firstInning = game.currentInning()

        firstInning.append(aPlay, teamAtBat: game.teamAtBat )
        
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
                                 bottom: [])
        
        XCTAssertEqual(game.whichHalf(), InningHalf.top)
        
        firstInning.append(aPlay, teamAtBat: game.teamAtBat)
        
        game.switchFields() // this should triger the inning Half change
        
        XCTAssertEqual(game.whichHalf(), InningHalf.bottom)
    }
    

}
