//
//  RingBufferTest.swift
//  Baseball-Tests
//
//  Created by David on 1/10/21.
//

import XCTest
@testable import Baseball

class LineUpTest: XCTestCase {
    var lineup = LineUp()
    let bob = Player(name: "Bob", number: "1", position: Position.catcher)
    let lance = Player(name: "Lance", number: "2", position: Position.leftField)

    
    override func setUp() {
        lineup = LineUp()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_add() {
        lineup.add(bob)

        XCTAssertEqual(lineup.nextBatterInLineUp(), bob)
    }

    func test_add_twoPeople() {
        lineup.add(bob)
        lineup.add(lance)
        
        XCTAssertEqual(lineup.nextBatterInLineUp().name, bob.name)
        XCTAssertEqual(lineup.nextBatterInLineUp().name, lance.name)
    }

    func test_read_LineUpWrappsArround() {
        lineup.add(bob)
        lineup.add(lance)
        
        XCTAssertEqual(lineup.nextBatterInLineUp().name, bob.name)
        XCTAssertEqual(lineup.nextBatterInLineUp().name, lance.name)
        XCTAssertEqual(lineup.nextBatterInLineUp().name, bob.name)
    }
}
