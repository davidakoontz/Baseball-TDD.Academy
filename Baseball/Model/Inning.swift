//
//  Inning.swift
//  Baseball
//
//  Created by David on 12/10/20.
//

import Foundation

public class Inning {
    var number: String      // an inning number 1 - 9 typical game length
    var top: [Play]         // an array of plays in the TOP half of the inning
    var bottom: [Play]    // an array of Plays in the BOTTOM half of the inning
    var summary: String     // the inning's score:  Home to Visitor
    
    init(number: String, top: [Play], bottom: [Play], summary: String) {
        self.number = number
        self.top = top
        self.bottom = bottom
        self.summary = summary
    }
    

    
    // public getter
    // private setter
    public func setNumber(_ numberString: String) {
        self.number = numberString
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
    
    public func whichHalf() -> InningHalf {
        if top.count == bottom.count {
            return InningHalf.bottom
        } else {
            return InningHalf.top
        }
    }
    

    
}


public enum InningHalf: String {
    case top = "Top"
    case bottom = "Bottom"
}
