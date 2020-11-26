//
//  Baseball_Tests.swift
//  Baseball-Tests
//
//  Created by David on 10/4/20.
//

import XCTest
@testable import Baseball

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
    
//    func testWalkTheBatter() throws {
//        let situation = Situation()
//        let generator = PlayGenerator()
//        let play = generator.startPlay(situation)
//        let walk = FieldSimulator
//        let SC = Scorecard.score( play )
//    }
    
    /*
     * Vision: To actively enjoy the game and be connected and engaged, the Baseball Scorecard is a realtimeish score card, that allwos you to product stats or consume states that you can watch on your device.
     *
     * User Stories:
     * Bootstrap: Late to the game scernario: catch scorecard up to the current game.
     * Produce: Once you publish, your are signal to  a server that you'll be sending more updates and people can then subscribe. (Producer consumer relationship)
     * Consume: Subscribe to a game, being passive by enjoying the game and watching the stats.
     * Interact with data and producer:
     */
    
    
    
    //====== Performance Test =============
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
