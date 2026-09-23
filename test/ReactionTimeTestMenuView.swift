import SwiftUI

struct ReactionTimeTestMenuView: View {
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
    
    @State private var showMathTestMenu = false
    @State private var shouldNavigate = false
    var body: some View {
        ZStack {
            Image("black4")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Reaction Time Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("A blue circle will appear on your screen at random times. Try to tap the blue circle as fast as you can when it appears. It will appear 10 times. Do not spam tap before the blue circle appears. Only tap the screen when it appears.")
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
                    Text("Start Practice Reaction Time Test")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 400)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                
            }
            .padding()
            .fullScreenCover(isPresented: $shouldNavigate, content: {
                ReactionTimePractice(name: name, math: math, math2: math2, memory: memory, memory2: memory2, number: number, number2: number2,  mathPP: mathPP, memoryPP: memoryPP, numberPP: numberPP)
            })
        }
        .navigationTitle("Reaction Test Menu")
        .navigationBarTitleDisplayMode(.inline)
    }}
}

#Preview {
    ReactionTimeTestMenuView(name: "", math: "", math2: "", memory: "", memory2: "", number: "", number2: "", mathPP: "", memoryPP: "", numberPP: "")
}
