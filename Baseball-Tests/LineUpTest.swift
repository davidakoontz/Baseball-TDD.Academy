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
        //atBatList: [Player] =  [ taylor, bill, jonathan, bob, duke, james, scott, billJoy, andy, larry ]
        lineup.assign(list: Player.atBatList)
        
        XCTAssertEqual(lineup.theLineup.count, 10)
    }
    
    
}
