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
    
   
    
    
    
   
    
    
    
    
}
