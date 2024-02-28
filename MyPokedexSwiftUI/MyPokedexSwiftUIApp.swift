//
//  MyPokedexSwiftUIApp.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 27/01/24.
//

import SwiftUI
import FirebaseCore

@main
struct MyPokedexSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
