//
//  Baseball_TDDUITests.swift
//  Baseball-TDDUITests
//
//  Created by David on 10/4/20.
//

import SwiftUI
import XCTest

// swiftlint:disable type_name
class Baseball_UI_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test.
        // Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation -
        // required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testMeun_threeStrikeYourOut() throws {
//        
//        let app = XCUIApplication()
//        app.tabBars["Tab Bar"].buttons["ScoreSheet"].tap()
//        let tabBar = app.tabBars["Tab Bar"]
//        let addGameButton = tabBar.buttons["Add Game"]
//        addGameButton.tap()
//        
//        app.toolbars["Toolbar"].buttons["Strike"].tap()
//        app.toolbars["Toolbar"].buttons["Strike"].tap()
//        app.toolbars["Toolbar"].buttons["Strike"].tap()
//
//        // Find the label
//        let omg = app.otherElements["Outs:"]
//        
//        // Check the string displayed on the label is correct
//        XCTAssertEqual("Outs: 1", omg.label )
//    
//    }

//    func test_record() throws {
//
//        let app = XCUIApplication()
//        let tabBar = app.tabBars["Tab Bar"]
//        tabBar.buttons["ScoreSheet"].tap()
//
//        let addGameButton = tabBar.buttons["Add Game"]
//        addGameButton.tap()
//        tabBar.buttons["Config"].tap()
//        addGameButton.tap()
//
//        let strikeButton = app.toolbars["Toolbar"].buttons["Strike"]
//        strikeButton.tap()
//        strikeButton.tap()
//        strikeButton.tap()
//
//
//        // Find the label
//        let omg = app.staticTexts["out_indicator"]
//
//        // Check the string displayed on the label is correct
//        XCTAssertEqual("You're Out!", omg.label)
//
//
//    }

    
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
