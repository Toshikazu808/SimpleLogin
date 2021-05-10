//
//  SimpleLoginApp.swift
//  SimpleLogin
//
//  Created by Ryan Kanno on 5/9/21.
//

import SwiftUI
 import Firebase

@main
struct SimpleLoginApp: App {
   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   
    var body: some Scene {
      let viewModel = AppViewModel()
      ContentView()
         .environmentObject(viewModel)
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
   }
}
