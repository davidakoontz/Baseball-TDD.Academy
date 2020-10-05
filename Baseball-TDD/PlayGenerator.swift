//
//  PlayGenenator.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import Foundation

// A Baseball play generator will create initial play senerarios
// such as a Fastball pitch
// or a throw to first base to pick off runner

public class PlayGenerator {
    var situation: Situation
    var play: Play
    
    public func startPlay(_ situation: Situation) -> Play {
        self.situation = situation
        play = Play()
        
        return play
    }
    
    init() {
        // nothing for now
        situation = Situation()
        play = Play()
        
    }
}
