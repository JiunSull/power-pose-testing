//
//  MathTestMenuView.swift
//  test
//
//  Created by Jiun Sull on 6/11/24.
//

import SwiftUI

struct MathTestMenuView: View {
    var name: String
    var reaction: String
    var reaction2: String
    var memory: String
    var memory2: String
    var number: String
    var number2: String
    var reactionPP: String
    var memoryPP: String
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
                Text("Math Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("You will be given 60 seconds to complete as many mental math problems as you can. There will be a variety of addition, subtraction, multiplication, and division problems.")
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
                    Text("Start Practice Math Test")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 400)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigate, content: {
                    MathPractice(name: name, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, number: number, number2: number2,  reactionPP: reactionPP, memoryPP: memoryPP, numberPP: numberPP)
                })
            }
            .navigationTitle("Math Test Menu")
            .navigationBarTitleDisplayMode(.inline)
        }}
}

#Preview {
    MathTestMenuView(name: "", reaction: "", reaction2: "", memory: "", memory2: "", number: "", number2: "", reactionPP: "", memoryPP: "", numberPP: "")
}
