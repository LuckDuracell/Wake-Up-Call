//
//  NumberAnimation.swift
//  Wake Up Call
//
//  Created by Luke Drushell on 7/15/22.
//

import SwiftUI

struct NumberAnimation: View {
    
    @State var num: [String] = ["*", "*", "*", "*", "*", "*"]
    @Binding var finalNum: [String]
    
    var body: some View {
        Text(num.joined())
            .font(.largeTitle.bold())
            .shadow(radius: 2, x: 2, y: 2)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    num[0] = finalNum[0]
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                    num[1] = finalNum[1]
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9, execute: {
                    num[2] = finalNum[2]
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
                    num[3] = finalNum[3]
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    num[4] = finalNum[4]
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8, execute: {
                    num[5] = finalNum[5]
                })
            })
    }
}

struct NumberAnimation_Previews: PreviewProvider {
    static var previews: some View {
        NumberAnimation(finalNum: .constant(generateNum(digits: 6)))
    }
}
