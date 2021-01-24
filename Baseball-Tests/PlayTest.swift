//
//  PlayTest.swift
//  Baseball-Tests
//
//  Created by David on 12/17/20.
//

import XCTest
@testable import Baseball

class PlayTest: XCTestCase {

    func testInit_BasicPlay() {
        let game = Game()
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(game: game, description: "say something on the air", batter: batter )
        
        XCTAssertEqual(aPlay.description, "say something on the air")
        XCTAssertEqual(aPlay.atBat.rawValue, "AT")        // player is still AT bat
        XCTAssertTrue(aPlay.batter == batter)
    }
    
    func testInit_BaseEmptyAtInit() {
        let game = Game()
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(game: game, description: "say something on the air", batter: batter)

        // when no runner on any bases
        XCTAssertEqual( aPlay.atBat, AtBat.inBox)
        XCTAssertEqual( game.whosOn().firstBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.firstBaseLine, .blank )
        XCTAssertEqual( game.whosOn().secondBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.secondBaseLine, .blank )
        XCTAssertEqual( game.whosOn().thirdBase, EmptyPlayer())
        XCTAssertEqual( aPlay.runnerOutcomes.thirdBaseLine, .blank)
    }
/*
    * Story: Runner Advancement <priority 1-A>
    As a parent viewing a game
    I can associate the runner actions with the batter (e.g.  AB4)
    So that I can track the in play action 
        Could be done on data entry screen in text - example: “AB4”
        Could be done on a simulated interactive baseball diamond - drag player icon.
        perhaps Play needs a property for each base 1 - 3; where a runner can occupy
*/

    


    func test_umpCalled_Single() {
        let game = Game()
        let batter = Player(name: "Random PlayerName", number: "00", position: .centerField)
        let aPlay = Play(game: game, description: "say something on the air", batter: batter )
        
        aPlay.umpCalled(.single)

        XCTAssertEqual( game.whosOn().firstBase, batter )
        XCTAssertEqual( aPlay.runnerOutcomes.firstBaseLine.rawValue, "1B")
    }
    
    
    func test_runnerOn_firstBaseSingleBySecondBatter() {
        let game = Game()
        game.setVisitorTeamLineUp()          // game needs a lineUp to populate the next batter
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)
        
        XCTAssertEqual(game.whosOn().secondBase.name, "Empty Player")
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(firstPlay.runnerOutcomes.secondBaseLine.rawValue, "_")

        let secondPlay = game.batterUp()
        game.runnerOn(.firstBase, action: .advances)
        secondPlay.umpCalled(.single)

        XCTAssertEqual(game.whosOn().secondBase.name, "Duke Java")
        XCTAssertEqual(game.whosOn().firstBase.name, "James Gosling")
        XCTAssertEqual(secondPlay.runnerOutcomes.secondBaseLine.rawValue, "AB")
        
