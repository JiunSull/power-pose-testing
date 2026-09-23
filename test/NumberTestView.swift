//
//  NumberPractice.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI


struct NumberTestView: View {
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
    @State private var numbers = Array(1...30)
    @State private var positions = [CGPoint](repeating: .zero, count: 30)
    @State private var currentNumber = 1
    @State private var startTime: Date?
    @State private var endTime: Date?
    @State private var showCongratulations = false
    @State private var shouldNavigate = false
    @State private var shouldNavigate2 = false

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
                            Text("High PowerPose")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $shouldNavigate, content: {
                            NumberTestPowerPoseView(name: name, firstScore: String(format: "%.2f", endTime.timeIntervalSince(startTime)), math: math, math2: math2, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, mathPP: mathPP, reactionPP: reactionPP, memoryPP: memoryPP, isHighPowerPose: true)
                        })
                        Button(action: {
                            shouldNavigate2 = true
                        }) {
                            Text("Low PowerPose")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $shouldNavigate2, content: {
                            NumberTestPowerPoseView(name: name, firstScore: String(format: "%.2f", endTime.timeIntervalSince(startTime)), math: math, math2: math2, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, mathPP: mathPP, reactionPP: reactionPP, memoryPP: memoryPP, isHighPowerPose: false)
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

struct NumberView2: View {
    let number: Int
    let position: CGPoint
    @Binding var currentNumber: Int
    @Binding var showCongratulations: Bool
    @Binding var startTime: Date?
    @Binding var endTime: Date?
    @Binding var numbers: [Int]

    var body: some View {
        Text("\(number)")
            .font(.title2)
            .fontWeight(.semibold)
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            .position(position)
            .onTapGesture {
                if number == currentNumber {
                    if number == 30 {
                        endTime = Date()
                        showCongratulations = true
                    }
                    currentNumber += 1
                    numbers.removeAll { $0 == number }
                }
            }
    }
}
#Preview {
    MainMenuView()
}
