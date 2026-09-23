/*//
 //  MainMenuView.swift
 //  test
 //
 //  Created by Jiun Sull on 6/11/24.
 //
 import SwiftUI
 struct MainMenuView: View {
 @State private var name: String = ""
 @State private var isNameEmptyAlertPresented = false
 
 
 var body: some View {
 NavigationView {
 VStack {
 Text("Welcome to the App")
 .font(.largeTitle)
 .padding(.bottom, 40)
 
 TextField("Enter your name", text: $name)
 .textFieldStyle(RoundedBorderTextFieldStyle())
 .padding()
 
 NavigationLink(
 destination: TestView(name: name),
 label: {
 Text("Begin Test")
 .font(.headline)
 .padding()
 .frame(maxWidth: .infinity)
 .background(Color.blue)
 .foregroundColor(.white)
 .cornerRadius(10)
 }
 )
 .padding(.top, 20)
 .opacity(name.isEmpty ? 0.5 : 1.0)
 .disabled(name.isEmpty)
 Spacer()
 }
 .padding()
 
 }
 .alert(isPresented: $isNameEmptyAlertPresented) {
 Alert(title: Text("Error"), message: Text("Please enter your name"), dismissButton: .default(Text("OK")))
 }
 .onChange(of: name) {
 isNameEmptyAlertPresented = name.isEmpty
 }
 }
 }
 */
import SwiftUI
struct MainMenuView: View {
    @State private var name: String = ""
    @State private var isNameEmptyAlertPresented = false
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("powerpose3")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Welcome to the Power Pose Testing App")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(.leading,50)
                        .padding(.trailing, 50)
                        .padding(.bottom, 250.0)
                    
                    TextField("Enter your name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        if name.isEmpty {
                            isNameEmptyAlertPresented = true
                        } else {
                            shouldNavigate = true
                        }
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    .disabled(name.isEmpty)
                    .fullScreenCover(isPresented: $shouldNavigate, content: {
                        TestView(name: name, math: "N/A", math2: "N/A", reaction: "N/A", reaction2: "N/A", memory: "N/A", memory2: "N/A", number: "N/A", number2: "N/A", mathPP: "", reactionPP: "", memoryPP: "", numberPP: "")
                    })
                    
                    Spacer()
                }
                .padding()
                
            }
            .alert(isPresented: $isNameEmptyAlertPresented) {
                Alert(title: Text("Error"), message: Text("Please enter your name"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

//
//  MainMenuView.swift
//  test
//
//  Created by Jiun Sull on 6/11/24.
//
/*import SwiftUI
 struct MainMenuView: View {
 @State private var name: String = ""
 @State private var showError: Bool = false
 
 var body: some View {
 NavigationView {
 VStack {
 Text("Welcome to the App")
 .font(.largeTitle)
 .padding(.bottom, 40)
 
 TextField("Enter your name", text: $name)
 .textFieldStyle(RoundedBorderTextFieldStyle())
 .padding()
 
 Button(action: {
 if name.isEmpty {
 showError = true
 } else {
 // Navigate to TestView
 if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
 let window = windowScene.windows.first {
 window.rootViewController = UIHostingController(rootView: TestView(name: name))
 window.makeKeyAndVisible()
 }
 }
 }) {
 Text("Begin Test")
 .font(.headline)
 .padding()
 .frame(maxWidth: .infinity)
 .background(Color.blue)
 .foregroundColor(.white)
 .cornerRadius(10)
 }
 .padding(.top, 20)
 .alert(isPresented: $showError) {
 Alert(title: Text("Error"), message: Text("Please enter your name"), dismissButton: .default(Text("OK")))
 }
 
 Spacer()
 }
 .padding()
 .navigationTitle("Main Menu")
 }
 }
 }
 

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
*/
