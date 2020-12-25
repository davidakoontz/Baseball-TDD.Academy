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
        let bob = Player(name: "Bob Swift", number: "3", position: .shortStop)
        let larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let play1 = Play(description: "that a great play", batter: bob, atBat: .walk)
        let play2 = Play(description: "that a great play", batter: larry, atBat: .strikeoutLooking )
        
        let first = Inning(number: "1",
                              top: [ play1 ],
                              bottom: [ play2 ],
                              summary: "0 to 0")

        XCTAssertTrue( first.number.contains("1") )
        XCTAssertTrue( first.top[0].batter.name.contains("Swift"))
        XCTAssertTrue( first.bottom[0].batter.name.contains("Ellison"))
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
        
//        let duke = Player(name: "Duke Java", number: "33", position: .leftField)
//        let james = Player(name: "James Gosling", number: "4", position: .thirdBase)
//        let scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
//        let billJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
//        let andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
//        let larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
//       // home team (bottom of innings)
//        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
//        let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
//        let jonathan = Player(name: "Jonathan Swift", number: "67", position: .secondBase)
//        let bob = Player(name: "Bob Swift", number: "2", position: .catcher)
//
   
       let firstInning = Inning(number: "1",
                             top: [],
                             bottom: [Game.play7],
                             summary: "0 to 0")
        
        XCTAssertTrue( firstInning.bottom[0].batter.name.contains("Jonathan") )
     
    }
    
    func testInningConsistOfPlays() throws {
        let aPlayer = Player(name: "Test PlayerName", number: "00", position: .catcher)
        let aPlay = Play(description: "this is a test", batter: aPlayer, atBat: AtBat.baseOnBalls)
        
        let firstInning = Inning(number: "1",
                                 top: [aPlay],
                                 bottom: [],
                                 summary: "0 to 0")
        
        XCTAssertEqual(firstInning.top[0].description, "this is a test")
    }
}
