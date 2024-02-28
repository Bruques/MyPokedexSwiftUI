//
//  LoginOrSignUpView.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 02/02/24.
//

import SwiftUI

struct LoginOrSignUpView: View {
    var body: some View {
        VStack(spacing: 35) {
            jumpButton
            Spacer()
            trainersImage
            titleAndSubtitle
            buttons
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
    
    var jumpButton: some View {
        HStack {
            Text("Pular")
                .font(FontMaker.makeFont(.poppinsMedium, 18))
            Image(systemName: "arrow.right")
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    var trainersImage: some View {
        ZStack {
            Image("trainer4")
                .offset(x: -60)
                .background {
                    Image("shadowTrainer3")
                        .offset(x: -70, y: 100)
                }
                
            Image("trainer5")
                .offset(x: 60, y: -10)
                .background {
                    Image("shadowTrainer3")
                        .offset(x: 60, y: 110)
                }
        }
    }
    
    var titleAndSubtitle: some View {
        VStack(spacing: 16) {
            Text("Está pronto para essa aventura?")
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false , vertical: true)
            Text("Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundStyle(PokedexColors.secondary)
        }
    }
    
    var buttons: some View {
        VStack(spacing: 20) {
            createAccountButton
            loginButton
        }
    }
    
    var createAccountButton: some View {
        NavigationLink {
            SignUpView()
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(PokedexColors.blue)
                .overlay {
                    Text("Criar conta")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }

    }
    
    var loginButton: some View {
        NavigationLink {
            Text("Teste")
        } label: {
            Text("Já tenho uma conta")
                .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                .foregroundStyle(PokedexColors.blue)
        }
    }
}

#Preview {
    LoginOrSignUpView()
}
