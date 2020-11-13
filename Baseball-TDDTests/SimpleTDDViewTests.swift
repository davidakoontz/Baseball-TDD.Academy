//
//  SimpleTDDViewTests.swift
//  Baseball-TDDTests
//
//  Created by David on 11/12/20.
//

import Foundation
import XCTest
import ViewInspector // 1.

@testable import Baseball_TDD

extension SimpleTDDView: Inspectable {} // 2.


class SimpleTDDViewTests: XCTestCase {
   
    
    func testStringValue() throws { // 3.
        let view = SimpleTDDView()
        let text = try view.inspect().text()
        let value = try  text.string() // 4.
        XCTAssertEqual(value, "Hello, World!")
    }
}
