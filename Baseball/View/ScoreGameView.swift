//
//  ProjectView.swift
//  Baseball
//
//  Created by David on 1/18/21.
//


import SwiftUI

//struct ActionSheet: View {
//    var title: Text("Action Sheet Title")
//    var message:
//}


struct ScoreGameView: View {
    @ObservedObject var game: Game
    //@EnvironmentObject var game: Game
    static let addGameTag: String? = "AddGame"
    
    @State private var presentingHitPopup = false
    @State private var presentingFlyBallPopup = false
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                ZStack {
                    //Color(.gray)
                    VStack {
                        Image("baseball-diamond-field")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                           
                        Spacer()
                        HStack() {
                            Spacer()
                            Spacer()
                            Text("Balls: \(game.balls)")
                            Spacer()
                            Text("Strikes: \(game.strikes)")
                            Spacer()
                            Text("Outs: \(game.outs)")  // Outs: 1
                            Spacer()
                            Spacer()
                        }
                        Spacer()
                        Spacer()
                    } // VStack
                    
                    
                    if $presentingHitPopup.wrappedValue {
                        // show the modal popup menu
                        ZStack {
                            // darken the background
                            Color.black.opacity(0.4)
                                .ignoresSafeArea()
                            // VStack is the popup menu
                            Group {
                                VStack(alignment: .leading, spacing: 20) {
                                    
                                    HStack {    // menu header
                                        Button(action: {
                                            presentingHitPopup.toggle()
                                        }, label: {
                                            Text(" < Back")
                                        })
                                        .accessibility(identifier: "backButton")
                                        Spacer()
                                        Text("Hit")
                                            .bold().padding()
                                        Spacer()
                                        Text("Undo ")
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.orange)
                                    .foregroundColor(Color.white)
                                    //Spacer()
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Grounder", systemImage: "wave.3.left.circle")
                                    })
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Pop up", systemImage: "arrowshape.turn.up.right.circle")
                                    })
                                    Button(action: {
                                        presentingFlyBallPopup.toggle()
                                    }, label: {
                                        Label("Fly ball", systemImage: "f.cursive.circle")
                                    })
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Home run!", systemImage: "exclamationmark.circle")
                                    })
                                    Spacer()
                                    
                                } // VStack - popup
                                .frame(width: 200, height: 300)
                                .background(Color.white)
                                .cornerRadius(20).shadow(radius: 20)
                            } // Group
                            .offset(x: 0, y: 100)
                        }
                        
                    } // IF - HitPopup
                    
                    
                    if $presentingFlyBallPopup.wrappedValue {
                        // show the modal popup menu
                        ZStack {
                            // darken the background
                            Color.black.opacity(0.4)
                                .ignoresSafeArea()
                            // VStack is the popup menu
                            Group {
                                VStack(alignment: .leading, spacing: 20) {
                                    HStack {    // menu header
                                        Button(" < Back") {
                                            presentingFlyBallPopup.toggle()
                                        }
                                        .accessibility(identifier: "backButton")
                                        Spacer()
                                        Text("Fly Ball")
                                            .bold().padding()
                                        Spacer()
                                        Text("Undo ")
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.orange)
                                    .foregroundColor(Color.white)
                                    //Spacer()
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Single", systemImage: "wave.3.left.circle")
                                    })
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Double", systemImage: "arrowshape.turn.up.right.circle")
                                    })
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Triple", systemImage: "f.cursive.circle")
                                    })
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Homer!", systemImage: "exclamationmark.circle")
                                    })
                                    Button(action: {
                                        // do something
                                    }, label: {
                                        Label("Caught; batter's Out!", systemImage: "exclamationmark.circle")
                                    })
                                    Spacer()
                                    
                                } // VStack - popup
                                .frame(width: 240, height: 330)
                                .background(Color.white)
                                .cornerRadius(20).shadow(radius: 20)
                            } // Group
                            .offset(x: 0, y: 100)
                        }
                    } // IF - FlyBallPopup
                    
                    
                    
                } // ZStack
            } // Geo reader
            
            .navigationTitle("Score a game")                // page title
            .toolbar  {
    
                ToolbarItem(placement: .bottomBar) {        // bottom toolbar
                    Button("Hit") {
                        presentingHitPopup.toggle()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Ball") {
                        game.umpCalls(.ball)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Strike") {
                        game.umpCalls(.strike)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Foul") {
                        game.umpCalls(.foulball)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Out") {
                        // presentingOutPopup.toggle()
                    }
                }
                
            } // toolbar
            .accessibilityIdentifier("Toolbar")
            
            
            // the primary view is the Group
            // the secondary view on iPad or wide screens like iPhone Pro Max
            //SelectSomethingView()
            
        } // Group
    } // Nav View
}

struct ScoreGameView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScoreGameView(game: Game.makeStaticGame())
        
    }
}
