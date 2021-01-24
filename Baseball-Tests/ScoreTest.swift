//
//  ScoreTest.swift
//  Baseball-Tests
//
//  Created by David on 1/23/21.
//

import XCTest
@testable import Baseball

class ScoreTest: XCTestCase {
    
    func test_add_oneRunForVisitors() {
        var score = Score()
        
        score.add(1, teamAtBat: .visitor)
        
        XCTAssertEqual(score.visitor, 1)
    }
    
    func test_add_oneRunForHome() {
        var score = Score()
        
        score.add(1, teamAtBat: .home)
        
        XCTAssertEqual(score.home, 1)
    }
    
    func test_add_oneRunThenThreeRunsForHome() {
        var score = Score()
        
        score.add(1, teamAtBat: .home)
        score.add(3, teamAtBat: .home)
        
        XCTAssertEqual(score.home, 4)
    }
    
    func test_summary_whenVisitor3AndHome4() {
        var score = Score()
        
        score.add(2, teamAtBat: .visitor)
        score.add(1, teamAtBat: .home)
        
        score.add(1, teamAtBat: .visitor)
        score.add(3, teamAtBat: .home)
        
        XCTAssertEqual(score.summary, "3 to 4")
    }
}
