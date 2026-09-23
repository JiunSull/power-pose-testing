//
//  NumberPractice.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI


struct NumberTestView2: View {
    var name: String
    var firstScore: String
    var math: String
    var math2: String
    var reaction: String
    var reaction2: String
    var memory: String
    var memory2: String
    var mathPP: String
    var reactionPP: String
    var memoryPP: String
    var numberPP: String
    @State private var numbers = Array(1...30)
    @State private var positions = [CGPoint](repeating: .zero, count: 30)
    @State private var currentNumber = 1
    @State private var startTime: Date?
    @State private var endTime: Date?
    @State private var showCongratulations = false
    @State private var shouldNavigate = false

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            if showCongratulations {
                VStack {
                    Text("Test Completed!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    if let startTime = startTime, let endTime = endTime {
                        Text("Time taken: \(endTime.timeIntervalSince(startTime), specifier: "%.2f") seconds")
                            .font(.title)
                            .padding()
                        Button(action: {
                            shouldNavigate = true
                        }) {
                            Text("Continue")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $shouldNavigate, content: {
                            TestView(name: name, math: math, math2: math2, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, number: firstScore + " sec", number2: String(format: "%.2f", endTime.timeIntervalSince(startTime)) + " sec", mathPP: mathPP, reactionPP: reactionPP, memoryPP: memoryPP, numberPP: numberPP)
                        })
                    }
                                    }
            } else {
                ForEach(numbers, id: \.self) { number in
                    NumberView2(number: number, position: positions[number - 1], currentNumber: $currentNumber, showCongratulations: $showCongratulations, startTime: $startTime, endTime: $endTime, numbers: $numbers)
                }
            }
        }
        .onAppear {
                    generatePositions()
                    startTime = Date()
                }
    }

    func generatePositions() {
        var tempPositions = [CGPoint]()
        for _ in 1...30 {
            var position: CGPoint
            repeat {
                position = randomPosition()
            } while tempPositions.contains(where: { distance(from: $0, to: position) < 50 })
            tempPositions.append(position)
        }
        positions = tempPositions
    }

    func randomPosition() -> CGPoint {
        let x = CGFloat.random(in: 50...(screenWidth - 50))
        let y = CGFloat.random(in: 50...(screenHeight - 100))
        return CGPoint(x: x, y: y)
    }

    func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
    }
}

#Preview {
    MainMenuView()
}
