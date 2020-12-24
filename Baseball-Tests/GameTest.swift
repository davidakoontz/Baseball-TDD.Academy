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
        return Inning(0: "", top: [], bottom: [], summary: "")
    }
    
    
    func testaNewGamehasZerosInnings() throws {
        let aGame = Game()

        XCTAssertEqual(aGame.inningCount(), 0 )
    }
    
    func testAddAnInning() throws {
        let aGame = Game()
        aGame.append(inning: getInning())
        
        XCTAssertEqual(aGame.inningCount(), 1)
    }

    func testAddingTwoInning() throws {
        let aGame = Game()
        aGame.append(inning: getInning())
        aGame.append(inning: getInning())
        
        XCTAssertEqual(aGame.inningCount(), 2 )
    }
    
}
