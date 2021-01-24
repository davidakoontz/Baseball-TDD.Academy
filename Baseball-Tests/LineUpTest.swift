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

    func test_nextBatterInLineUp_LineUpWrappsArround() {
        lineup.add(bob)
        lineup.add(lance)
        
        XCTAssertEqual(lineup.nextBatterInLineUp().name, bob.name)
        XCTAssertEqual(lineup.nextBatterInLineUp().name, lance.name)
        XCTAssertEqual(lineup.nextBatterInLineUp().name, bob.name)
    }
    
    func test_nextBatterInLineUp_LineUpIsEmpty() {
        
        XCTAssertEqual(lineup.nextBatterInLineUp().name, "Empty Player")
    }
    
    func test_assign_aListOfPlayers() {
        lineup.assign(list: Player.visitorsAtBatList)
        
        XCTAssertEqual(lineup.theLineup.count, 9)
    }
    
    
}
