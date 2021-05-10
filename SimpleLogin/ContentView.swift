//
//  ContentView.swift
//  SimpleLogin
//
//  Created by Ryan Kanno on 5/9/21.
//

import SwiftUI
import FirebaseAuth

let accentColors = Color("AccentColor")
let overlayColor = Color("ColorOverlay")
let buttonColor = Color("ColorButton")

class AppViewModel: ObservableObject {
   let auth = Auth.auth()
   @Published var signedIn = false
   var isSignedIn: Bool { return auth.currentUser != nil }
   
   func signIn(email: String, password: String) {
      auth.signIn(withEmail: email, password: password) { [weak self] result, error in
         guard result != nil, error == nil else { return }
         DispatchQueue.main.async {
            self?.signedIn = true
         }
         
      }
   } //: singIn()
   
   func signUp(email: String, password: String) {
      auth.createUser(withEmail: email, password: password) { [weak self] result, error in
         guard result != nil, error == nil else { return }
         DispatchQueue.main.async {
            self?.signedIn = true
         }
      }
   } //: singUp()
   
   func signOut() {
      try? auth.signOut()
      self.signedIn = false
   } //: signOut()
   
} //: AppViewModel


struct ContentView: View {
   @EnvironmentObject var viewModel: AppViewModel
   
   var body: some View {
      NavigationView {
         if viewModel.isSignedIn {
            VStack {
               Text("You are signed in")
                  .padding()
               
               Button(action: {viewModel.signOut()}) {
                  Text("Sign out")
                     .padding()
                     .foregroundColor(Color.white)
                     .background(buttonColor)
                     .padding()
               }
            }
            .transition(.opacity)
         } else {
            SigninView()
               .transition(.opacity)
         }
      }
      .onAppear {
         viewModel.signedIn = viewModel.isSignedIn
      }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
