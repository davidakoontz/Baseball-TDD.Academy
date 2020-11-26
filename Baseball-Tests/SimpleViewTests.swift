//
//  SimpleViewTests.swift
//  Baseball-TDDTests
//
//  Created by David on 11/12/20.
//

import Foundation
import XCTest
import ViewInspector // 1.

@testable import Baseball

extension SimpleView: Inspectable {} // 2.

// let's use the simplest thing that might work to validate ViewInspector works.
// David forgot to do step #2 the first attmpt... bet this works much better...
class SimpleViewTests: XCTestCase {
   
    
    func testStringValue() throws { // 3.
        let view = SimpleView()
        let text = try view.inspect().text()
        let value = try  text.string() // 4.
        XCTAssertEqual(value, "Hello, World!")
    }
}
