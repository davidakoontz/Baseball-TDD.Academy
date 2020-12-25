//
//  ContentView.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    var game: Game
//    var game: [Inning]
//    var players : [Player]

    // see: https://swiftwithmajid.com/2020/07/08/mastering-grids-in-swiftui/
    // layout of our player grid
    var columns: [GridItem] = [
        GridItem(.fixed(10)),   // left margin
        GridItem(.fixed(40), spacing: 16, alignment: .trailing),    // player number
        GridItem(.fixed(200), spacing: 16, alignment: .leading),    // name
        GridItem(.fixed(20), spacing: 16),                          // position
        GridItem(.fixed(80), spacing: 16)                           // atBat outcome
    ]
    
    //swiftlint:disable large_tuple
    fileprivate func playerRowView(plays: [Play])
        -> ForEach<[Play], String, TupleView<(Spacer, Text, Text, Text, Text)>> {
        return ForEach(plays) { play in
            Spacer()
            Text("#\(play.batter.number)")
            Text(play.batter.name)
            Text(play.batter.position.rawValue)
            Text(play.outcome.rawValue)
        }
    }
    
    var body: some View {
        
        if game.innings.isEmpty {
            Text("No Players!")
        } else {
            ScrollView {
                LazyVGrid(columns: columns,
                          alignment: .center,
                          spacing: 16,
                          pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    let inning = game.next()!       // OUCH! unwrap innings
                    let visitorsPlays = inning.top
                    let homeTeamPlays = inning.bottom
                    
                    Section(header: Text("Visiting Team" + " - inning #\(inning.number)").font(.title2)) {
                        playerRowView(plays: visitorsPlays)
                    }
                    
                    
                    Section(header: Text("Home Team" + " - inning #\(inning.number)").font(.title2)) {
                        playerRowView(plays: homeTeamPlays)
                    }
                    
                }
            }
        } // if else
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        //ContentView(players: Player.example)
        ContentView(game: Game.example)
    }
}
