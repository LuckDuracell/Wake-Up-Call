//
//  PopTheLock.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/17/22.
//

import SwiftUI

struct PopTheLock: View {
    
    @State var spinning = false
    @State var rot: Double = 0
    @State var intendedRot: Double = 180
    let timer = Timer.publish(every: 0.08, on: .main, in: .common).autoconnect()
    @State var points = 10
    @State var forwards = true
    
    
    var body: some View {
        if points <= 0 {
            ZStack {
                Color.green.edgesIgnoringSafeArea(.all)
                Text("You win congrats now get out of bed loser")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .padding()
            }
        } else {
            VStack {
                Text("\(points)")
                    .foregroundColor(.indigo)
                    .font(.title.bold())
                    .padding()
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.clear)
                        .overlay(alignment: .top, content: {
                            Circle()
                                .frame(width: 22, height: 22, alignment: .center)
                                .padding(.top, -18)
                                .foregroundColor(.green)
                        })
                        .rotationEffect(Angle(degrees: intendedRot))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.pink)
                        .overlay(alignment: .top, content: {
                            Rectangle()
                                .frame(width: 10, height: 20, alignment: .center)
                                .padding(.top, -15)
                                .foregroundColor(.yellow)
                        })
                        .rotationEffect(Angle(degrees: rot))
                } .onReceive(timer) { time in
                    if spinning {
                        if rot == 360 {
                            rot = 0
                        }
                        if rot < 0 {
                            rot = 360 + (rot)
                        }
                        withAnimation {
                            if forwards {
                                rot += 10
                            } else {
                                rot -= 10
                            }
                        }
                    }
                }
                
                Button {
                    if spinning {
                        if forwards {
                            if ((intendedRot + 65) >= rot) && (rot >= (intendedRot)) {
                                points -= 1
                                intendedRot = Double(Int.random(in: 2...34) * 10)
                                forwards.toggle()
                            } else {
                                spinning = false
                                points = 10
                                rot = 0
                                intendedRot = 180
                            }
                        } else {
                            if ((intendedRot) >= rot) && (rot >= (intendedRot - 65)) {
                                points -= 1
                                intendedRot = Double(Int.random(in: 2...34) * 10)
                                forwards.toggle()
                            } else {
                                spinning = false
                                points = 10
                                rot = 0
                                intendedRot = 180
                            }
                        }
                    } else {
                        spinning = true
                    }
                } label: {
                    Text(spinning ? "Tap Me" : "Start Game")
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
                } .padding(20)
            }
        }
    }
}

struct PopTheLock_Previews: PreviewProvider {
    static var previews: some View {
        PopTheLock()
    }
}
