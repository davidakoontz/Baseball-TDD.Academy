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

        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(description: "say something on the air", batter: batter )
        
        XCTAssertEqual(aPlay.description, "say something on the air")
        XCTAssertEqual(aPlay.atBat().rawValue, "AT")        // player is still AT bat
        XCTAssertTrue(aPlay.batter.name.contains("PlayerName"))
    }
    
    func testInit_BaseEmptyAtInit() throws {
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(description: "say something on the air", batter: batter)

        // when no runner on any bases
        XCTAssertEqual( aPlay.atBat(), AtBat.inBox)
        XCTAssertEqual( aPlay.whosOn().firstBase.name, "")
        XCTAssertEqual( aPlay.whosOn().firstBaseOutcomes, "" )
        XCTAssertEqual( aPlay.whosOn().secondBase.name, "")
        XCTAssertEqual( aPlay.whosOn().secondBaseOutcomes, "" )
        XCTAssertEqual( aPlay.whosOn().thirdBase.name, "")
        XCTAssertEqual( aPlay.whosOn().thirdBaseOutcomes, "" )
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

    
//        func testrunnerAdvances_CaughtStealing() throws {
//        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
//        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
//        aPlay.runnerAdvances(action: .caughtStealing, base: Bases.firstBase )
//
//            XCTAssertEqual( aPlay.whosOn().runnerOutcome.firstBase , "CS" )
//
//    }

//    func testrunnerAdvances_Single() throws {
//        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
//        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
//
//        XCTAssertEqual( aPlay.whosOn().firstBase, batter )
//        XCTAssertEqual(aPlay.whosOn().firstBaseOutcomes, "H")
//    }
    

    
    
    func testAssociatedRunnerScoresARun() throws {
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
//        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
//        aPlay.runnerAdvances(action: .advances, base: Bases.thirdBase )
//        
//        XCTAssertEqual( aPlay.whosonbase().thirdBase, .advances)
//        XCTAssertEqual( aPlay.whosonbase()().home, .aRun)
    }
    
    func testRunnerAdvancesBase() throws {
        let batter1 = Player(name: "Runner", number: "00", position: .centerField)
        let batter2 = Player(name: "Batter", number: "00", position: .rightField)
        let aPlay = Play(description: "say something on the air", batter: batter1)
        aPlay.called(.single)
        let secondPlay = Play(description: "say something on the air", batter: batter2)
        secondPlay.called(.single)
        
        aPlay.runnerAdvances(action: .advances, base: Bases.firstBase )
        
        // XCTAssertEqual(aPlay.whosOn().player, batter1)
//        XCTAssertEquals(aPlay.whosOn().firstBase, "")
    }
}
