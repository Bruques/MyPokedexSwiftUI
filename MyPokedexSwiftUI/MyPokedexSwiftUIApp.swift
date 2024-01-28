//
//  MyPokedexSwiftUIApp.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 27/01/24.
//

import SwiftUI

@main
struct MyPokedexSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
    }
}
