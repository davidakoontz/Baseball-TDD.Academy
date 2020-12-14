//
//  InningTest.swift
//  Baseball-Tests
//
//  Created by David on 12/10/20.
//

import XCTest
@testable import Baseball

class InningTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // visitors always bat first (top of innings)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testInit() throws {
        let bob = Player(name: "Bob Swift", number: "3", position: "6", atBat: "K")
        let larry = Player(name: "Larry Ellison", number: "2", position: "2", atBat: "K")
    
        let first = Inning(number: "1",
                              top: [ bob ],
                              bottom: [ larry],
                              summary: "0 to 0")

        XCTAssertTrue( first.number.contains("1") )
        XCTAssertTrue( first.top[0].name.contains("Swift"))
        XCTAssertTrue( first.bottom[0].name.contains("Ellison"))
        XCTAssertTrue( first.summary.contains("0 to 0") )

    }

    func testInningHasSummary() throws {
        let firstInning = Inning(number: "1",
                              top: [],
                              bottom: [],
                              summary: "0 to 0")
        XCTAssertTrue( firstInning.summary.contains("0 to 0"))
    }
    
    
    //        static let jonathan = Player(name: "Jonathan Swift", number: "67", position: "4", atBat: "1B")
    func testInningOneJonathanHitsSingle() throws {
        
        let duke = Player(name: "Duke Java", number: "33", position: "7", atBat: "1B")
        let james = Player(name: "James Gosling", number: "4", position: "5", atBat: "2B")
        let scott = Player(name: "Scott McNealy", number: "37", position: "8", atBat: "K..")
        let billJoy = Player(name: "Bill Joy", number: "39", position: "9", atBat: "F8")
        let andy = Player(name: "Andy Bechtolsheim", number: "41", position: "1", atBat: "BB")
        let larry = Player(name: "Larry Ellison", number: "2", position: "2", atBat: "K")
       // home team (bottom of innings)
        let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        let bill = Player(name: "Bill Swift", number: "18", position: "1", atBat: "K")
        let jonathan = Player(name: "Jonathan Swift", number: "67", position: "4", atBat: "1B")
        let bob = Player(name: "Bob Swift", number: "2", position: "2", atBat: "DP")
       
   
       let firstInning = Inning(number: "1",
                             top: [duke, james, scott, billJoy, andy, larry],
                             bottom: [taylor, bill, jonathan, bob],
                             summary: "0 to 0")
        
        XCTAssertTrue( firstInning.bottom[2].name.contains("Jonathan") )
        XCTAssertTrue( firstInning.bottom[2].atBat.contains("1B") )
    }
    
}
