//
//  ScorecardTests.swift
//  Baseball-TDDTests
//
//  Created by David on 10/21/20.
//

import XCTest
import Foundation
@testable import Baseball


public class ScorecardTests: XCTestCase {
    
    func testWalkFirstBatter() {
        let card = Scorecard()
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(description: "Taylor gets walked.", batter: batter, atBat: .baseOnBalls)
        
        let verbage = card.score(aPlay)
        
        XCTAssertEqual("Taylor gets walked.", verbage )
        
    }
    
    func testThereIsAList() {
        let card = Scorecard()
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(description: "Taylor gets walked.", batter: batter, atBat: .baseOnBalls)
        
        _ = card.score(aPlay)
        let count = card.listOfPlays.count
        let desc = card.listOfPlays[0].description
        let outcome = card.listOfPlays[0].atBat()
        
        XCTAssertEqual(count, 1)
        XCTAssertEqual("Taylor gets walked.", desc )
        XCTAssertEqual(outcome, "BB" )
    }
}
