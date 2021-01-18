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
        XCTAssertEqual( aPlay.runnerOutcomes.firstBaseLine, .blank )
        XCTAssertEqual( aPlay.whosOn().secondBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.secondBaseLine, .blank )
        XCTAssertEqual( aPlay.whosOn().thirdBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.thirdBaseLine, .blank)
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

    


    func test_called_Single() throws {
        let game = Game()
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(game: game, description: "say something on the air", batter: batter )
        
        aPlay.umpCalled(.single)

        XCTAssertEqual( aPlay.whosOn().firstBase, batter )
        XCTAssertEqual(aPlay.runnerOutcomes.firstBaseLine.rawValue, "1B")
    }
    
    
    func testRunnerOn_firstBaseSingleBySecondBatter() throws {
        let game = Game()
        game.setVisitorTeamLineUp()          // game needs a lineUp to populate the next batter
        let firstPlay = game.nextBatter()
        firstPlay.umpCalled(.single)
        
        XCTAssertEqual(firstPlay.whosOn().secondBase.name, "EMPTY Player")
        XCTAssertEqual(firstPlay.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(firstPlay.runnerOutcomes.secondBaseLine.rawValue, "_")

        let secondPlay = game.nextBatter()

        game.runnerOn(.firstBase, action: .advances)

        secondPlay.umpCalled(.single)

        XCTAssertEqual(secondPlay.whosOn().secondBase.name, "Duke Java")
        XCTAssertEqual(secondPlay.whosOn().firstBase.name, "James Gosling")
        XCTAssertEqual(secondPlay.runnerOutcomes.secondBaseLine.rawValue, "AB")
        
        XCTAssertEqual(game.currentPlay().runnerOutcomes.secondBaseLine.rawValue, "AB")
    }
    
    func testRunnerOn_BasesLoadedSituation() throws {
        let game = Game()
        
        let batter1 = Player(name: "Runner 1", number: "1", position: .centerField)
        let batter2 = Player(name: "Runner 2", number: "2", position: .rightField)
        let batter3 = Player(name: "Batter", number: "3", position: .leftField)
        let firstPlay = Play(game: game, description: "say something on the air", batter: batter1)
        let secondPlay = Play(game: game, description: "say something on the air", batter: batter2)
        let thirdPlay = Play(game: game, description: "say something on the air", batter: batter3)
        
        firstPlay.umpCalled(.single)

        game.runnerOn(.firstBase, action: .advances )
        secondPlay.umpCalled(.single)

        game.runnerOn(.secondBase, action: .advances )
        game.runnerOn(.firstBase, action: .advances )
        thirdPlay.umpCalled(.single)
        
        
        XCTAssertEqual(game.whosOn().thirdBase, batter1)
        XCTAssertEqual(game.whosOn().secondBase, batter2)
        XCTAssertEqual(game.whosOn().firstBase, batter3)
        
        // from thrid to home plate
        XCTAssertEqual(game.currentPlay().runnerOutcomes.thirdBaseLine.rawValue, "AB")      // from second to third
        XCTAssertEqual(game.currentPlay().runnerOutcomes.secondBaseLine.rawValue, "AB")       // from first to second
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine.rawValue, "_")        // from batter's box (arround home plate) to first

    }
 
    func testRunnerOn_BatterWalksBasesLoadedSituation() throws {
        let game = Game()
        
        let batter1 = Player(name: "Runner 1", number: "1", position: .centerField)
        let batter2 = Player(name: "Runner 2", number: "2", position: .rightField)
        let batter3 = Player(name: "Runner 3", number: "3", position: .leftField)
        
        let batter4 = Player(name: "Batter 4", number: "4", position: .firstBase)
        
        let firstPlay = Play(game: game, description: "say something on the air", batter: batter1)
        let secondPlay = Play(game: game, description: "say something on the air", batter: batter2)
        let thirdPlay = Play(game: game, description: "say something on the air", batter: batter3)
        let fourthPlay = Play(game: game, description: "say something on the air", batter: batter4)
        
        
        // having to explisitly move players around the bases - via method calls -- SUCKS << FixMe with automatic advancement
        firstPlay.umpCalled(.single)

        game.runnerOn(.firstBase, action: .advances )
        secondPlay.umpCalled(.single)

        game.runnerOn(.secondBase, action: .advances )
        game.runnerOn(.firstBase, action: .advances )
        thirdPlay.umpCalled(.single)

        // the ORDER matters a lot - you must advance runners in (play order)
        game.runnerOn(.thirdBase, action: .advances)
        game.runnerOn(.secondBase, action: .advances)
        game.runnerOn(.firstBase, action: .advances)
        fourthPlay.umpCalled(.walk)
        
        XCTAssertEqual(firstPlay.whosOn().homePlate.name, batter1.name)
        XCTAssertEqual(firstPlay.whosOn().thirdBase.name, batter2.name)
        XCTAssertEqual(secondPlay.whosOn().secondBase.name, batter3.name)
        XCTAssertEqual(thirdPlay.whosOn().firstBase.name, batter4.name)
        
        let thisPlay = game.currentPlay()
        XCTAssertEqual(thisPlay.runnerOutcomes.firstBaseLine.rawValue, "_")
        XCTAssertEqual(thisPlay.runnerOutcomes.secondBaseLine.rawValue, "AB")
        XCTAssertEqual(thisPlay.runnerOutcomes.thirdBaseLine.rawValue, "AB")
        XCTAssertEqual(thisPlay.runnerOutcomes.homeBaseLine.rawValue, "SCORES")
        
        XCTAssertEqual(game.score.visitor, 1)
        XCTAssertEqual(game.score.home, 0)
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
