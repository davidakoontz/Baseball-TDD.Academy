//
//  PlayerRowViewTests.swift
//  Baseball-TDDTests
//
//  Created by David on 11/6/20.
//

import Foundation

import XCTest
@testable import Baseball_TDD

class PlayerRowViewTests: XCTestCase {
    func testRowShowsPlayer()
    {
        let taylor = Player(name: "Taylor Swift", number: "17", position: "8", atBat: "BB")
        let rowView = PlayerRowView(player: taylor) // This is SUT
        // extract the body, then asert that body contains things from Player. rowView.body.body.
        
        //XCTAssertEqual(taylor.name)

    }
}
