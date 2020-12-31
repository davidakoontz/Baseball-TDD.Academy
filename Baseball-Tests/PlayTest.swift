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

    func testBasicPlayInit() throws {

        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
        
        XCTAssertEqual(aPlay.description, "say something on the air")
        XCTAssertEqual(aPlay.atBat(), "1B")
        XCTAssertTrue(aPlay.batter.name.contains("PlayerName"))
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

    
    func testAssociateRunnerOnFirstAction() throws {
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
        aPlay.runnerAdvances(action: "CS", base: Bases.firstBase )
        
        XCTAssertEqual( aPlay.whosonbase().firstBase, "CS" )

    }

    func testAssociateRunnerOnSecondAction() throws {
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
        aPlay.runnerAdvances(action: "AB4", base: Bases.secondBase )
        
        XCTAssertEqual( aPlay.whosonbase().secondBase, "AB4" )

    }
    
    func testAssociateRunnerOnThirdAction() throws {
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )

        // when no runner on third
        XCTAssertEqual( aPlay.whosonbase().thirdBase, "" )

    }
}
