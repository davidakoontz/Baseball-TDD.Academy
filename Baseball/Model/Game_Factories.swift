//
//  Game_Factories.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation

extension Game {
    static func makeStatic() -> Game {
        let game = Game()
        
        // visitors always bat first (top of innings)
        let duke = Player(name: "Duke Java", number: "33", position: .leftField)
        let james = Player(name: "James Gosling", number: "4", position: .thirdBase)
        let scott = Player(name: "Scott McNealy", number: "37", position: .centerField)
        let billJoy = Player(name: "Bill Joy", number: "39", position: .rightField)
        let andy = Player(name: "Andy Bechtolsheim", number: "41", position: .pitcher)
        let larry = Player(name: "Larry Ellison", number: "2", position: .catcher)
        let sun  = Player(name: "Sun Li", number: "62", position: .firstBase)
        let tzu = Player(name: "Sun Tzu", number: "99", position: .secondBase)
        let nike = Player(name: "Nike Sun", number: "42", position: .shortStop)
        
       
        
        // home team (bat bottom of innings)
        let taylor = Player(name: "Taylor Swift", number: "17", position: .centerField)
        let bill = Player(name: "Bill Swift", number: "18", position: .pitcher)
        let jonathan = Player(name: "Jonathan Swift", number: "67", position: .leftField)
        let bob = Player(name: "Bob Swift", number: "8", position: .catcher)
        let kay = Player(name: "Kay Swift", number: "87", position: .firstBase)
        let patrick = Player(name: "Patrick Swift", number: "55", position: .secondBase)
        let todd = Player(name: "Todd Swift", number: "73", position: .thirdBase)
        let connor = Player(name: "Connor Swift", number: "6", position: .rightField)
        let ellen = Player(name: "Ellen Swift", number: "88", position: .shortStop)
       
        game.visitorLineUp = LineUp(list: [duke, james, scott, billJoy, andy, larry, sun, tzu, nike])
        game.homeLineUp    = LineUp(list: [taylor, bill, jonathan, bob, kay, patrick, todd, connor, ellen])
        
        
        
        // first Inning - top half
        let play1 = Play(game: game, description: "Duke hits a grounder to left field", batter: duke, atBat: AtBat.single)
        let play2 = Play(game: game, description: "James goes down swinning", batter: james, atBat: AtBat.strikeoutSwinging )
        let play3 = Play(game: game, description: "Scott flys out to right field", batter: scott, atBat: AtBat.flyOut)
        let play4 = Play(game: game, description: "Bill fouls out", batter: bill, atBat: AtBat.foulOut)

        // first Inning - bottom half
        let play5 = Play(game: game, description: "Taylor walks", batter: taylor, atBat: AtBat.walk)
        let play6 = Play(game: game, description: "Bill hits a double", batter: bill, atBat: AtBat.double)
        let play7 = Play(game: game, description: "Jonathan hits a triple", batter: jonathan, atBat: AtBat.triple)
        let play8 = Play(game: game, description: "Bob hits a scrafice fly to left filed - scoring Jonathan", batter: bob, atBat: AtBat.sacrificeFly)
        let play9 = Play(game: game, description: "Kay goes down looking", batter: kay, atBat: AtBat.strikeoutLooking)
        let play10 = Play(game: game, description: "Patrick lines out to short", batter: patrick, atBat: AtBat.lineOut)

        let firstInning = Inning(label: "1", game: game,
                                  top: [play1, play2, play3, play4 ],
                                  bottom: [play5, play6, play7, play8, play9, play10 ])
        

        // Second Inning
        let play11 = Play(game: game, description: "Andy gets a double", batter: andy, atBat: AtBat.double)
        let play12 = Play(game: game, description: "Larry is eliminated with a fast ball to the inside corner", batter: larry, atBat: AtBat.strikeoutLooking )
        let play13 = Play(game: game, description: "Sun Li hits a short hopper to center", batter: sun, atBat: AtBat.single)
        let play14 = Play(game: game, description: "Sun Tzu hits into a classic 6-4-3 double play", batter: tzu, atBat: AtBat.doublePlay)

        let play15 = Play(game: game, description: "Todd hits a line drive down the thridbase line", batter: todd, atBat: AtBat.single)
        let play16 = Play(game: game, description: "connor goes deep to right field - it's out of here!", batter: connor, atBat: AtBat.homeRun)
        let play17 = Play(game: game, description: "ellen is intentionally walked", batter: ellen, atBat: AtBat.intentionalWalk)

        let second = Inning(label: "2", game: game,
                                   top: [play11, play12, play13, play14 ],
                                   bottom: [play15, play16, play17])
        // Third Inning
        let play18 = Play(game: game, description: "Nike gets a double", batter: nike, atBat: AtBat.double)
        let play19 = Play(game: game, description: "Duke is eliminated with a fast ball to the inside corner", batter: duke, atBat: AtBat.strikeoutSwinging)
        let play20 = Play(game: game, description: "James hits a short hopper to center", batter: james, atBat: AtBat.single)
        let play21 = Play(game: game, description: "Scott Tzu hits into a classic 6-4-3 double play", batter: scott, atBat: AtBat.doublePlay)
        // Third Inning - bottom half
        let play22 = Play(game: game, description: "Taylor walks", batter: taylor, atBat: AtBat.walk)
        let play23 = Play(game: game, description: "Bill hits a double", batter: bill, atBat: AtBat.double)
        let play24 = Play(game: game, description: "Jonathan hits a triple", batter: jonathan, atBat: AtBat.triple)
        let play25 = Play(game: game, description: "Bob hits a scrafice fly to left filed - scoring Jonathan", batter: bob, atBat: AtBat.sacrificeFly)
        let play26 = Play(game: game, description: "Kay goes down looking", batter: kay, atBat: AtBat.strikeoutLooking)
        let play27 = Play(game: game, description: "Patrick lines out to short", batter: patrick, atBat: AtBat.lineOut)

        let third = Inning(label: "3", game: game,
                           top: [play18, play19, play20, play21],
                           bottom: [play22, play23, play24, play25, play26, play27])

        let fourth = Inning(label: "4", game: game, top: [], bottom: [])
        let fifth = Inning(label: "5", game: game, top: [], bottom: [])
        let sixth = Inning(label: "6", game: game, top: [], bottom: [])
        let seventh = Inning(label: "7", game: game, top: [], bottom: [])
        let eighth = Inning(label: "8", game: game, top: [], bottom: [])
        let ninth = Inning(label: "9", game: game, top: [], bottom: [])
        
        var exampleInnings: [Inning] =  [
            /* zero, */ firstInning, second, third, fourth, fifth, sixth, seventh, eighth, ninth
        ]

        game.innings = exampleInnings       // overwriting with our example plays
        
        return game
    }
}
