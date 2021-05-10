//
//  SigninView.swift
//  SimpleLogin
//
//  Created by Ryan Kanno on 5/9/21.
//

import SwiftUI
import FirebaseAuth

struct SigninView: View {
   @State var email = ""
   @State var password = ""
   @EnvironmentObject var viewModel: AppViewModel
   
   var body: some View {
      VStack {
         Spacer()
         Image ("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(accentColors, lineWidth: 3))
         
         VStack {
            TextField("Email", text: $email)
               .padding()
               .background(Color(.secondarySystemBackground))
               .autocapitalization(.none)
               .disableAutocorrection(true)
               .padding(5)
            
            SecureField("Password", text: $password)
               .padding()
               .background(Color(.secondarySystemBackground))
               .autocapitalization(.none)
               .disableAutocorrection(true)
               .padding(5)
            
            Button(action: {
               guard !email.isEmpty, !password.isEmpty else { return }
               viewModel.signIn(email: email, password: password)
            }) {
               Text("Sign in")
                  .foregroundColor(Color.white)
                  .frame(width: 200, height: 50)
                  .background(buttonColor)
                  .cornerRadius(40)                  
            }
            .padding()
            
            NavigationLink("Create account", destination: SignupView())
               .foregroundColor(Color.white)
               .frame(width: 200, height: 50)
               .background(buttonColor)
               .cornerRadius(40)
               
         } //: VSTACK
         .padding()
         Spacer()
      } //: VSTACK
      .navigationTitle("Sign in")
   } //: BODY
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
