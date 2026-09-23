//
//  TestView.swift
//  test
//
//  Created by Jiun Sull on 6/11/24.
//

import SwiftUI

struct TestView: View {
    var name: String
    var math: String
    var math2: String
    var reaction: String
    var reaction2: String
    var memory: String
    var memory2: String
    var number: String
    var number2: String
    var mathPP: String
    var reactionPP: String
    var memoryPP: String
    var numberPP: String
    
    @State private var shouldNavigateMath = false
    @State private var shouldNavigateReaction = false
    @State private var shouldNavigateMemory = false
    @State private var shouldNavigateNumber = false
    
    var body: some View {
        ZStack {
            Image("black4")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Hello, \(name)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, -50)
                
                Text("Select your test below")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10)
                
                
                
                
                
                
                
                
                
                Button(action: {
                    shouldNavigateMath = true
                }) {
                    Text("Math Test")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigateMath, content: {
                    MathTestMenuView(name: name, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, number: number, number2: number2, reactionPP: reactionPP, memoryPP: memoryPP, numberPP: numberPP)
                })
                
                Text(mathPP)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Math Score Before: " + math)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Math Score After: " + math2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                
                Button(action: {
                    shouldNavigateReaction = true
                }) {
                    Text("Reaction Time Test")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigateReaction, content: {
                    ReactionTimeTestMenuView(name: name, math: math, math2: math2, memory: memory, memory2: memory2, number: number, number2: number2, mathPP: mathPP, memoryPP: memoryPP, numberPP: numberPP)
                })
                
                Text(reactionPP)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Reaction Time Before: " + reaction)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Reaction Time After: " + reaction2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Button(action: {
                    shouldNavigateMemory = true
                }) {
                    Text("Memory Test")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigateMemory, content: {
                    MemoryTestMenu(name: name, math: math, math2: math2, reaction: reaction, reaction2: reaction2, number: number, number2: number2, mathPP: mathPP, reactionPP: reactionPP, numberPP: numberPP)
                })
                
                Text(memoryPP)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Memory Score Before: " + memory)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Memory Score After: " + memory2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Button(action: {
                    shouldNavigateNumber = true
                }) {
                    Text("Number Test")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigateNumber, content: {
                    NumberTestMenu(name: name, math: math, math2: math2, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, mathPP: mathPP, reactionPP: reactionPP, memoryPP: memoryPP)
                })
                
                Text(numberPP)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Number Test Time Before: " + number)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Number Test Time After: " + number2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .padding()
            .navigationTitle("Test Screen")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}
/*struct TestView: View {
 var name: String
 @State private var showMathTestMenu = false
 
 var body: some View {
 VStack {
 Text("Hello, \(name)!")
 .font(.largeTitle)
 .padding()
 
 Text("This is the test screen.")
 
 
 
 
 Spacer()
 
 NavigationLink(destination: MathTestMenuView()) {
 Text("Next")
 .font(.headline)
 .padding()
 .frame(maxWidth: .infinity)
 .background(Color.blue)
 .foregroundColor(.white)
 .cornerRadius(10)
 }
 .padding()
 
 
 
 
 }
 .padding()
 .navigationTitle("Test Screen")
 .navigationBarTitleDisplayMode(.inline)
 
 }
 
 
 }
 */


#Preview {
    MainMenuView()
}
