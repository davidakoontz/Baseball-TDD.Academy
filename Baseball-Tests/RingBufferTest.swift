//
//  RingBufferTest.swift
//  Baseball-Tests
//
//  Created by David on 1/10/21.
//

import XCTest
@testable import Baseball

class RingBufferTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
//    func test_read_FullBufferShouldWrapAround() {
//        var buffer = RingBuffer<Int>(count: 5)
//
//        _ = buffer.write(1)
//        _ = buffer.write(2)
//        _ = buffer.write(3)
//        _ = buffer.write(4)
//        _ = buffer.write(5)     // full buffer
//
//
//        XCTAssertEqual(buffer.read()!, 1)
//        XCTAssertEqual(buffer.read()!, 2)
//        XCTAssertEqual(buffer.read()!, 3)
//        XCTAssertEqual(buffer.read()!, 4)
//        XCTAssertEqual(buffer.read()!, 5)
//        XCTAssertEqual(buffer.read()!, 1)
//        XCTAssertEqual(buffer.read()!, 2)
//
//    }

}
