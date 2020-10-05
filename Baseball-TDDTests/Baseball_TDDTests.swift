//
//  Baseball_TDDTests.swift
//  Baseball-TDDTests
//
//  Created by David on 10/4/20.
//

import XCTest
@testable import Baseball_TDD

class Baseball_TDDTests: XCTestCase {

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
        let play1 = Play()
        
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
        let HR = FieldSimulator.isHitAHomeRun( play )
        
        XCTAssertFalse( HR )
    }
    
    func testBasicScorecard() throws {
        let situation = Situation()
        let generator = PlayGenerator()
        let play = generator.startPlay(situation)
        let HR = FieldSimulator.isHitAHomeRun( play )
        let SC = Scorecard.score( play )
        
        XCTAssertTrue( SC.contains("Scorecard") )
    }
    
    //====== Performance Test =============
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
