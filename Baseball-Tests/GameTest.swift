//
//  GameTest.swift
//  Baseball-Tests
//
//  Created by David on 12/23/20.
//

import XCTest
@testable import Baseball

class GameTest: XCTestCase {
    
    func test_inningCount_aNewGamehasZerosInnings() {
        let aGame = Game(innings: [])

        XCTAssertEqual(aGame.inningCount(), 0 )
    }
    
    func test_appendInning_AddFirstInning() {
        let game = Game()
        let first = Inning(label: "", game: game, top: [], bottom: [], summary: "")
       
        game.appendInning(inning: first)
        
        XCTAssertEqual(game.inningCount(), 1)
    }

    func test_appendInning_AddingTwoInnings() {
        let game = Game()
        let first = Inning(label: "", game: game, top: [], bottom: [], summary: "")
        
        game.appendInning(inning: first)
        game.appendInning(inning: EmptyInning(game: game))
        
        XCTAssertEqual(game.inningCount(), 2 )
    }
    
    func test_next_SequenceIterator() {
        let game = Game()
        let first = Inning(label: "1", game: game, top: [], bottom: [], summary: "")
        
        game.appendInning(inning: first)
        game.appendInning(inning: EmptyInning(game: game))
        game.appendInning(inning: EmptyInning(game: game))
        
        XCTAssertEqual(game.inningCount(), 3)
        let firstInning = game.next()!
        let secondInning = game.next()!
        let thridInning = game.next()!
        
        XCTAssertEqual( firstInning.label, "1")
        XCTAssertEqual( secondInning.label, "2")
        XCTAssertEqual( thridInning.label, "3")
        
    }
    
    func test_scoreAdd_forVisitorTeam() {
        let game = Game()
        let first = Inning(label: "1", game: game, top: [], bottom: [], summary: "")
        
        game.appendInning(inning: first)
        
        game.score.Add(runs: 1, teamAtBat: Team.visitor)
        
        XCTAssertEqual(game.score.visitor, 1)
    }

    func test_scoreAdd_forHomeTeam() {
        let game = Game()
        let first = Inning(label: "1", game: game, top: [], bottom: [], summary: "")
        
        game.appendInning(inning: first)
        
        game.score.Add(runs: 3, teamAtBat: Team.home)
        
        XCTAssertEqual(game.score.home, 3)
    }
    
    func test_nextBatter_FactoryMethodWrappsArround() {
        let game = Game()
        let first = Inning(label: "1", game: game, top: [], bottom: [], summary: "")
        let aGame = Game(innings: [first])
        
        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        aGame.visitorLineUp.add(Duke)
        aGame.visitorLineUp.add(James)
        aGame.visitorLineUp.add(Scott)
        aGame.visitorLineUp.add(BillJoy)
        aGame.visitorLineUp.add(Andy)
        aGame.visitorLineUp.add(Larry)
        aGame.visitorLineUp.add(Sun)
        aGame.visitorLineUp.add(Tzu)
        aGame.visitorLineUp.add(Nike)
        
        
        let play1 = aGame.nextBatter()
        
        XCTAssertEqual(play1.batter, Duke)
        
        let play2 = aGame.nextBatter()
        
        XCTAssertEqual(play2.batter.name, "James Gosling")
        
        let play3 = aGame.nextBatter()
        
        XCTAssertEqual(play3.batter, Scott)
        
        let play4 = aGame.nextBatter()
        
        XCTAssertEqual(play4.batter.name, "Bill Joy")
        
        let play5 = aGame.nextBatter()
        
        XCTAssertEqual(play5.batter, Andy)
        
        let play6 = aGame.nextBatter()
        
        XCTAssertEqual(play6.batter.name, "Larry Ellison")
        
        let play7 = aGame.nextBatter()
        
        XCTAssertEqual(play7.batter, Sun)
        
        let play8 = aGame.nextBatter()
        
        XCTAssertEqual(play8.batter.name, "Sun Tzu")
        
        let play9 = aGame.nextBatter()
        
        XCTAssertEqual(play9.batter.name, "Nike Sun")
        
        // a LineUp should have no problem wrapping around the front again & again.
        let play10 = aGame.nextBatter()

        XCTAssertEqual(play10.batter, Duke)
    }
    
    
    func test_switchFields_SwitchesTeamsAsHalfInning() {
        let game = Game()
        let first = Inning(label: "1", game: game, top: [], bottom: [], summary: "")
        let aGame = Game(innings: [first])
        
        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        aGame.visitorLineUp.add(Duke)
        aGame.visitorLineUp.add(James)
        aGame.visitorLineUp.add(Scott)
        aGame.visitorLineUp.add(BillJoy)
        aGame.visitorLineUp.add(Andy)
        aGame.visitorLineUp.add(Larry)
        aGame.visitorLineUp.add(Sun)
        aGame.visitorLineUp.add(Tzu)
        aGame.visitorLineUp.add(Nike)
        
        
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

        aGame.homeLineUp.add(Taylor)
        aGame.homeLineUp.add(Bill)
        aGame.homeLineUp.add(Jonathan)
        aGame.homeLineUp.add(Bob)
        aGame.homeLineUp.add(Kay)
        aGame.homeLineUp.add(Patrick)
        aGame.homeLineUp.add(Todd)
        aGame.homeLineUp.add(Connor)
        aGame.homeLineUp.add(Ellen)
        
        let play1 = aGame.nextBatter()
        
        XCTAssertEqual(play1.batter, Duke)
        
        let play2 = aGame.nextBatter()
        
        XCTAssertEqual(play2.batter.name, "James Gosling")
        
        let play3 = aGame.nextBatter()
        
        XCTAssertEqual(play3.batter, Scott)
        
        // Need a method to call to make model aware
        aGame.switchFields()
        
        // assume 3 outs for Visitors - switch teams at Bat
        
        let play4 = aGame.nextBatter()
        
        XCTAssertEqual(play4.batter.name, "Taylor Swift")
        
        let play5 = aGame.nextBatter()
        
        XCTAssertEqual(play5.batter, Bill)
        
        let play6 = aGame.nextBatter()
        
        XCTAssertEqual(play6.batter.name, "Jonathan Swift")
    }
    
    func test_setLineUp_withList() {
        let game = Game()
        
        game.setVisitorTeamLineUp()
        game.setLineUp(lineUp: game.getDefaultTeamLineUp(), team: Team.home)
        
        
        XCTAssertEqual(game.visitorLineUp.theLineup.count, 9)
        XCTAssertEqual(game.homeLineUp.theLineup.count, 9)
        
        XCTAssertEqual(game.nextBatter().batter.name, "Duke Java")
    }
    
    
}
