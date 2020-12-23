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
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let play1 = Play(description: "This baseball is a great game", batter: batter, atBat: .baseOnBalls)
        
        XCTAssertTrue(play1.description.contains("baseball"))
        XCTAssertEqual( play1.atBat(), "BB" )
        XCTAssertEqual( play1.batter.name, "Random PlayerName")
    }
    
    func testBasicSituationAtStart() throws {
        let sit1 = Situation()
        
        XCTAssertTrue( sit1.outs == 0 )
    }
    
    func testBasicPlayGenerator() throws {
        let situation = Situation()
        let generator = PlayGenerator()
        // set play's sequence number to 100
        sequenceNumber = 100
        let play = generator.startPlay(situation)
        
        XCTAssertEqual( play.number, 101 )
    }
    
    func testPlayGeneratorRandomPlay() throws {
        let generator = PlayGenerator()
        
        let aPlay = generator.getRandomPlay()
        
        XCTAssertEqual( aPlay.description, "random play")  // description of random 
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
