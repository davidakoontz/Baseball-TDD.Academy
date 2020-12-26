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




}
