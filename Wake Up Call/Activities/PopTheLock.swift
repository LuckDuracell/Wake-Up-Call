//
//  PopTheLock.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/17/22.
//

import SwiftUI

struct PopTheLock: View {
    
    @State var spinning = false
    
    var body: some View {
        VStack {
            
            ZStack {
                Circle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.pink)
                    .mask(alignment: .top, {
                        Rectangle()
                            .frame(width: 20, height: 20, alignment: .center)
                    })
                Circle()
                    .frame(width: 42, height: 42, alignment: .center)
                    .foregroundColor(.green)
                Circle()
                    .frame(width: 55, height: 55, alignment: .center)
                    .foregroundColor(.indigo)
                    .mask(alignment: .top, {
                        Circle()
                            .frame(width: 10, height: 10, alignment: .top)
                    })
            }
            
            
            Button {
                spinning = true
            } label: {
                Text(spinning ? "Game Running" : "Start Game")
                    .foregroundColor(.indigo)
                    .font(.title.bold())
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(
                                .shadow(.inner(color: Color(red: 197/255, green: 197/255, blue: 197/255).opacity(0.9),radius: 3, x:3, y: 3))
                                .shadow(.inner(color: .white, radius: 3, x: -3, y: -3))
                            )
                            .foregroundColor(Color(red: 236/255, green: 234/255, blue: 235/255))
                    )
            }
        }
    }
}

struct PopTheLock_Previews: PreviewProvider {
    static var previews: some View {
        PopTheLock()
    }
}
