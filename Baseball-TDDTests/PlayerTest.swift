//
//  PlayerTest.swift
//  Baseball-TDDTests
//
//  Created by David on 11/6/20.
//

import XCTest
@testable import Baseball_TDD

class PlayerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExamplePlayerHasName() throws {
        XCTAssertTrue( Player.example.name.contains("Swift") )
        XCTAssertTrue( Player.example.atBat.contains("BB"))     // a base on balls - a walk
    }

}
