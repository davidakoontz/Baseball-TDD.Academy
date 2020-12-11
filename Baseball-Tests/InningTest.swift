//
//  InningTest.swift
//  Baseball-Tests
//
//  Created by David on 12/10/20.
//

import XCTest
@testable import Baseball

class InningTest: XCTestCase {

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

    func testInningHasNumber() throws {
        XCTAssertTrue( Inning.exampleGame[1].number.contains("1") )
        
        XCTAssertTrue( Inning.exampleGame[9].number.contains("9") )
    }

    func testInningHasSummary() throws {
        XCTAssertTrue( Inning.exampleGame[0].summary.contains("0 to 0"))
    }
    
    func testInningOneHasScore_0_to_0() throws {
        XCTAssertTrue( Inning.exampleGame[1].summary.contains("0 to 0"))
    }
    
    //        static let jonathan = Player(name: "Jonathan Swift", number: "67", position: "4", atBat: "1B")
    func testInningOneJonathanHitsSingle() throws {
        XCTAssertTrue( Inning.exampleGame[1].top[2].name.contains("Jonathan") )
        XCTAssertTrue( Inning.exampleGame[1].top[2].atBat.contains("1B") )
    }
}
