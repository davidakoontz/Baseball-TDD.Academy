//
//  Baseball_Tests.swift
//  Baseball-Tests
//
//  Created by David on 10/4/20.
//

import XCTest
@testable import Baseball

// swiftlint:disable type_name
class Baseball_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testHelloWorld() throws {
        XCTAssertTrue("Hello World".contains("World"))
    }
    
    func testVeryBasicPlay() throws {
        // setup a basic play
        let play1 = Play("This baseball is a great game")
        
        XCTAssertTrue(play1.description.contains("baseball"))
    }
    
    func testBasicSituationAtStart() throws {
        let sit1 = Situation()
        
        XCTAssertTrue( sit1.outs == 0 )
    }
    
    func testBasicPlayGenerator() throws {
        let situation = Situation()
        let generator = PlayGenerator()
        let play = generator.startPlay(situation)
        
        XCTAssertTrue( play.number == 1 )
    }
    
    func testBasicFieldSimulator() throws {
        let situation = Situation()
        let generator = PlayGenerator()
        let play = generator.startPlay(situation)
        let HRun = FieldSimulator.isHitAHomeRun( play )
        
        XCTAssertFalse( HRun )
    }
    
    func testBasicScorecard() throws {
        let situation = Situation()
        let generator = PlayGenerator()
        let play = generator.startPlay(situation)
        _ = FieldSimulator.isHitAHomeRun( play )

        let card = Scorecard()
        let desc = card.score( play )
        
        XCTAssertEqual(desc, "Hey batter swing")        // a hardcoded Play description from the Generator
    }
    
}
