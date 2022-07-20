//
//  MathGame.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/15/22.
//

import SwiftUI

struct MathGame: View {
    
    @State var num = Int.random(in: 10...99)
    @State var num2 = Int.random(in: 10...99)
    @State var mathType = generateMathType()
    @State var gameEnd = 0
    @State var userAnswer: String = ""
    
    func checkAnswer(userAnswer: String) -> Bool {
        var ans = 0
        switch mathType {
            case "+":
                ans = num + num2
//            case "/":
//                ans = num / num2
//            case "×":
//                ans = num * num2
            default:
                ans = num - num2
        }
        if userAnswer == "\(ans)" {
            return true
        } else {
            return false
        }
    }

    
    var body: some View {
        ZStack {
            Image("sunset")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 16)
            VStack {
                if gameEnd == 0 {
                    HStack {
                        Text("\(num)")
                            .font(.title.bold())
                            .padding(3)
                            .shadow(radius: 2, x: 2, y: 2)
                        Text(mathType)
                            .font(.title.bold())
                            .padding(3)
                            .shadow(radius: 2, x: 2, y: 2)
                        Text("\(num2)")
                            .font(.title.bold())
                            .padding(3)
                            .shadow(radius: 2, x: 2, y: 2)
                    } .foregroundColor(.white)
                    
                    TextField("", text: $userAnswer)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .frame(width: 130, height: 60, alignment: .center)
                        .background(.regularMaterial)
                        .padding(5)
                        .bold()
                    
                    Button {
                        if checkAnswer(userAnswer: userAnswer) {
                            gameEnd = 1
                        } else {
                            gameEnd = 2
                        }
                    } label: {
                        Text("Check Answer")
                            .foregroundColor(.pink)
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
                } else if gameEnd == 1 {
                    Text("Oh wait you actually won!")
                        .foregroundColor(.white)
                } else {
                    Text("You lost lmao")
                        .foregroundColor(.white)
                    Button {
                        gameEnd = 0
                        num = Int.random(in: 10...99)
                        num2 = Int.random(in: 10...99)
                        mathType = generateMathType()
                        userAnswer = ""
                    } label: {
                        Text("Try Again")
                            .foregroundColor(.pink)
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
            .frame(width: UIScreen.main.bounds.width)
            .toolbar(content: {
                ToolbarItem(placement: .keyboard, content: {
                    Button { userAnswer += "-" } label: { Text("-") }
                })
            })
        }
    }
}

struct MathGame_Previews: PreviewProvider {
    static var previews: some View {
        MathGame()
    }
}

func generateMathType() -> String {
    let type = Int.random(in: 0...1)
    switch type {
        case 0:
            return "+"
        case 1:
            return "-"
        case 2:
            return "×"
        default:
            return "÷"
    }
}

