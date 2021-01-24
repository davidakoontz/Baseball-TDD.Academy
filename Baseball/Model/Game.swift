//
//  Game.swift
//  Baseball
//
//  Created by David on 12/23/20.
//

import Foundation

public class Game: Sequence, IteratorProtocol, ObservableObject {
    
    // Alis for IteratorProtocol requirement
    public typealias Element = Inning
    
    var innings: [Inning] = []          // array (9) of innings holding top/bottom and summary
    var inningIndex = 0                 // the starting index of Innings
    var visitorLineUp = LineUp()
    var homeLineUp = LineUp()
    var bases = Bases()                 // four bases to hold Players
    var teamAtBat: Team = Team.visitor
    var score = Score()                 // an Int for visitors & home
    var outs = 0                        // number of out's this teams at bat

    //var roster: [Player]  // all the players on the team


    // MARK: Init Game methods
    init() {
        self.innings = []
        // init all Game properties - then init with 9 innings
        for i in 1...9  {
            let inning = Inning(label: "\(i)", game: self, top: [], bottom: [])
            appendInning(inning: inning)
        }
        inningIndex = 0     // start of game
    }
    
//    init(innings: [Inning]) {
//        self.innings = innings
//        inningIndex = 0     // start of game
//    }
//
//    init(first: Inning, second: Inning, thrid: Inning, fourth: Inning, fifth: Inning, sixth: Inning, seventh: Inning, eighth: Inning, nineth: Inning) {
//        self.innings = [ first, second, thrid, fourth, fifth, sixth, seventh, eighth, nineth ]
//        inningIndex = 0     // start of game
//    }
    
    // MARK: Game methods
    func playerOut() {
        self.outs += 1
        // do we care which player?? not now.
        if outs >= 3 {
            outs = 0
            switchFields()  // changes team at bat; and inningIndex
        }
    }


    // MARK: Inning methods
    
    func appendInning(inning: Inning) {
        let currentInning = innings.count + 1
        inning.setLabel( String(currentInning) )
        innings.append(inning)
    }
    
    public func switchFields() {
        // after 3 outs the teams switch fields
        if teamAtBat == Team.visitor {
            teamAtBat = Team.home
        } else {
            teamAtBat = Team.visitor
            inningIndex += 1            // and it's top of the next inning
        }
    }
      
      func whichHalf() -> InningHalf {
          if teamAtBat == Team.visitor {
              return InningHalf.top
          } else {
              return InningHalf.bottom
          }
      }
      
//    func createInning() -> Inning {
//        let inningNumber = innings.count + 1
//        let inning = Inning(label: "\(inningNumber)", game: self, top: [], bottom: [])
//        return inning
//    }
    
      func currentInning() -> Inning {
          return innings[inningIndex]
      }
      
      func inningCount() -> Int {
          return innings.count
      }
    
    // MARK: Iterator Protocol methods
    // Iterator & Sequence Protocol requires Public next method.
    // return the next element in swquence, if a next element exist; otherwise nil
    // Side effect resets the teamAtBat
    public func next() -> Inning? {
        inningIndex += 1
        guard inningIndex >= 0 && inningIndex < innings.count
            else { return nil }
        //defer { inningIndex += 1 }
        teamAtBat = Team.visitor    // visitor start each inning
        return innings[inningIndex]
    }
    
    // MARK: Batter methods
    
    /// returns next player to bat
    private func getNextBatter() -> Player {
        if teamAtBat == Team.visitor {
            return visitorLineUp.nextBatterInLineUp()
        } else {
            return homeLineUp.nextBatterInLineUp()
        }
    }
    
    /// factory method - creates a Play with next batter, puts the Play in the Inning top/bottom then -> returns the Play
    func batterUp() -> Play {
        let inning = currentInning()
 
        let batter = getNextBatter()
        // Create a NEW Play for this batter
        let thisPlay = Play(game: self, description: "...and up to bat is...\(batter.name) number \(batter.number) playing \(batter.position)", batter: batter)
        // a play should be appended to the proper Inning half
        inning.append(thisPlay, teamAtBat: teamAtBat)

        return thisPlay
    }
    
    // MARK: Runner methods
    
