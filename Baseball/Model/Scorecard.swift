//
//  Scorecard.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import Foundation

public class Scorecard {

    var listOfPlays: [Play] = []
    
    public func score( _ play: Play ) -> String {
        
        // do some math stuff to record this play
        
        // keep this in our List
        listOfPlays.append(play)
        print("Scorecard:score where output is \(play.description)")

        return play.description
    }
    
    init() {
        // nothing for now
    }
}
