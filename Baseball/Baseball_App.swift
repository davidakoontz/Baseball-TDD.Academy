//
//  Baseball_App.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

// swiftlint:disable type_name
@main
struct Baseball_App: App {
    
    var game = Game.makeStatic()
    
    // remember which tab View we were on last time we ran the app
    @SceneStorage("selectedView") var selectedView: String?
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
                //.environmentObject(game)
        }
    }
}
