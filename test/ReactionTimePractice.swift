//
//  ReactionTimePractice.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI


struct ReactionTimePractice: View {
    var name: String
    var math: String
    var math2: String
    var memory: String
    var memory2: String
    var number: String
    var number2: String
    var mathPP: String
    var memoryPP: String
    var numberPP: String
    @State private var circleVisible = false
    @State private var startTime: Date?
    @State private var reactionTimes: [Double] = []
    @State private var message = "Wait for the circle to appear..."
    @State private var testCount = 0
    @State private var showCompletionScreen = false
    @State private var shouldNavigate = false

    var body: some View {
        VStack {
            if showCompletionScreen {
                Text("Test Completed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("Average Reaction Time: \(averageReactionTime(), specifier: "%.3f") seconds")
                    .padding()
                Button(action: {
                    shouldNavigate = true
                }) {
                    Text("Start Real Test")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigate, content: {
                    ReactionTimeTest(name: name, math: math, math2: math2, memory: memory, memory2: memory2, number: number, number2: number2, mathPP: mathPP, memoryPP: memoryPP, numberPP: numberPP)
                })
            } else {
                Text("Reaction Time Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
                
                if circleVisible {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            recordReactionTime()
                        }
                }
                
                Spacer()
                
                Text(message)
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Text("Test \(testCount) / 5")
                    .padding()
            }
        }
        .padding()
        .onAppear(perform: startTest)
        .navigationBarBackButtonHidden(true) // Hide the back button
    }

    func startTest() {
        reactionTimes = []
        message = "Wait for the circle to appear..."
        startNextRound()
    }
    
    func startNextRound() {
        if testCount < 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 2...5)) {
                self.showCircle()
            }
        } else {
            finishTest()
        }
    }

    func showCircle() {
        startTime = Date()
        circleVisible = true
    }
    
    func recordReactionTime() {
        if let startTime = startTime {
            let reactionTime = Date().timeIntervalSince(startTime) // measure in seconds
            reactionTimes.append(reactionTime)
            circleVisible = false
            testCount += 1
            message = "Wait for the circle to appear..."
            startNextRound()
        }
    }
    
    func finishTest() {
        showCompletionScreen = true
    }

    func averageReactionTime() -> Double {
        if reactionTimes.isEmpty {
            return 0
        }
        let total = reactionTimes.reduce(0, +)
        return total / Double(reactionTimes.count)
    }
}


#Preview {
    MainMenuView()
}
