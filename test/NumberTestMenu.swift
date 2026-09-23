//
//  NumberTestMenu.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI

struct NumberTestMenu: View {
    var name: String
    var math: String
    var math2: String
    var reaction: String
    var reaction2: String
    var memory: String
    var memory2: String
    var mathPP: String
    var reactionPP: String
    var memoryPP: String
    @State private var showMathTestMenu = false
    @State private var shouldNavigate = false
    var body: some View {
        ZStack {
            Image("black4")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Number Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("Buttons labeled 1 through 30 will appear in random positions on the screen. Try to click each of the buttons in order as fast as you can.")
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
                    Text("Start Number Test")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 400)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                }
            .padding()
            .fullScreenCover(isPresented: $shouldNavigate, content: {
                NumberPractice(name: name, math: math, math2: math2, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, mathPP: mathPP, reactionPP: reactionPP, memoryPP: memoryPP)
            })
        }
        
    }}
}

#Preview {
    MainMenuView()
}
