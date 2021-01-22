//
//  ProjectView.swift
//  Baseball
//
//  Created by David on 1/18/21.
//


import SwiftUI

struct ScoreGameView: View {
    var game: Game
    //@EnvironmentObject var game: Game
    static let addGameTag: String? = "AddGame"
    
    var body: some View {
        NavigationView {
            Group {
                Image("baseball-diamond-field")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("nothing here yet...")
                Text("just nonfunctional toolbar items...")
            } // Group
            
            .navigationTitle("Score a game")
            .toolbar  {
                ToolbarItem(placement: .bottomBar) {
                    Button("Hit") {
                        let play = game.nextBatter()
                        play.umpCalled(.single)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Ball") {}
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Strike") {}
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Foul") {}
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Out") {
                        let play = game.nextBatter()
                        play.umpCalled(.lineOut)}
                }
                
            } // toolbar

            
        // the primary view is the Group
        // the secondary view on iPad or wide screens like iPhone Pro Max
        //SelectSomethingView()
        
        } // Group
    } // Nav View
}

struct ScoreGameView_Previews: PreviewProvider {
  
    static var previews: some View {
        ScoreGameView(game: Game.example)

    }
}
