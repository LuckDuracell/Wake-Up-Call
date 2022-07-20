//
//  MenuButton.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/15/22.
//

import SwiftUI

struct MenuButton: View {
    
    let gameView: any View
    let gameIcon: String
    
    var body: some View {
        NavigationLink(destination: {
            AnyView(gameView)
        }, label: {
            Image(systemName: gameIcon)
                .resizable()
                .scaledToFit()
                .foregroundColor(.pink)
                .frame(width: 65, height: 65, alignment: .center)
                .padding(15)
                .shadow(radius: 2)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            .shadow(.inner(color: Color(red: 197/255, green: 197/255, blue: 197/255).opacity(0.9),radius: 3, x:3, y: 3))
                            .shadow(.inner(color: .white, radius: 3, x: -3, y: -3))
                        )
                        .foregroundColor(Color(red: 236/255, green: 234/255, blue: 235/255))
                )
                .background(.white)
                .cornerRadius(30)
                .padding(.vertical, 2)
                .padding(.horizontal, -5)
        })
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(gameView: {Text("Cool")}(), gameIcon: "newspaper.circle.fill")
    }
}
