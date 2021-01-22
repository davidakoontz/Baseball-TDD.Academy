//
//  ConfigMenuViewTest.swift
//  Baseball-ViewTests
//
//  Created by David on 1/21/21.
//

import XCTest
import ViewInspector  // 1. First requirement for ViewInspector
@testable import Baseball

extension ConfigView: Inspectable {}  // 2. Second requirement for ViewInspector

class ConfigViewTest: XCTestCase {

    // a View Inspector UnitTest of a SwiftUI View
    // cleanup required:
    //            check for proper @testable import TARGETNAME
    //            check for proper extension VIEW_FILE: Inspectable {}
    //            check for proper let VUT = VIEW_FILE()
    // substitute a good string to find and print the view hierarchy
    // 
    func testExample() throws {  // 3. Third requirement for ViewInspector e.g. throws
        let game = Game()
        
        let VUT = ConfigView(game: game) 	// VUT = View Under Test
        
        let text1 = try VUT.inspect().navigationView().group(0).list(0).hStack(0).label(0).title().text().string()
        XCTAssertEqual(text1, "Game Mode")
        
        let text2 = try VUT.inspect().navigationView().group(0).list(0).hStack(1).label(0).title().text().string()
        XCTAssertEqual(text2, "Filders")
        
        let text3 = try VUT.inspect().navigationView().group(0).list(0).hStack(2).label(0).title().text().string()
        XCTAssertEqual(text3, "Innings")
        
        let gameMode1 = try VUT.inspect().navigationView().group(0).list(0).hStack(0).button(1).labelView().text(0).string()
        XCTAssertEqual(gameMode1, "Baseball")
        let gameMode2 = try VUT.inspect().navigationView().group(0).list(0).hStack(0).button(1).labelView().text(1).string()
        XCTAssertEqual(gameMode2, "Softball")
        
        let fildersOption1 = try VUT.inspect().navigationView().group(0).list(0).hStack(1).button(1).labelView().text(0).string()
        XCTAssertEqual(fildersOption1, "9")
        let fildersOption2 = try VUT.inspect().navigationView().group(0).list(0).hStack(1).button(1).labelView().text(1).string()
        XCTAssertEqual(fildersOption2, "10")
        
        let inningsOption1 = try VUT.inspect().navigationView().group(0).list(0).hStack(2).button(1).labelView().text(0).string()
        XCTAssertEqual(inningsOption1, "6")
        let inningsOption2 = try VUT.inspect().navigationView().group(0).list(0).hStack(2).button(1).labelView().text(1).string()
        XCTAssertEqual(inningsOption2, "9")
        
//        let textView = try VUT.inspect().find(text: "10")		// 4. Fourth requirement for ViewInspector e.g. VUT.inspect()
//        print("ViewInspector found Some_Unique_Test in view path: \(textView.pathToRoot)" )

	// see: https://github.com/nalexn/ViewInspector/blob/master/guide.md the View Inspector Guide.
    }

}
