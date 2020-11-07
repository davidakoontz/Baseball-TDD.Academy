//
//  ContentView.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    
    // Find our data.json in the Main App Bundle and parse it.
    let player = Bundle.main.decode(Player.self, from: "data.json")
 
    var body: some View {
        Text("Hello, \(player.name)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
