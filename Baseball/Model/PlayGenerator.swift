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
    
    // a random play will require a roster of players and a pointer to the next player in the lineup
    public func getRandomPlay() -> Play {
        //let randomPlay = AtBat.allCases.randomElement() ?? AtBat.error
        // having AtBat enum conform to CaseIterable provides allCases & randomElement() for FREE
        let randomAtBat = AtBat.allCases.randomElement() ?? AtBat.error
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        let aPlay = Play(description: "random play", batter: batter, atBat: randomAtBat)
        return aPlay
    }
    
    public func startPlay(_ situation: Situation) -> Play {
        self.situation = situation
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        play = Play(description: "Hey batter swing", batter: batter, atBat: AtBat.single)
        
        return play
    }
    
    init() {
        // nothing for now
        situation = Situation()
        let batter = Player(name: "Random PlayerName", number: "00", position: .firstBase)
        play = Play(description: "Hey batter swing", batter: batter, atBat: AtBat.single)
        
    }
    

}
