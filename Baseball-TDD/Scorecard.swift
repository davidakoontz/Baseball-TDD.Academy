//
//  Scorecard.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import Foundation

public class Scorecard : CustomStringConvertible {
    public var description: String { return "{17, Henry, D, 9, BB}"}

    
    public static func score( _ play: Play ) -> String {
        let output = "Scorecard"
        
        print(output)
        
        return output
    }
    
    init() {
        // nothing for now
    }
}
