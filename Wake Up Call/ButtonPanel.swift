//
//  ButtonPanel.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/15/22.
//

import SwiftUI

struct ButtonPanel: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
            MenuButton(gameView: MemorizeIt(), gameIcon: "brain.head.profile")
            MenuButton(gameView: PopTheLock(), gameIcon: "arrow.counterclockwise.circle.fill")
            MenuButton(gameView: {Text("Lol")}(), gameIcon: "cup.and.saucer.fill")
            MenuButton(gameView: {Text("Lol")}(), gameIcon: "questionmark.bubble.fill")
            MenuButton(gameView: {Text("Lol")}(), gameIcon: "newspaper.circle.fill")
            MenuButton(gameView: MathGame(), gameIcon: "plusminus.circle.fill")
            MenuButton(gameView: {Text("Lol")}(), gameIcon: "curlybraces.square.fill")
            MenuButton(gameView: {Text("Lol")}(), gameIcon: "hammer.circle.fill")
            MenuButton(gameView: {Text("Lol")}(), gameIcon: "bird.fill")
            
        }) .padding()
            .padding(.horizontal, 17)
    }
}

struct ButtonPanel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPanel()
    }
}
