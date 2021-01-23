//
//  GameTest.swift
//  Baseball-Tests
//
//  Created by David on 12/23/20.
//

import XCTest
@testable import Baseball

class GameTest: XCTestCase {
    
    func test_init() {
        let game = Game()
        
        XCTAssertEqual(game.innings.count, 9)
        XCTAssertEqual(game.inningIndex, 0)
    }
    
    
    func test_appendInning_AddExtraInning() {
        let game = Game()   // upon creation game has 9 innings
        let extra = Inning(label: "", game: game, top: [], bottom: [])
       
        game.appendInning(inning: extra)
        
        XCTAssertEqual(game.inningCount(), 10)
    }

    
    func test_next_SequenceIterator() {
        let game = Game()   // created with 9 innings
        let firstInning = game.currentInning()
        
        XCTAssertEqual(game.currentInning().label, "1")
        XCTAssertEqual(game.inningCount(), 9)

        let secondInning = game.next()!
        let thridInning = game.next()!
        
        XCTAssertEqual( firstInning.label, "1")
        XCTAssertEqual( secondInning.label, "2")
        XCTAssertEqual( thridInning.label, "3")
        
        for i in 0..<9 {
            print("Game: i\(i) Inning #\(game.innings[i].label)")
        }
        
    }
    
    func test_scoreAdd_forVisitorTeam() {
        let game = Game()
        let first = Inning(label: "1", game: game, top: [], bottom: [])
        
        game.appendInning(inning: first)
        
        game.score.Add(runs: 1, teamAtBat: Team.visitor)
        
        XCTAssertEqual(game.score.visitor, 1)
    }

    func test_scoreAdd_forHomeTeam() {
        let game = Game()
        let first = Inning(label: "1", game: game, top: [], bottom: [])
        
        game.appendInning(inning: first)
        
        game.score.Add(runs: 3, teamAtBat: Team.home)
        
        XCTAssertEqual(game.score.home, 3)
    }
    
    func test_nextBatter_FactoryMethodWrappsArround() {
        let game = Game()
        let first = game.currentInning()

        
        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        game.visitorLineUp.add(Duke)
        game.visitorLineUp.add(James)
        game.visitorLineUp.add(Scott)
        game.visitorLineUp.add(BillJoy)
        game.visitorLineUp.add(Andy)
        game.visitorLineUp.add(Larry)
        game.visitorLineUp.add(Sun)
        game.visitorLineUp.add(Tzu)
        game.visitorLineUp.add(Nike)
        
        
        let play1 = game.batterUp()
        
        XCTAssertEqual(play1.batter, Duke)
        
        let play2 = game.batterUp()
        
        XCTAssertEqual(play2.batter.name, "James Gosling")
        
        let play3 = game.batterUp()
        
        XCTAssertEqual(play3.batter, Scott)
        
        let play4 = game.batterUp()
        
        XCTAssertEqual(play4.batter.name, "Bill Joy")
        
        let play5 = game.batterUp()
        
        XCTAssertEqual(play5.batter, Andy)
        
        let play6 = game.batterUp()
        
        XCTAssertEqual(play6.batter.name, "Larry Ellison")
        
        let play7 = game.batterUp()
        
        XCTAssertEqual(play7.batter, Sun)
        
        let play8 = game.batterUp()
        
        XCTAssertEqual(play8.batter.name, "Sun Tzu")
        
        let play9 = game.batterUp()
        
        XCTAssertEqual(play9.batter.name, "Nike Sun")
        
        // a LineUp should have no problem wrapping around the front gain & gain.
        let play10 = game.batterUp()

        XCTAssertEqual(play10.batter, Duke)
    }
    
    
    func test_switchFields_SwitchesTeamsAsHalfInningAndEnd() {
        let game = Game()       // created with 9 innings
        let first = game.currentInning()
        
        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        game.visitorLineUp.add(Duke)
        game.visitorLineUp.add(James)
        game.visitorLineUp.add(Scott)
        game.visitorLineUp.add(BillJoy)
        game.visitorLineUp.add(Andy)
        game.visitorLineUp.add(Larry)
        game.visitorLineUp.add(Sun)
        game.visitorLineUp.add(Tzu)
        game.visitorLineUp.add(Nike)
        
        
        // home team (bottom of innings)
        let Taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let Bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
        let Jonathan = Player(name: "Jonathan Swift", number: "67", position: .secondBase)
        let Bob = Player(name: "Bob Swift", number: "8", position: .catcher)
        let Kay = Player(name: "Kay Swift", number: "87", position: .firstBase)
        let Patrick = Player(name: "Patrick Swift", number: "55", position: .secondBase)
        let Todd = Player(name: "Todd Swift", number: "73", position: .thirdBase)
        let Connor = Player(name: "Connor Swift", number: "6", position: .rightField)
        let Ellen = Player(name: "Ellen Swift", number: "88", position: .shortStop)

        game.homeLineUp.add(Taylor)
        game.homeLineUp.add(Bill)
        game.homeLineUp.add(Jonathan)
        game.homeLineUp.add(Bob)
        game.homeLineUp.add(Kay)
        game.homeLineUp.add(Patrick)
        game.homeLineUp.add(Todd)
        game.homeLineUp.add(Connor)
        game.homeLineUp.add(Ellen)
        
        let play1 = game.batterUp()
        
        XCTAssertEqual(play1.batter, Duke)
        
        let play2 = game.batterUp()
        
        XCTAssertEqual(play2.batter.name, "James Gosling")
        
        let play3 = game.batterUp()
        
        XCTAssertEqual(play3.batter, Scott)
        
        // Need a method to call to make model aware
        game.switchFields()
        
        // assume 3 outs for Visitors - switch teams at Bat
        
        let play4 = game.batterUp()
        
        XCTAssertEqual(play4.batter.name, "Taylor Swift")
        
        let play5 = game.batterUp()
        
        XCTAssertEqual(play5.batter, Bill)
        
        let play6 = game.batterUp()
        
        XCTAssertEqual(play6.batter.name, "Jonathan Swift")
        
        // end of inning
        let inning = game.next()       // get next inning
        XCTAssertEqual(game.teamAtBat, Team.visitor)
      //  XCTAssertEqual(game.currentInning().label, "2")
       
    }
    
    func test_setLineUp_withList() {
        let game = Game()
        
        game.setVisitorTeamLineUp()
        game.setLineUp(lineUp: game.getDefaultTeamLineUp(), team: Team.home)
        
        
        XCTAssertEqual(game.visitorLineUp.theLineup.count, 9)
        XCTAssertEqual(game.homeLineUp.theLineup.count, 9)
        
        XCTAssertEqual(game.batterUp().batter.name, "Duke Java")
    }
    
    
}
