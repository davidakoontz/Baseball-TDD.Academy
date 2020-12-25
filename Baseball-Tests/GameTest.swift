//
//  GameTest.swift
//  Baseball-Tests
//
//  Created by David on 12/23/20.
//

import XCTest
@testable import Baseball

class GameTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    private func getInning() -> Inning {
        return Inning(number: "", top: [], bottom: [], summary: "")
    }
    
    
    func testaNewGamehasZerosInnings() throws {
        //let first = Inning(number: "", top: [], bottom: [], summary: "")
        let aGame = Game(innings: [])

        XCTAssertEqual(aGame.inningCount(), 0 )
    }
    
    func testAddAnInning() throws {
        let first = Inning(number: "", top: [], bottom: [], summary: "")
        let aGame = Game(innings: [first])
        aGame.append(inning: getInning())
        
        XCTAssertEqual(aGame.inningCount(), 2)
    }

    func testAddingTwoInning() throws {
        let first = Inning(number: "", top: [], bottom: [], summary: "")
        let aGame = Game(innings: [first])
        aGame.append(inning: getInning())
        aGame.append(inning: getInning())
        
        XCTAssertEqual(aGame.inningCount(), 3 )
    }
    
}
