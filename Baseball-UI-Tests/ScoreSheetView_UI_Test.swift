//
//  ScoreSheetView_UI_Test.swift
//  Baseball
//
//  Created by David on 11/12/20.
//

import XCTest

// swiftlint:disable type_name
class ScoreSheetView_UI_Test: XCTestCase {

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
    

    func test_Config_View() throws {
        let app = XCUIApplication()     // should have a static Game()

        app.buttons["slider.horizontal.3"].tap()
        
        let elem = app.otherElements["config_button_tabbar"]
        //elem.tap()      // does NOT WORK - should go to this tab
        XCTAssertEqual("config_button_tabbar", elem.identifier)
        
    }

    func test_AddGame_View() throws {
        let app = XCUIApplication()     // should have a static Game()

        app.buttons["rectangle.stack.badge.plus"].tap()
        
        let elem = app.otherElements["addGame_button_tabbar"]
        //elem.tap()      // does NOT WORK - should go to this tab
        XCTAssertEqual("addGame_button_tabbar", elem.identifier)
        
    }

    
    func test_ScoreSheet_View() throws {
        let app = XCUIApplication()     // should have a static Game()

        app.buttons["scroll"].tap()
        
        let elem = app.otherElements["scoresheet_button_tabbar"]
        //elem.tap()      // does NOT WORK - should go to this tab
        XCTAssertEqual("scoresheet_button_tabbar", elem.identifier)
        
    }

    
    func test_Taylor_at_Bat_gets_walked() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()     // should have a static Game()

        app.buttons["scroll"].tap()     // ScoreSheet has label "scroll" which is the SF Symbol name
        
//        let elem = app.otherElements["scoresheet_button_tabbar"]
//        XCTAssertEqual("scoresheet_button_tabbar", elem.identifier)
        
        //XCTAssertTrue( app.staticTexts["#17"].exists )
        XCTAssertTrue( app.grids.cells.staticTexts["Taylor Swift"].exists)
        XCTAssertTrue( app.textViews["Taylor Swift"].exists )
        XCTAssertTrue( app.staticTexts["8"].exists )
        XCTAssertTrue( app.staticTexts["W"].exists )
        
        
        
    }

}
