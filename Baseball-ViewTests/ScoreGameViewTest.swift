//
//  ScoreGameViewTest.swift
//  Baseball-ViewTests
//
//  Created by David on 1/21/21.
//

import XCTest
import ViewInspector  // 1. First requirement for ViewInspector
@testable import Baseball

extension ScoreGameView: Inspectable {}  // 2. Second requirement for ViewInspector

class ScoreGameViewTest: XCTestCase {

    // a View Inspector UnitTest of a SwiftUI View
    // cleanup required:
    //            check for proper @testable import TARGETNAME
    //            check for proper extension VIEW_FILE: Inspectable {}
    //            check for proper let VUT = VIEW_FILE()
    // substitute a good string to find and print the view hierarchy
    // 
    func testBeginingViewScoreGame() throws {  // 3. Third requirement for ViewInspector e.g. throws
        // arrange
        let game = Game()
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let play = Play(game: game, description: "that is a great play", batter: taylor)
        play.umpCalled(.single)
        
        let inning = Inning(label: "1", game: game, top: [play], bottom: [play])

        game.appendInning(inning: inning)

        // act
        let VUT = ScoreGameView(game: game) //.environmentObject(game)      // VUT = View Under Test
        
        let imageName = try VUT.inspect().navigationView().group(0).image(0).actualImage().name()
        
        XCTAssertEqual(imageName, "baseball-diamond-field")
        
        let nothing = try VUT.inspect().navigationView().group(0).text(1).string()
        
        XCTAssertEqual(nothing,  "nothing here yet...")
        
        let x = try VUT.inspect().navigationView().group(0).text(2).string()
        
        XCTAssertTrue(x.contains("toolbar") )

	// see: https://github.com/nalexn/ViewInspector/blob/master/guide.md the View Inspector Guide.
    }

}
