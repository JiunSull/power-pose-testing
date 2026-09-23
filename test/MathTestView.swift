import SwiftUI
/*
struct MathTestView: View {
    @State private var currentQuestionIndex = 0
    @State private var questions = [
        MathQuestion(question: "23 + 56", answers: ["69", "71", "79", "85"], correctAnswerIndex: 2),
            MathQuestion(question: "98 - 42", answers: ["56", "52", "46", "64"], correctAnswerIndex: 0),
            MathQuestion(question: "82 + 17", answers: ["89", "95", "99", "101"], correctAnswerIndex: 2),
            MathQuestion(question: "74 - 28", answers: ["36", "42", "52", "46"], correctAnswerIndex: 3),
            MathQuestion(question: "56 + 38", answers: ["94", "92", "100", "104"], correctAnswerIndex: 0),
            MathQuestion(question: "99 - 45", answers: ["44", "54", "64", "74"], correctAnswerIndex: 1),
            MathQuestion(question: "61 + 29", answers: ["80", "88", "90", "100"], correctAnswerIndex: 2),
            MathQuestion(question: "87 - 53", answers: ["34", "38", "44", "48"], correctAnswerIndex: 0),
        
    ]
    @State private var score = 0
    @State private var isTestFinished = false

    var body: some View {
        VStack {
            if !isTestFinished {
                Text("Score: \(score)")
                    .padding()

                Text(questions[currentQuestionIndex].question)
                    .font(.title)
                    .padding()

                ForEach(0..<questions[currentQuestionIndex].answers.count, id: \.self) { index in
                    Button(action: {
                        answerTapped(index)
                    }) {
                        Text(questions[currentQuestionIndex].answers[index])
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.vertical, 5)
                }
            } else {
                Text("Test Finished!")
                    .font(.title)
                    .padding()
                Text("Final Score: \(score)")
                    .padding()
            }
        }
    }

    func answerTapped(_ index: Int) {
        if index == questions[currentQuestionIndex].correctAnswerIndex {
            score += 1
        }
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            finishTest()
        }
    }

    func finishTest() {
        isTestFinished = true
    }
}
*/
struct MathQuestion {
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
}




struct MathTestView: View {
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
    
    @State private var currentQuestionIndex = 0
    @State private var questions = [
        MathQuestion(question: "87 + 13", answers: ["100", "102", "108", "98"], correctAnswerIndex: 0),
        MathQuestion(question: "82 - 15", answers: ["67", "64", "61", "59"], correctAnswerIndex: 0),
        MathQuestion(question: "82 + 15", answers: ["84", "94", "97", "99"], correctAnswerIndex: 2),
        MathQuestion(question: "8 * 9", answers: ["72", "63", "81", "54"], correctAnswerIndex: 0),
        MathQuestion(question: "13 + 24", answers: ["34", "37", "39", "42"], correctAnswerIndex: 1),
        MathQuestion(question: "45 - 12", answers: ["34", "32", "33", "35"], correctAnswerIndex: 2),
        MathQuestion(question: "12 * 12", answers: ["138", "121", "134", "144"], correctAnswerIndex: 3),
        MathQuestion(question: "11 * 11", answers: ["121", "122", "111", "123"], correctAnswerIndex: 0),
        MathQuestion(question: "7 * 4", answers: ["32", "26", "24", "28"], correctAnswerIndex: 3),
        MathQuestion(question: "56 ÷ 7", answers: ["6", "7", "9", "8"], correctAnswerIndex: 3),
        MathQuestion(question: "63 ÷ 9", answers: ["7", "8", "6", "9"], correctAnswerIndex: 0),
        MathQuestion(question: "9 * 9", answers: ["81", "72", "63", "90"], correctAnswerIndex: 0),
        MathQuestion(question: "8 * 4", answers: ["24", "32", "40", "34"], correctAnswerIndex: 1),
        MathQuestion(question: "55 ÷ 5", answers: ["11", "10", "9", "12"], correctAnswerIndex: 0),
        MathQuestion(question: "64 ÷ 8", answers: ["6", "9", "7", "8"], correctAnswerIndex: 3),
        MathQuestion(question: "21 ÷ 7", answers: ["3", "2", "4", "5"], correctAnswerIndex: 0),
        MathQuestion(question: "35 ÷ 7", answers: ["5", "4", "6", "7"], correctAnswerIndex: 0),

        MathQuestion(question: "63 - 8", answers: ["57", "56", "55", "54"], correctAnswerIndex: 2),
        MathQuestion(question: "34 - 5", answers: ["30", "29", "28", "27"], correctAnswerIndex: 1),
        MathQuestion(question: "92 - 9", answers: ["84", "82", "83", "85"], correctAnswerIndex: 2),
        MathQuestion(question: "14 - 4", answers: ["10", "9", "11", "12"], correctAnswerIndex: 0),
        MathQuestion(question: "25 - 7", answers: ["18", "19", "12", "15"], correctAnswerIndex: 0),
        MathQuestion(question: "56 - 7", answers: ["46", "47", "48", "49"], correctAnswerIndex: 3),
        MathQuestion(question: "48 - 4", answers: ["44", "42", "43", "45"], correctAnswerIndex: 0),
        MathQuestion(question: "38 - 6", answers: ["32", "33", "34", "35"], correctAnswerIndex: 0),
        MathQuestion(question: "54 ÷ 6", answers: ["6", "9", "7", "8"], correctAnswerIndex: 1),
        MathQuestion(question: "12 ÷ 4", answers: ["5", "3", "2", "4"], correctAnswerIndex: 1),
        MathQuestion(question: "26 ÷ 2", answers: ["12", "14", "13", "15"], correctAnswerIndex: 2),
        MathQuestion(question: "36 ÷ 6", answers: ["5", "7", "6", "8"], correctAnswerIndex: 2),
        MathQuestion(question: "66 ÷ 6", answers: ["9", "10", "12", "11"], correctAnswerIndex: 3),
        MathQuestion(question: "49 ÷ 7", answers: ["6", "8", "9", "7"], correctAnswerIndex: 3),
        MathQuestion(question: "30 ÷ 5", answers: ["6", "4", "5", "7"], correctAnswerIndex: 0),
        MathQuestion(question: "27 ÷ 3", answers: ["9", "7", "6", "8"], correctAnswerIndex: 0),
        MathQuestion(question: "40 ÷ 8", answers: ["5", "6", "4", "8"], correctAnswerIndex: 0),
        MathQuestion(question: "81 ÷ 9", answers: ["6", "9", "7", "8"], correctAnswerIndex: 1),
        MathQuestion(question: "16 ÷ 8", answers: ["5", "4", "2", "3"], correctAnswerIndex: 2),
        MathQuestion(question: "22 ÷ 11", answers: ["4", "3", "2", "5"], correctAnswerIndex: 2),
        MathQuestion(question: "45 ÷ 9", answers: ["3", "2", "4", "5"], correctAnswerIndex: 3),
        MathQuestion(question: "14 + 9", answers: ["27", "24", "21", "23"], correctAnswerIndex: 3),
        MathQuestion(question: "56 + 7", answers: ["63", "67", "69", "58"], correctAnswerIndex: 0),
        MathQuestion(question: "77 + 7", answers: ["84", "87", "89", "81"], correctAnswerIndex: 0),
        MathQuestion(question: "12 + 5", answers: ["14", "16", "15", "17"], correctAnswerIndex: 3),
        MathQuestion(question: "18 + 4", answers: ["24", "26", "22", "17"], correctAnswerIndex: 2),
        MathQuestion(question: "90 + 11", answers: ["101", "111", "105", "107"], correctAnswerIndex: 0),
        MathQuestion(question: "67 + 5", answers: ["71", "70", "72", "75"], correctAnswerIndex: 2),
        MathQuestion(question: "72 + 9", answers: ["84", "81", "83", "87"], correctAnswerIndex: 1),
        MathQuestion(question: "22 + 5", answers: ["24", "27", "25", "26"], correctAnswerIndex: 1),
        MathQuestion(question: "12 * 5", answers: ["50", "60", "45", "75"], correctAnswerIndex: 1),
        MathQuestion(question: "11 * 4", answers: ["33", "44", "40", "42"], correctAnswerIndex: 1),
        MathQuestion(question: "8 * 3", answers: ["27", "26", "25", "24"], correctAnswerIndex: 3),
        MathQuestion(question: "32 + 9", answers: ["39", "42", "40", "41"], correctAnswerIndex: 3),
     
 ]
    @State private var selectedAnswerIndex: Int?
    
