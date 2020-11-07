//
//  ScorecardView.swift
//  Baseball-TDD
//
//  Created by David on 11/4/20.
//

import SwiftUI



struct PlayerRowView : View {
    var player: Player

    var body: some View {
        HStack(alignment: .bottom, spacing: 1) {
            Spacer()
            Text("#\(player.number) ")
            Text(player.name)
            Spacer()
            Text(player.position)
            Spacer()
            Text(player.atBat)
            Spacer()
            BallField()
                .stroke(Color.blue, lineWidth: 1)
                .frame(width: 10, height: 10)
            Spacer()
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: Player.example)
    }
}
