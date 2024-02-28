//
//  SignUpUsernameView.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 25/02/24.
//

import SwiftUI

struct SignUpUsernameView: View {
    @StateObject var viewModel: SignUpViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        VStack {
            titleAndDescription
            userNameField
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(MyCustomToolbar(title: "Criar conta"))
        
    }
    
    var titleAndDescription: some View {
        VStack {
            Text("Para finalizar")
                .font(FontMaker.makeFont(.poppinsRegular, 26))
                .foregroundStyle(PokedexColors.gray700)
            Text("Qual é o seu nome?")
                .font(FontMaker.makeFont(.poppinsSemiBold, 26))
        }
    }
    
    var userNameField: some View {
        VStack {
            TextField("Nome", text: $viewModel.username)
                .autocorrectionDisabled()
                .focused($isFocused)
                .font(FontMaker.makeFont(.poppinsRegular, 16))
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(isFocused ? PokedexColors.primary : PokedexColors.lightGray)
                        .frame(height: 52)
                }
            
            Text("Esse será seu nome de usuário no app.")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.gray700)
        }
    }
    
    var continueButton: some View {
        Button {
            Task {
                try await self.viewModel.registerUser()
            }
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(viewModel.isUsernameValid ? PokedexColors.blue : PokedexColors.gray100)
                .overlay {
                    Text("Criar conta")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }
        .disabled(!viewModel.isUsernameValid)
    }
}

#Preview {
    SignUpUsernameView(viewModel: SignUpViewModel())
}
