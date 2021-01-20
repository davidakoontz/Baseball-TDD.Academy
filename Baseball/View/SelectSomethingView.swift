//
//  SelectSomethingView.swift
//  Baseball
//
//  Created by David on 1/18/21.
//


import SwiftUI

struct SelectSomethingView: View {
    @EnvironmentObject var game: Game
    var body: some View {
        Text("Please select something from the menu to begin.")
            .italic()
            .foregroundColor(.secondary)
    }
}

struct SelectSomethingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSomethingView()
    }
}
