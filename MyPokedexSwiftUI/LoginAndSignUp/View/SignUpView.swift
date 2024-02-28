//
//  SignUpView.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 25/02/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    var body: some View {
        VStack {
            trainerImage
            titleAndDescription
            Spacer().frame(height: 32)
            signUpButtons
        }
        .frame(maxWidth: .infinity, 
               maxHeight: .infinity,
               alignment: .bottom)
        .padding(.bottom)
        .navigationBarBackButtonHidden()
        .modifier(MyCustomToolbar(title: "Criar conta"))
    }
    
    var trainerImage: some View {
        Image("trainer6")
    }
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Falta pouco para explorar esse mundo!")
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
            Text("Como deseja se conectar?")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.secondary)
        }
    }
    
    var signUpButtons: some View {
        VStack(spacing: 12) {
            signUpAppleButton
            signUpGoogleButton
            signUpFirebaseButton
        }
        .padding(.horizontal)
    }
    
    var signUpAppleButton: some View {
        NavigationLink {
            //LoginApple
        } label: {
            Capsule()
                .stroke(PokedexColors.lightGray, lineWidth: 2)
                .frame(height: 58)
                .overlay {
                    HStack(spacing: 16) {
                        Image("appleVector")
                        Text("Continuar com a Apple")
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(PokedexColors.gray700)
                    }
                }
        }
    }
    
    var signUpGoogleButton: some View {
        NavigationLink {
            //Login google
        } label: {
            Capsule()
                .stroke(PokedexColors.lightGray, lineWidth: 2)
                .frame(height: 58)
                .overlay {
                    HStack(spacing: 16) {
                        Image("googleVector")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Continuar com o Google")
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(PokedexColors.gray700)
                    }
                }
        }
    }
    
    var signUpFirebaseButton: some View {
        NavigationLink {
            // Login firebase
            SignUpEmailView(viewModel: self.viewModel)
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(PokedexColors.blue)
                .overlay {
                    Text("Continuar com um e-mail")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    SignUpView()
}
