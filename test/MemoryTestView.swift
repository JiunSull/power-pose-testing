//
//  MemoryTestView.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI

struct MemoryTestView: View {
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
    @State private var memorizing = true
    @State private var originalWords: [String] = []
    @State private var currentWord: String = ""
    @State private var score = 0
    @State private var wordsGuessed = 0
    @State private var showResult = false
    @State private var timeRemaining = 30
    @State private var shouldNavigate = false
    @State private var shouldNavigate2 = false

    let totalWordsToGuess = 20
    let wordPool = Array(words.shuffled().prefix(40))
    
    var body: some View {
        VStack {
            if memorizing {
                Text("Memorize these words:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                ForEach(0..<20) { rowIndex in
                                HStack {
                                    ForEach(0..<2) { colIndex in
                                        Text(self.wordPool[rowIndex + colIndex * 20])
                                            .fontWeight(.semibold)
                                            .padding(.horizontal, 30)
                                    }
                                }
                            }
                
                Text("Time remaining: \(timeRemaining) seconds")
                    .padding()
                
            } else if showResult {
                Text("Test Completed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("Your Score: \(score) out of \(totalWordsToGuess)")
                Button(action: {
                    shouldNavigate = true
                }) {
                    Text("High Power Pose")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigate, content: {
                    MemoryTestPowerPose(name: name, firstScore: String(score), math: math, math2: math2, reaction: reaction, reaction2: reaction2, number: number, number2: number2, mathPP: mathPP, reactionPP: reactionPP, numberPP: numberPP, isHighPowerPose: true)
                })
                Button(action: {
                    shouldNavigate2 = true
                }) {
                    Text("Low Power Pose")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigate2, content: {
                    MemoryTestPowerPose(name: name, firstScore: String(score), math: math, math2: math2, reaction: reaction, reaction2: reaction2, number: number, number2: number2, mathPP: mathPP, reactionPP: reactionPP, numberPP: numberPP, isHighPowerPose: false)
                })
            } else {
                Text("Was this word in the original list?")
                    .font(.title)
                    .padding()
                Text(currentWord)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                HStack {
                    Button("Yes") {
                        checkAnswer(isInOriginalList: true)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("No") {
                        checkAnswer(isInOriginalList: false)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .onAppear(perform: startGame)
    }

    func startGame() {
        originalWords = wordPool
        startMemorizing()
    }

    func startMemorizing() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.memorizing = false
                self.startGuessing()
            }
        }
    }
    
    func startGuessing() {
        wordsGuessed = 0
        score = 0
        presentNextWord()
    }

    func presentNextWord() {
        if wordsGuessed < totalWordsToGuess {
            wordsGuessed += 1
            if Bool.random() {
                currentWord = originalWords.randomElement()!
            } else {
                var newWord: String
                repeat {
                    newWord = words.randomElement()!
                } while originalWords.contains(newWord)
                currentWord = newWord
            }
        } else {
            showResult = true
        }
    }

    func checkAnswer(isInOriginalList: Bool) {
        if (originalWords.contains(currentWord) && isInOriginalList) ||
            (!originalWords.contains(currentWord) && !isInOriginalList) {
            score += 1
        }
        presentNextWord()
    }
}

#Preview {
    MainMenuView()
}
