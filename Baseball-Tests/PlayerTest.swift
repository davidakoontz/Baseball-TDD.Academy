//
//  PlayerTest.swift
//  Baseball-TDDTests
//
//  Created by David on 11/6/20.
//

import XCTest
@testable import Baseball

class PlayerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAtBatListHasPlayerInfo() throws {
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)

        // this List becomes a player Roster... future
         let atBatList: [Player] =  [
            taylor, bill
            ]
        
        XCTAssertTrue( atBatList[0].name.contains("Taylor") )
        XCTAssertEqual( atBatList[0].number, "17")
        XCTAssertEqual( atBatList[0].position, .centerField)

        
        XCTAssertTrue( atBatList[1].name.contains("Bill") )
        XCTAssertEqual( atBatList[1].number, "18")
        XCTAssertEqual( atBatList[1].position, .pitcher)
    }

    // Test Player ==
    func testEqualOperator() throws {
        let playerA = Player(name: "Player A", number: "33", position: .rightField)
        let playerB = Player(name: "Player B", number: "45", position: .pitcher)
        let playerAprime = Player(name: "Player A", number: "33", position: .centerField)   // player may change position

        XCTAssertTrue( playerA == playerAprime )
        XCTAssertFalse( playerA == playerB )  // a negative test for ==
    }
    
    // see: https://medium.com/better-programming/what-is-hashable-in-swift-6a51627f904
    // this crap got to complex... give up for today.
//    func testPlayerHashMethod() throws {
//        let playerA = Player(name: "Player A", number: "33", position: "9", atBat: "1B")
//        let playerB = Player(name: "Player B", number: "45", position: "1", atBat: "K")
//        let playerAprime = Player(name: "Player A", number: "33", position: "4", atBat: "HR")
//
//        XCTAssertEqual( playerA.hash(), playerAprime.hash() )
//        XCTAssertNotEqual( playerA.hashValue, playerB.hashValue )  // a negative test for ==
//    }
}
