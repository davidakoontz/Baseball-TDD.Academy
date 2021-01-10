//
//  PlayTest.swift
//  Baseball-Tests
//
//  Created by David on 12/17/20.
//

import XCTest
@testable import Baseball

class PlayTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_BasicPlay() throws {
        let game = Game()
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(game: game, description: "say something on the air", batter: batter )
        
        XCTAssertEqual(aPlay.description, "say something on the air")
        XCTAssertEqual(aPlay.atBat.rawValue, "AT")        // player is still AT bat
        XCTAssertTrue(aPlay.batter == batter)
    }
    
    func testInit_BaseEmptyAtInit() throws {
        let game = Game()
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(game: game, description: "say something on the air", batter: batter)

        // when no runner on any bases
        XCTAssertEqual( aPlay.atBat, AtBat.inBox)
        XCTAssertEqual( aPlay.whosOn().firstBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.firstBaseLine, "" )
        XCTAssertEqual( aPlay.whosOn().secondBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.secondBaseLine, "" )
        XCTAssertEqual( aPlay.whosOn().thirdBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.thirdBaseLine, "" )
    }
/*
    * Story: Runner Advancement <priority 1-A>
    As a parent viewing a game
    I can associate the runner actions with the batter (e.g.  AB4)
    So that I can track the in play action 
        Could be done on data entry screen in text - example: “AB4”
        Could be done on a simulated interactive baseball diamond - drag player icon.
        perhaps Play needs a property for each base 1 - 3; where a runner can occupy
*/

    


    func testrunnerAdvances_Single() throws {
        let game = Game()
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(game: game, description: "say something on the air", batter: batter )
        
        aPlay.called(.single)

        XCTAssertEqual( aPlay.whosOn().firstBase, batter )
        XCTAssertEqual(aPlay.runnerOutcomes.firstBaseLine, "1B")
    }
    
    
    func testRunnerAdvances_onSingleBySecondBatter() throws {
        let game = Game()
        
        let batter1 = Player(name: "Runner", number: "00", position: .centerField)
        let batter2 = Player(name: "Batter", number: "00", position: .rightField)
        let firstPlay = Play(game: game, description: "say something on the air", batter: batter1)
        let secondPlay = Play(game: game, description: "say something on the air", batter: batter2)
        
        firstPlay.called(.single)

        firstPlay.runnerOn(.firstBase, action: .advances )
        secondPlay.called(.single)

        
        
        XCTAssertEqual(firstPlay.whosOn().secondBase, batter1)
        XCTAssertEqual(secondPlay.whosOn().firstBase, batter2)
        XCTAssertEqual(firstPlay.runnerOutcomes.secondBaseLine, "AB")
    }
    
    
//    func testrunnerAdvances_RunnerScoresARun() throws {
//        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
//        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
//        aPlay.runnerAdvances(action: .advances, base: Bases.thirdBase )
//
//        XCTAssertEqual( aPlay.whosonbase().thirdBase, .advances)
//        XCTAssertEqual( aPlay.whosonbase()().home, .aRun)
//    }
  
    
    //        func testrunnerAdvances_CaughtStealing() throws {
    //        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
    //        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
    //        aPlay.runnerAdvances(action: .caughtStealing, base: Bases.firstBase )
    //
    //            XCTAssertEqual( aPlay.whosOn().runnerOutcome.firstBase , "CS" )
    //
    //    }
}