        XCTAssertEqual(game.currentPlay().runnerOutcomes.secondBaseLine.rawValue, "AB")
    }
    
    func test_runnerOn_BasesLoadedSituation() {
        let game = Game()
        game.setVisitorTeamLineUp()          // game needs a lineUp to populate the next batter
        //        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        //        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        //        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        //        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        //        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        //        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        //        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        //        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        //        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)

        let secondPlay = game.batterUp()
        game.runnerOn(.firstBase, action: .advances )
        secondPlay.umpCalled(.single)

        let thirdPlay = game.batterUp()
        game.runnerOn(.secondBase, action: .advances )
        game.runnerOn(.firstBase, action: .advances )
        thirdPlay.umpCalled(.single)
        
        let fourthPlay = game.batterUp()
        game.runnerOn(.thirdBase, action: .advances )
        game.runnerOn(.secondBase, action: .advances )
        game.runnerOn(.firstBase, action: .advances )
        fourthPlay.umpCalled(.single)
        
        XCTAssertEqual(game.whosOn().homePlate.name, "Duke Java")
        XCTAssertEqual(game.whosOn().thirdBase.name, "James Gosling")
        XCTAssertEqual(game.whosOn().secondBase.name, "Scott McNealy")
        XCTAssertEqual(game.whosOn().firstBase.name, "Bill Joy")
        
        let runners = game.currentPlay().runnerOutcomes
        XCTAssertEqual(runners.homeBaseLine.rawValue, "SCORES")      // from second to third
        XCTAssertEqual(runners.thirdBaseLine.rawValue, "AB")      // from second to third
        XCTAssertEqual(runners.secondBaseLine.rawValue, "AB")       // from first to second
        XCTAssertEqual(runners.firstBaseLine.rawValue, "1B")        // from batter's box (arround home plate) to first
    }
 
    func test_runnerOn_BatterWalksBasesLoadedSituation() {
        let game = Game()
        game.setVisitorTeamLineUp()          // game needs a lineUp to populate the next batter
        //        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        //        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        //        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        //        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        //        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        //        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        //        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        //        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        //        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)
        
        // having to explisitly move players around the bases - via method calls -- SUCKS << FixMe with automatic advancement
        let secondPlay = game.batterUp()
        game.runnerOn(.firstBase, action: .advances )
        secondPlay.umpCalled(.single)

        let thirdPlay = game.batterUp()
        game.runnerOn(.secondBase, action: .advances )
        game.runnerOn(.firstBase, action: .advances )
        thirdPlay.umpCalled(.single)

        // the ORDER matters a lot - you must advance runners in (play order)
        let fourthPlay = game.batterUp()
        game.runnerOn(.thirdBase, action: .advances)
        game.runnerOn(.secondBase, action: .advances)
        game.runnerOn(.firstBase, action: .advances)
        fourthPlay.umpCalled(.walk)
        
        XCTAssertEqual(game.whosOn().homePlate.name, "Duke Java")
        XCTAssertEqual(game.whosOn().thirdBase.name, "James Gosling")
        XCTAssertEqual(game.whosOn().secondBase.name, "Scott McNealy")
        XCTAssertEqual(game.whosOn().firstBase.name, "Bill Joy")
        
        let thisPlay = game.currentPlay()
        XCTAssertEqual(thisPlay.runnerOutcomes.firstBaseLine.rawValue, "W")
        XCTAssertEqual(thisPlay.runnerOutcomes.secondBaseLine.rawValue, "AB")
        XCTAssertEqual(thisPlay.runnerOutcomes.thirdBaseLine.rawValue, "AB")
        XCTAssertEqual(thisPlay.runnerOutcomes.homeBaseLine.rawValue, "SCORES")
        
        XCTAssertEqual(game.score.visitor, 1)
        XCTAssertEqual(game.score.home, 0)
    }
    
    
    func test_runnerOn_RunnerScoresARun() {
        let game = Game()
        game.setVisitorTeamLineUp()          // game needs a lineUp to populate the next batter
        //        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        //        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        //        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        //        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        //        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        //        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        //        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        //        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        //        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)

        let secondPlay = game.batterUp()          // must call batterUp() before runnerOn()
        game.runnerOn(.firstBase, action: .advances3)
        
        secondPlay.umpCalled(AtBat.triple)
        
        XCTAssertEqual( game.whosOn().thirdBase.name, "James Gosling")
        XCTAssertEqual( game.whosOn().homePlate.name , "Duke Java")
        XCTAssertEqual( game.score.visitor, 1)
    }
  
    
    //        func testrunnerAdvances_CaughtStealing() throws {
    //        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
    //        let aPlay = Play(description: "say something on the air", batter: batter, atBat: AtBat.single )
    //        aPlay.runnerAdvances(action: .caughtStealing, base: Bases.firstBase )
    //
    //            XCTAssertEqual( aPlay.whosOn().runnerOutcome.firstBase , "CS" )
    //
    //    }
    
    func test_umpCalled_single() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.single)
    }
    
    func test_umpCalled_double() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.double)
        
        XCTAssertEqual(game.whosOn().secondBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.double)
    }
    
    func test_umpCalled_triple() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.triple)
        
        XCTAssertEqual(game.whosOn().thirdBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.triple)
    }
     
    func test_umpCalled_homeRun() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.homeRun)
        
        XCTAssertEqual(game.whosOn().homePlate.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.homeRun)
    }
    
    func test_umpCalled_walk() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.walk)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.walk)
    }
    
    func test_umpCalled_baseOnBalls() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.baseOnBalls)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.baseOnBalls)
    }
    
    
    func test_umpCalled_fildersChoice() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.fildersChoice)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.fildersChoice)
    }
    
    
    func test_umpCalled_doublePlay() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)
        let secondPlay = game.batterUp()
        secondPlay.umpCalled(.doublePlay)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.doublePlay)
        XCTAssertEqual(game.currentPlay().runnerOutcomes.secondBaseLine, RunnerActions.doublePlay)
    }
    
    
    func test_umpCalled_triplePlay() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)
        let secondPlay = game.batterUp()
        secondPlay.umpCalled(.single)
        
        let thirdPlay = game.batterUp()
        thirdPlay.umpCalled(.triplePlay)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.triplePlay)
        XCTAssertEqual(game.currentPlay().runnerOutcomes.secondBaseLine, RunnerActions.triplePlay)
        XCTAssertEqual(game.whosOn().secondBase.name, "Empty Player")
        XCTAssertEqual(game.whosOn().thirdBase.name, "Empty Player")
    }
    
    
    func test_umpCalled_caughtStealing() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)
        let secondPlay = game.batterUp()
        game.runnerOn(.firstBase, action: .caughtStealing)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.blank)
        XCTAssertEqual(game.currentPlay().runnerOutcomes.secondBaseLine, RunnerActions.caughtStealing)
    }
    
    func test_umpCalled_flyOut() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.flyOut)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.flyOut)
    }
    
    
    func test_umpCalled_foulOut() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.foulOut)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.foulOut)
    }
    
    func test_umpCalled_groundOut() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.groundOut)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.groundOut)
    }
    
    func test_umpCalled_strikeoutSwinging() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.strikeoutSwinging)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.strikeoutSwinging)
    }
    
    func test_umpCalled_strikeoutLooking() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.strikeoutLooking)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.strikeoutLooking)
    }
    
    func test_umpCalled_lineOut() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.lineOut)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.lineOut)
    }
    
    
    func test_umpCalled_sacrificeFly() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)
        
        
        game.runnerOn(.firstBase, action: .advances)
        
        
        let secondPlay = game.batterUp()
        secondPlay.umpCalled(.sacrificeFly)
        game.runnerOn(.secondBase, action: .advances)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.sacrificeFly)
        XCTAssertEqual(game.currentPlay().runnerOutcomes.thirdBaseLine, RunnerActions.advances)
        XCTAssertEqual(game.whosOn().thirdBase.name, "Duke Java")
    }
    
    func test_umpCalled_sacrificeHit() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.single)        // Duke on first
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")

        let secondPlay = game.batterUp()
        secondPlay.umpCalled(.sacrificeHit) // Duke to 2nd
        game.runnerOn(.firstBase, action: .advances)
        
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.sacrificeHit)

        XCTAssertEqual(game.whosOn().secondBase.name, "Duke Java")
    }
    
    
    func test_umpCalled_unassistedOut() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.unassistedOut)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Empty Player")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.unassistedOut)
    }

    
    func test_umpCalled_balk() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.balk)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.balk)
    }

    
    
    func test_umpCalled_error() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.error)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.error)
    }
    
    func test_umpCalled_hitByPitch() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.hitByPitch)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.hitByPitch)
    }
    
    func test_umpCalled_interference() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.interference)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.interference)
    }
    
    
    func test_umpCalled_intentionalWalk() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.intentionalWalk)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.intentionalWalk)
    }
    
    
    func test_umpCalled_passedBall() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.passedBall)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.passedBall)
    }
    
    
    func test_umpCalled_wildPitch() {
        let game = Game()
        game.setVisitorTeamLineUp()
        game.setHomeTeamLineUp()
        
        let firstPlay = game.batterUp()
        firstPlay.umpCalled(.wildPitch)
     
        XCTAssertEqual(game.whosOn().firstBase.name, "Duke Java")
        XCTAssertEqual(game.currentPlay().runnerOutcomes.firstBaseLine, AtBat.wildPitch)
    }
    
    
    
//    // types of Outs - numbers are the positions that interact with the ball



//    case passedBall = "PB"      // ball get's passed the catcher
//    case wildPitch = "WP"       // pitcher has a bad throw
}
