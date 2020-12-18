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
        let aPlay = Play("Taylor gets walked.")
        
        let verbage = card.score(aPlay)
        
        XCTAssertEqual(verbage, "Taylor gets walked.")
        
    }
    
    func testThereIsAList() {
        let card = Scorecard()
        let aPlay = Play("Taylor gets walked.")
        
        _ = card.score(aPlay)
        let count = card.listOfPlays.count
        let desc = card.listOfPlays[0].description
        
        XCTAssertEqual(count, 1)
        XCTAssertEqual(desc, "Taylor gets walked.")
    }
}
