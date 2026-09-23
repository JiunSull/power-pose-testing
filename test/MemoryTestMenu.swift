//
//  MemoryTestMenu.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI

struct MemoryTestMenu: View {
    var name: String
    var math: String
    var math2: String
    var reaction: String
    var reaction2: String
    var number: String
    var number2: String
    var mathPP: String
    var reactionPP: String
    var numberPP: String
    @State private var showMathTestMenu = false
    @State private var shouldNavigate = false
    var body: some View {
        ZStack {
            Image("black4")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Memory Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("You will have 30 seconds to memorize 40 words. After the 30 seconds, a word will appear and you will have to determine whether or not it was in the original list of 40 words.")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(30.0)
                    .frame(width: 450.0)
                
                Text("You will be doing 3 of the same tests. The first is a practice test where you can get use to the format. The next test will be a real test. Then you will do either a high power or low power pose before doing the last test.")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .lineLimit(nil)
                    .padding(30.0)
                    .frame(width: 450.0)
                
                Spacer()
                    .frame(height: 100.0)
                
                Text("Click the Button Below to Start")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                
                Spacer()
                    .frame(height: 100.0)
                
                Button(action: {
                    shouldNavigate = true
                }) {
                    Text("Start Memory Test")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 400)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigate, content: {
                    MemoryTestPractice(name: name, math: math, math2: math2, reaction: reaction, reaction2: reaction2, number: number, number2: number2, mathPP: mathPP, reactionPP: reactionPP, numberPP: numberPP)
                })
            }
            
        }}
}
#Preview {
    MemoryTestMenu(name: "", math: "", math2: "", reaction: "", reaction2: "", number: "", number2: "", mathPP: "", reactionPP: "", numberPP: "")
}
