//
//  FieldSimulator.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import Foundation

// This class may include specifics of a Baseball Field such as:
//   distance to Fence (for Home Runs)

public class FieldSimulator {
    let fence = 400     // feet to center field fence (typical)
    
    public static func isHitAHomeRun(_ hit: Play ) -> Bool {
        return false
    }
    
    init() {
        // nothing for now
    }
}
