//
//  ContentView.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

struct ScoreSheetView: View {
    var game: Game
    //@EnvironmentObject var game: Game
    static let tag: String? = "ScoreSheet"
    
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
            //Text(play.atBat.rawValue)     //  is a Enum AtBat
            Text(play.runnerOutcomes.firstBaseLine.last?.rawValue ?? play.atBat.rawValue)
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
                    ForEach(game.innings, id: \.self.label ) { inning in
                        //let inning = game.next()!       // OUCH! unwrap innings
                        let visitorsPlays = inning.top
                        let homeTeamPlays = inning.bottom
                        
                        Section(header: Text("Visiting Team" + " - inning #\(inning.label)").font(.title2)) {
                            playerRowView(plays: visitorsPlays)
                        }
                        
                        
                        Section(header: Text("Home Team" + " - inning #\(inning.label)").font(.title2), footer: Text("score: \(inning.summary)")) {
                            playerRowView(plays: homeTeamPlays)
                        }
                        
                    } // for loop
                    
                }
                //Text("Game final score: 0 to 0")  // game.finalScore
            } // ScrollView
        } // if else
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        //ContentView(players: Player.example)
        ScoreSheetView(game: Game.makeStatic())
           // .environmentObject( Game(innings: Game.exampleInnings) )
    }
}
