//
//  SplashView.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 28/01/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("AzulBackground")
            Image("pokedexLogo")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
