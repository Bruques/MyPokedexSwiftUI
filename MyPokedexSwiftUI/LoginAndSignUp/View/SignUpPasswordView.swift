//
//  SignUpPasswordView.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 25/02/24.
//

import SwiftUI

struct SignUpPasswordView: View {
    @StateObject var viewModel: SignUpViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        VStack {
            titleAndDescription
            passwordStack
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(MyCustomToolbar(title: "Criar conta"))
    }
    
    var titleAndDescription: some View {
        VStack {
            Text("Agora...")
                .font(FontMaker.makeFont(.poppinsRegular, 26))
                .foregroundStyle(PokedexColors.gray700)
            Text("Crie uma senha")
                .font(FontMaker.makeFont(.poppinsSemiBold, 26))
        }
    }
    
    var passwordStack: some View {
        VStack {
            passwordField
            Text("Sua senha deve ter pelo menos 6 caracteres.")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.gray700)
        }
    }
    
    var passwordField: some View {
        Group {
            if viewModel.isSecureField {
                SecureField("Senha", text: $viewModel.password)
            } else {
                TextField("Senha", text: $viewModel.password)
            }
        }
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .focused($isFocused)
        .font(FontMaker.makeFont(.poppinsRegular, 16))
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 2)
                .foregroundStyle(isFocused ? PokedexColors.primary : PokedexColors.lightGray)
        }
        .overlay(alignment: .trailing) {
            Image(systemName: viewModel.isSecureField ? "eye" : "eye.slash")
                .padding()
                .onTapGesture {
                    viewModel.isSecureField.toggle()
                }
        }
    }
    
    var continueButton: some View {
        NavigationLink {
            SignUpUsernameView(viewModel: self.viewModel)
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(viewModel.isPasswordValid ? PokedexColors.blue : PokedexColors.gray100)
                .overlay {
                    Text("Continuar")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }
        .disabled(!viewModel.isPasswordValid)
    }
}

#Preview {
    SignUpPasswordView(viewModel: SignUpViewModel())
}
