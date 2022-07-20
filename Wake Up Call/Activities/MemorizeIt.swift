//
//  MemorizeIt.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/15/22.
//

import SwiftUI

struct MemorizeIt: View {
    
    @State var ready = false
    @State var num = generateNum(digits: 6)
    
    @State var values: [Int?] = [nil, nil, nil, nil, nil, nil]
    @FocusState var focusing: NumberBoxFocus?
    
    @State var gameEnd = 0
    
    var body: some View {
        ZStack {
            Image("sunset")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 16)
            VStack {
                if gameEnd == 0 {
                    Text(ready ? "Type in the Code" : "Remember this Code:")
                        .font(.title.bold())
                        .padding(3)
                        .shadow(radius: 2, x: 2, y: 2)
                        .foregroundColor(.white)
                    if ready {
                        HStack {
                            TextField("", value: $values[0], format: .number)
                                .multilineTextAlignment(.center)
                                .frame(width: 40, height: 60, alignment: .center)
                                .background(.regularMaterial)
                                .focused($focusing, equals: .first)
                                .onChange(of: values[0], perform: { _ in
                                    self.focusing = .second
                                })
                            TextField("", value: $values[1], format: .number)
                                .multilineTextAlignment(.center)
                                .frame(width: 40, height: 60, alignment: .center)
                                .background(.regularMaterial)
                                .focused($focusing, equals: .second)
                                .onChange(of: values[1], perform: { _ in
                                    self.focusing = .third
                                })
                            TextField("", value: $values[2], format: .number)
                                .multilineTextAlignment(.center)
                                .frame(width: 40, height: 60, alignment: .center)
                                .background(.regularMaterial)
                                .focused($focusing, equals: .third)
                                .onChange(of: values[2], perform: { _ in
                                    self.focusing = .fourth
                                })
                            TextField("", value: $values[3], format: .number)
                                .multilineTextAlignment(.center)
                                .frame(width: 40, height: 60, alignment: .center)
                                .background(.regularMaterial)
                                .focused($focusing, equals: .fourth)
                                .onChange(of: values[3], perform: { _ in
                                    self.focusing = .fifth
                                })
                            TextField("", value: $values[4], format: .number)
                                .multilineTextAlignment(.center)
                                .frame(width: 40, height: 60, alignment: .center)
                                .background(.regularMaterial)
                                .focused($focusing, equals: .fifth)
                                .onChange(of: values[4], perform: { _ in
                                    self.focusing = .sixth
                                })
                            TextField("", value: $values[5], format: .number)
                                .multilineTextAlignment(.center)
                                .frame(width: 40, height: 60, alignment: .center)
                                .background(.regularMaterial)
                                .focused($focusing, equals: .sixth)
                        }
                        Button {
                            var output = 0
                            for i in 0...5 {
                                if "\(values[i] ?? 0)" == "\(num[i])" {
                                    output += 1
                                }
                            }
                            if output > 5 {
                                gameEnd = 1
                            } else {
                                gameEnd = 2
                            }
                        } label: {
                            Text("Check Number")
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
                    } else {
                        NumberAnimation(finalNum: $num)
                            .foregroundColor(.white)
                        Button {
                            ready.toggle()
                        } label: {
                            Text("I'm Ready")
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
                } else if gameEnd == 1 {
                    Text("Oh wait you actually won!")
                        .foregroundColor(.white)
                } else {
                    Text("You lost lmao")
                        .foregroundColor(.white)
                    Button {
                        gameEnd = 0
                        ready = false
                        num = generateNum(digits: 6)
                        values = [nil, nil, nil, nil, nil, nil]
                        focusing = .first
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
            } .frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct MemorizeIt_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeIt()
    }
}

enum NumberBoxFocus: Hashable {
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
}
