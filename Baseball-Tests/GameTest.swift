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

    private func createInning() -> Inning {
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
        aGame.append(inning: createInning())
        
        XCTAssertEqual(aGame.inningCount(), 2)
    }

    func testAddingTwoInning() throws {
        let first = Inning(number: "", top: [], bottom: [], summary: "")
        let aGame = Game(innings: [first])
        aGame.append(inning: createInning())
        aGame.append(inning: createInning())
        
        XCTAssertEqual(aGame.inningCount(), 3 )
    }
    
    func testSequenceIterator() throws {
        let first = Inning(number: "1", top: [], bottom: [], summary: "")
        let aGame = Game(innings: [first])
        aGame.append(inning: createInning())
        aGame.append(inning: createInning())
        
        XCTAssertEqual(aGame.inningCount(), 3)
        let firstInning = aGame.next()!
        let secondInning = aGame.next()!
        let thridInning = aGame.next()!
        
        XCTAssertEqual( firstInning.number, "1")
        XCTAssertEqual( secondInning.number, "2")
        XCTAssertEqual( thridInning.number, "3")
        
    }
    
    func test_nextBatter_FactoryMethod() throws {
        let first = Inning(number: "1", top: [], bottom: [], summary: "")
        let aGame = Game(innings: [first])
        
        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        _ = aGame.visitorLineUp.write(Duke)
        _ = aGame.visitorLineUp.write(James)
        _ = aGame.visitorLineUp.write(Scott)
        _ = aGame.visitorLineUp.write(BillJoy)
        _ = aGame.visitorLineUp.write(Andy)
        _ = aGame.visitorLineUp.write(Larry)
        _ = aGame.visitorLineUp.write(Sun)
        _ = aGame.visitorLineUp.write(Tzu)
        _ = aGame.visitorLineUp.write(Nike)
        
        
        let play1 = aGame.nextBatter()
        
        XCTAssertEqual(play1.batter, Duke)
        
        let play2 = aGame.nextBatter()
        
        XCTAssertEqual(play2.batter.name, "James Gosling")
    }
}
