//
//  MathTestPowerPoseView.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI

/*struct MathTestPowerPoseView: View {
    var name: String
    @State private var showMathTestMenu = false
    @State private var shouldNavigate = false
    var body: some View {
        VStack {
            Text("Power Pose")
                .font(.largeTitle)
                .padding()
            
            Text("After waiting 1 minute, click start next test")
                .padding()
            
            Spacer()
            
            Button(action: {
                shouldNavigate = true
            }) {
                Text("Next")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .fullScreenCover(isPresented: $shouldNavigate, content: {
                MathTestView(name: name)
            })
        }
    }
}*/

import SwiftUI



struct MathTestPowerPoseView: View {
    var name: String
    var firstScore: String
    var reaction: String
    var reaction2: String
    var memory: String
    var memory2: String
    var number: String
    var number2: String
    var reactionPP: String
    var memoryPP: String
    var numberPP: String
    var mathPP: String
    @State private var shouldNavigate = false
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    var isHighPowerPose: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                Image("PowerPoseBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Power Pose")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.top, 10)
                    
                    Text("You will start the next test in one minute")
                                            .fontWeight(.light)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.top, 16.0)
                    
                    Text("You have been assigned: ")
                                            .fontWeight(.light)
                                            .foregroundColor(Color.white)
                                        
                                            .padding(.top, 16)
                                            .padding(.trailing, 125)
                    
                    
                    
                    Text(isHighPowerPose ? "High Power Pose " : "Low Power Pose ")
                        .fontWeight(.light)
                                                .foregroundColor(Color.yellow)
                                                .padding(.top, -31)
                                                .padding(.leading, 195)
                    
                    
                    Text("Time remaining: \(timeRemaining) seconds")
                        .foregroundColor(Color.red)
                                                .padding(.top, 1)
                    
                    Text("Try to exaggerate the pose")
                                            .fontWeight(.light)
                                            .foregroundColor(Color.white)
                                            .padding(.top, 9)
                    
                    Image(isHighPowerPose ? "pph1" : "ppl1")
                        .resizable()
                                                .frame(width: 140, height: 145)
                                                .padding(.top, 15)
                    
                    Image(isHighPowerPose ? "pph2" : "ppl2")
                        .resizable()
                                                .frame(width: 140, height: 150)
                                                .padding(.top, 10)
                    
                    Image(isHighPowerPose ? "pph3" : "ppl3")
                        .resizable()
                                                .frame(width: 140, height: 160)
                                                .padding(.top, 10)
                    
                    
                    Spacer()
                    
                    // Empty NavigationLink to trigger navigation
                    NavigationLink(value: shouldNavigate) {
                        EmptyView()
                    }
                }}
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                    timer = nil
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    MathTestView2(name: name, firstScore: firstScore, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, number: number, number2: number2, reactionPP: reactionPP, memoryPP: memoryPP, numberPP: numberPP, mathPP: (isHighPowerPose ? "High Power Pose" : "Low Power Pose"))
                        .navigationBarBackButtonHidden(true) // Hide the back button
                }
            }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer?.invalidate()
                shouldNavigate = true
            }
        }
    }
}

/*struct MathTestPowerPoseView: View {
    var name: String
    var firstScore: String
    var reaction: String
    var reaction2: String
    var memory: String
    var memory2: String
    @State private var shouldNavigate = false
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    @State private var isHighPowerPose = Bool.random()

    var body: some View {
        NavigationStack {
            VStack {
                Text(isHighPowerPose ? "High Power Pose" : "Low Power Pose")
                    .font(.largeTitle)
                    .padding()
                
                Text("After waiting 1 minute, you will start the next test.")
                    .padding()
                
                Text("Time remaining: \(timeRemaining) seconds")
                    .padding()
                
                Spacer()
                
                // Empty NavigationLink to trigger navigation
                NavigationLink(destination: MathTestView2(name: name, firstScore: firstScore, reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2), isActive: $shouldNavigate) {
                    EmptyView()
                }
            }
            .onAppear {
                startTimer()
            }
            .onDisappear {
                timer?.invalidate()
                timer = nil
            }
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer?.invalidate()
                shouldNavigate = true
            }
        }
    }
}*/

#Preview {
    MainMenuView()
}
