//
//  ReactionTimeTestPowerPose.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI

struct ReactionTimeTestPowerPose: View {
    var name: String
    var firstScore: String
    var math: String
    var math2: String
    var memory: String
    var memory2: String
    var number: String
    var number2: String
    var mathPP: String
    var memoryPP: String
    var numberPP: String
    var isHighPowerPose: Bool
    @State private var shouldNavigate = false
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    

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
                ReactionTimeTest2(name: name, firstScore: firstScore, math: math, math2: math2, memory: memory, memory2: memory2, number: number, number2: number2, mathPP: mathPP, memoryPP: memoryPP, numberPP: numberPP, reactionPP: (isHighPowerPose ? "High Power Pose" : "Low Power Pose"))
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
#Preview {
    MainMenuView()
}
