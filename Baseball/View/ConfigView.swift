//
//  ConfigView.swift
//  Baseball
//
//  Created by David on 1/19/21.
//


import SwiftUI

struct ConfigView: View {
    @EnvironmentObject var game: Game

    static let configTag: String? = "Config"
    

    var body: some View {
        NavigationView {
            Group {
                List {
                    HStack {
                        Label("Game Mode", systemImage: "switch.2")
                            .listItemTint(.pink)
                        Button(action: {}, label:  {
                            Text("Baseball")
                            Text("Softball")
                        })
                        
                    }
                    HStack {
                        Label("Filders", systemImage: "switch.2")
                            .listItemTint(.purple)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label:  {
                            Text("9")
                            Text("10")
                        })
                    }
                    HStack {
                        Label("Innings", systemImage: "switch.2")
                            .listItemTint(.orange)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label:  {
                            Text("6")
                            Text("9")
                        })
                    }
                } // List
                .listStyle(SidebarListStyle())
            } // Group
            .navigationTitle( "Config Menu" )
            .toolbar  {
                ToolbarItem(placement: .bottomBar) {
                    Button("Exit") {}
                }

            } // toolbar

            
        // the primary view is the Group
        // the secondary view on iPad or wide screens like iPhone Pro Max
        SelectSomethingView()
        
        } // Group
    } // Nav View
}

struct ConfigView_Previews: PreviewProvider {
  
    static var previews: some View {
        ConfigView()

    }
}