    func runnerOn(_ base: BaseNames, action: RunnerActions) {
        let inning = currentInning()

        let play = inning.currentPlay()
        
        switch base {
        // we do not record runner actions for the box to first base line - that's done in  Play.called()
        case BaseNames.batter:
            if 1 == 1 { /* do nothing  */ }
        case BaseNames.firstBase:
            if action == RunnerActions.advances {
                bases.secondBase = bases.firstBase        // the player moves to second
                play.runnerOutcomes.secondBaseLine = action
                bases.firstBase = EmptyPlayer()
            } else if action == RunnerActions.advances2 {
                bases.thirdBase = bases.firstBase
                play.runnerOutcomes.thirdBaseLine = action
                bases.firstBase = EmptyPlayer()
            } else if action == RunnerActions.advances3 {
                bases.homePlate = bases.firstBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.thirdBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
                bases.firstBase = EmptyPlayer()
            } else if action == RunnerActions.caughtStealing {
                bases.firstBase = EmptyPlayer()
                play.runnerOutcomes.secondBaseLine = action
            }
            play.runnerOutcomes.secondBaseLine = action
        case BaseNames.secondBase:
            if action == RunnerActions.advances {
                bases.thirdBase = bases.secondBase        // the player moves to third
                play.runnerOutcomes.thirdBaseLine = action
                bases.secondBase = EmptyPlayer()
            } else if action == RunnerActions.advances2 {
                bases.homePlate = bases.secondBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
                bases.secondBase = EmptyPlayer()
            } else if action == RunnerActions.advances3 {
                bases.homePlate = bases.secondBase
                play.runnerOutcomes.thirdBaseLine = action
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
                bases.secondBase = EmptyPlayer()
            } else if action == RunnerActions.caughtStealing {
                bases.secondBase = EmptyPlayer()
                play.runnerOutcomes.thirdBaseLine = action
            }
            play.runnerOutcomes.thirdBaseLine = action
        case BaseNames.thirdBase:
            if action == RunnerActions.advances {
                bases.homePlate = bases.thirdBase        // the player moves to home
                score.Add(runs: 1, teamAtBat: teamAtBat)
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                bases.thirdBase = EmptyPlayer()
            } else if action == RunnerActions.advances2 {
                bases.homePlate = bases.thirdBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
                bases.thirdBase = EmptyPlayer()
            } else if action == RunnerActions.advances3 {
                bases.homePlate = bases.thirdBase
                play.runnerOutcomes.homeBaseLine = action
                play.runnerOutcomes.homeBaseLine = RunnerActions.scores
                score.Add(runs: 1, teamAtBat: teamAtBat)
                bases.thirdBase = EmptyPlayer()
            } else if action == RunnerActions.caughtStealing {
                bases.thirdBase = EmptyPlayer()
                play.runnerOutcomes.homeBaseLine = action
            }
        case BaseNames.homePlate:
            // there is no action for home plate
            print("baseball score is \(score.visitor) to \(score.home)")
        }
    }
    
    func currentPlay() -> Play {
        return currentInning().currentPlay()
    }
    
    func whosOn() -> Bases {
        return bases        // should this be a copy?
    }
    



    // MARK: Team LineUp methods
    
    func setLineUp( lineUp: [Player], team: Team ) {
        if team == Team.home {
            homeLineUp.assign(list: lineUp)
        } else {
            visitorLineUp.assign(list: lineUp)
        }
    }
    
    func getDefaultTeamLineUp() ->  [Player]  {
        let player1 = Player(name: "Player 1", number: "33", position: .shortStop)
        let player2 = Player(name: "Player 2", number: "4",  position: .leftField)
        let player3 = Player(name: "Player 3", number: "37", position: .centerField)
        let player4 = Player(name: "Player 4", number: "39", position: .rightField)
        let player5 = Player(name: "Player 5", number: "41", position: .pitcher)
        let player6 = Player(name: "Player 6", number: "2",  position: .catcher)
        let player7 = Player(name: "Player 7", number: "62", position: .firstBase)
        let player8 = Player(name: "Player 8", number: "99", position: .secondBase)
        let player9 = Player(name: "Player 9", number: "42", position: .thirdBase)
        return [player1, player2, player3, player4, player5, player6, player7, player8, player9]
    }
    
    func setHomeTeamLineUp() {
        let player1 = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let player2 = Player(name: "Bill Swift", number: "18",  position: .pitcher)
        let player3 = Player(name: "Jonathan Swift", number: "67", position: .leftField)
        let player4 = Player(name: "Bob Swift", number: "8", position: .catcher)
        let player5 = Player(name: "Kay Swift", number: "87", position: .firstBase)
        let player6 = Player(name: "Patrick Swift", number: "55",  position: .secondBase)
        let player7 = Player(name: "Todd Swift", number: "73", position: .thirdBase)
        let player8 = Player(name: "Connor Swift", number: "6", position: .rightField)
        let player9 = Player(name: "Ellen Swift", number: "88", position: .shortStop)
        homeLineUp.add(player1)
        homeLineUp.add(player2)
        homeLineUp.add(player3)
        homeLineUp.add(player4)
        homeLineUp.add(player5)
        homeLineUp.add(player6)
        homeLineUp.add(player7)
        homeLineUp.add(player8)
        homeLineUp.add(player9)
    }
    
    func setVisitorTeamLineUp() {
        let Duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let James = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let Scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let BillJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let Andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let Larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let Sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let Tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let Nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        visitorLineUp.add(Duke)
        visitorLineUp.add(James)
        visitorLineUp.add(Scott)
        visitorLineUp.add(BillJoy)
        visitorLineUp.add(Andy)
        visitorLineUp.add(Larry)
        visitorLineUp.add(Sun)
        visitorLineUp.add(Tzu)
        visitorLineUp.add(Nike)
    }
    

} // end of Game class



