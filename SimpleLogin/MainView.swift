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
               .padding()
               .foregroundColor(Color.white)
               .background(buttonColor)
               .padding()
         }
      }
   }
}

struct MainView_Previews: PreviewProvider {
   static var previews: some View {
      MainView()
   }
}
