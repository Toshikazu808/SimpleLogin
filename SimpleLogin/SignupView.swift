//
//  SignupView.swift
//  SimpleLogin
//
//  Created by Ryan Kanno on 5/9/21.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
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
            .overlay(Circle().stroke(overlayColor, lineWidth: 3))
         
         VStack {
            TextField("Email", text: $email)
               .padding()
               .background(Color(.secondarySystemBackground))
               .autocapitalization(.none)
               .disableAutocorrection(true)
            
            SecureField("Password", text: $password)
               .padding()
               .background(Color(.secondarySystemBackground))
               .autocapitalization(.none)
               .disableAutocorrection(true)
            
            Button(action: {
               guard !email.isEmpty, !password.isEmpty else { return }
               viewModel.signUp(email: email, password: password)
            }) {
               Text("Create account")
                  .foregroundColor(Color.white)
                  .frame(width: 200, height: 50)
                  .cornerRadius(8)
                  .background(buttonColor)
            }
         } //: VSTACK
         .padding()
         Spacer()
      } //: VSTACK
      .navigationTitle("Create account")
   } //: BODY
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
