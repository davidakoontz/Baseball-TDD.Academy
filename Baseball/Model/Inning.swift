//
//  Inning.swift
//  Baseball
//
//  Created by David on 12/10/20.
//

import Foundation

public class Inning {
    var label: String           // an inning number 1 - 9 typical game length
    var game: Game!             // a game that this Inning belong to - Ref to owner
    var play: Play              // the current Play that is holding all the action
    var top: [Play]             // an array of plays in the TOP half of the inning
    var bottom: [Play]          // an array of Plays in the BOTTOM half of the inning
    var summary: String         // the inning's score:  Home to Visitor
    
    init(label: String, game: Game, top: [Play], bottom: [Play], summary: String) {
        self.label = label
        self.play = EmptyPlay(theGame: game)
        self.top = top
        self.bottom = bottom
        self.summary = summary

        self.game = game
        print("Inning.init() creates an EmptyPlay")
    }
    
    init(label: String, top: [Play], bottom: [Play], summary: String) {
        self.label = label
        self.play = EmptyPlay(theGame: game)
        self.top = top
        self.bottom = bottom
        self.summary = summary
        print("Inning.init() with nil Game ref. - creates an EmptyPlay")
    }
    
    func append(_ play: Play, teamAtBat: Team) {

        if teamAtBat == Team.visitor {
            appendTop(play)
        } else {
            appendBottom(play)
        }
        
    }
    
    func currentPlay() -> Play {
        return play
    }
    
    
    
    func setLabel(_ labelString: String) {
        self.label = labelString
    }

    func setSummary(_ summary: String) {
        self.summary = summary
    }
    
    
    private func appendTop(_ play: Play) {
        self.play = play
        top.append(play)
    }
    
    private func appendBottom(_ play: Play) {
        self.play = play
        bottom.append(play)
    }
    
    
}


public enum InningHalf: String {
    case top = "Top"
    case bottom = "Bottom"
}

class EmptyInning : Inning {
    init(game: Game) {
        
        super.init(label: "0", game: game, top: [], bottom: [], summary: "0 to 0")
    }
}

