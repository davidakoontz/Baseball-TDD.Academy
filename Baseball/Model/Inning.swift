//
//  Inning.swift
//  Baseball
//
//  Created by David on 12/10/20.
//

import Foundation

public class Inning {
    var label: String      // an inning number 1 - 9 typical game length
    var top: [Play]         // an array of plays in the TOP half of the inning
    var bottom: [Play]    // an array of Plays in the BOTTOM half of the inning
    var summary: String     // the inning's score:  Home to Visitor
    
    init(label: String, top: [Play], bottom: [Play], summary: String) {
        self.label = label
        self.top = top
        self.bottom = bottom
        self.summary = summary
    }
    

    
    // public getter
    // private setter
    public func setNumber(_ labelString: String) {
        self.label = labelString
    }
    
    public func appendTop(_ play: Play) {
        top.append(play)
    }
    
    public func appendBottom(_ play: Play) {
        bottom.append(play)
    }
    
    public func setSummary(_ summary: String) {
        self.summary = summary
    }
    
    
}


