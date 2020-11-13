//
//  PlayerRowViewTests.swift
//  Baseball-TDDTests
//
//  Created by David on 11/6/20.
//

import Foundation
import XCTest
import ViewInspector // 1. step ONE of ViewInspector

@testable import Baseball_TDD


extension PlayerRowView: Inspectable {} // 2. step TWO Extend the View to be Inspectable

class PlayerRowViewTests: XCTestCase {
    
    func test_Taylor_at_bat_gets_walked() throws { // 3. step THREE annotate test with thorws
        // TDD - Arrange step  (or BDD - GIVEN)
        let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        
        // TDD - Act step  (or BDD - WHEN)
        let view = PlayerRowView(player: taylor)
        
        let hStack = try view.inspect().hStack()
        let name = try hStack.text(2).string() // 4. step FOUR inspect the view (see Guide.md for methods)
        let atBat = try hStack.text(6).string()  // 4.
        
        // TDD - Assert step  (or BDD - THEN)
        XCTAssertEqual(name, "Taylor Swift")
        XCTAssertEqual(atBat, "BB")
    }
}
