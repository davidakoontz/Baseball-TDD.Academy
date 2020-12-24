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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       // let aPlay = Play(description: "say something on the air", atBat: "1B")
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
        
        XCTAssertEqual(aPlay.description, "say something on the air")
        XCTAssertEqual( aPlay.atBat(), "1B" )
        XCTAssertTrue(aPlay.batter.name.contains("PlayerName"))
    }




}
