//
//  ScorecardTests.swift
//  Baseball-TDDTests
//
//  Created by David on 10/21/20.
//

import XCTest
@testable import Baseball_TDD
import Foundation

public class ScorecardTests : XCTestCase {
    
    func testWalkFirstBatter() {
        let card = Scorecard()
        //let atBatString = "{'17', 'Henry, D', '9', 'BB'}"
        //card.read(atBatString)
        //let outcome =  card.toString()  // This ain't no stinking JAVA!
        
        // the proper Swifty way
        // when card implements CustomStringConvertible protocol - e.g. has a public var description: String
        
        let outcome = String(describing: card)
        
        XCTAssertEqual(outcome, "{17, Henry, D, 9, BB}")    // we are aware this is invalid JSON
        
    }
    
}
