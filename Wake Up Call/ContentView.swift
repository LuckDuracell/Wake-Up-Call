//
//  ContentView.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
//                LinearGradient(colors: [.yellow, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .edgesIgnoringSafeArea(.all)
                Image("sunset")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 16)
                VStack {
                    Text(Date().formatted(date: .omitted, time: .shortened))
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .shadow(radius: 4, x: 2, y: 3)
                        .padding(.top, 50)
                        .padding(25)
                    Text("Lets show this day whos boss!")
                        .foregroundColor(.white)
                        .font(.largeTitle.bold())
                        .frame(width: UIScreen.main.bounds.width)
                        .shadow(radius: 4, x: 2, y: 2)
                        .padding()
                    Divider()
                    ButtonPanel()
                        .frame(width: UIScreen.main.bounds.width)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


func generateNum(digits: Int) -> [String] {
    var output: [String] = []
    for _ in 0...digits {
        output.append("\(Int.random(in: 0...9))")
    }
    return output
}