        @State private var score = 0
        @State private var isTestFinished = false
        @State private var timeRemaining = 45 // 60 seconds for the entire test
        @State private var timer: Timer?
    @State private var shouldNavigate = false
    @State private var shouldNavigate2 = false

        var body: some View {
            ZStack {

                        Image("MathTestBackground1")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                        Image("WhiteBackground 1")
                            .resizable()
                            .frame(width: 400, height: 480)
                VStack {
                    if !isTestFinished {
                        Text("Score: \(score)")
                            .padding()
                        
                        Text(questions[currentQuestionIndex].question)
                            .font(.title)
                            .padding()
                        
                        ForEach(0..<questions[currentQuestionIndex].answers.count, id: \.self) { index in
                            Button(action: {
                                selectedAnswerIndex = index
                                checkAnswer()
                            }) {
                                Text(questions[currentQuestionIndex].answers[index])
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.vertical, 5)
                            .disabled(selectedAnswerIndex != nil)
                        }
                        
                        Text("Time remaining: \(timeRemaining)")
                    } else {
                        Text("Test Finished!")
                            .font(.title)
                            .padding()
                        Text("Final Score: \(score)")
                            .padding()
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
                            MathTestPowerPoseView(name: name, firstScore: String(score), reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, number: number, number2: number2,  reactionPP: reactionPP, memoryPP: memoryPP, numberPP: numberPP, mathPP: "High Power Pose", isHighPowerPose: true)
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
                            MathTestPowerPoseView(name: name, firstScore: String(score), reaction: reaction, reaction2: reaction2, memory: memory, memory2: memory2, number: number, number2: number2,  reactionPP: reactionPP, memoryPP: memoryPP, numberPP: numberPP, mathPP: "Low Power Pose", isHighPowerPose: false)
                        })
                    }}
                }
                
                .padding()
                .onAppear {
                    startTest()
                }
                .onDisappear {
                    timer?.invalidate()
                    timer = nil
                }
            
        }

        func startTest() {
            questions.shuffle() // Shuffle the questions array
            currentQuestionIndex = 0
            score = 0
            isTestFinished = false
            timeRemaining = 45 // Reset timer
            selectedAnswerIndex = nil
            startTimer()
        }

        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    finishTest()
                }
            }
        }

        func checkAnswer() {
            if let selectedAnswerIndex = selectedAnswerIndex {
                if selectedAnswerIndex == questions[currentQuestionIndex].correctAnswerIndex {
                    score += 1
                }
            }
            nextQuestion()
        }

        func nextQuestion() {
            selectedAnswerIndex = nil
            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
            } else {
                finishTest()
            }
        }

        func finishTest() {
            isTestFinished = true
            timer?.invalidate() // Stop the timer
        }
    }

#Preview {
    MainMenuView()
}
