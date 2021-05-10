//
//  MainView.swift
//  SimpleLogin
//
//  Created by Ryan Kanno on 5/10/21.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
   @EnvironmentObject var viewModel: AppViewModel
   
   var body: some View {
      VStack {
         Text("You are signed in")
            .padding()
         
         Button(action: {viewModel.signOut()}) {
            Text("Sign out")
               .foregroundColor(Color.white)
               .frame(width: 200, height: 50)
               .background(buttonColor)
               .cornerRadius(40)
         }
      }
   }
}

struct MainView_Previews: PreviewProvider {
   static var previews: some View {
      MainView()
   }
}
