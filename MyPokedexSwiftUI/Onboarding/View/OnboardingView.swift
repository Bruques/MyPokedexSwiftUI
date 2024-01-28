//
//  OnboardingView.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 27/01/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        ZStack {
            if viewModel.showSplash {
                SplashView()
            } else {
                TabView(selection: $viewModel.currentStep) {
                    ForEach(0..<viewModel.onboardingSteps.count, id: \.self) { index in
                        VStack {
                            trainersImages
                            Spacer().frame(height: 45)
                            titleAndDescription(title: viewModel.onboardingSteps[index].title, description: viewModel.onboardingSteps[index].description)
                            Spacer().frame(height: 24)
                            onboardingProgressView
                            Spacer().frame(height: 24)
                            continueButton(buttonText: viewModel.onboardingSteps[index].buttonText)
                        }
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity,
                               alignment: .bottom)
                        .padding()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.viewModel.showSplash = false
                }
            }
        }
    }
    
    @ViewBuilder
    var trainersImages: some View {
        if viewModel.currentStep == 0 {
            ZStack {
                Image("trainer1")
                    .offset(x: -50)
                    .background {
                        Image("shadowTrainer1")
                            .offset(x: -65, y: 110)
                    }
                Image("trainer2")
                    .offset(x: 50, y: -10)
                    .background {
                        Image("shadowTrainer2")
                            .offset(x: 50, y: 115)
                    }
            }
        } else {
            Image("trainer3")
                .background {
                    Image("shadowTrainer3")
                        .offset(x: -10,y: 120)
                }
        }
    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack(spacing: 16) {
            Text(title)
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primaria"))
            Text(description)
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secundaria"))
        }
    }
    
    @ViewBuilder
    var onboardingProgressView: some View {
        if viewModel.currentStep == 0 {
            HStack {
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("AzulEscuro"))
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
            }
        } else {
            HStack {
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("AzulEscuro"))
            }
        }
    }
    
    func continueButton(buttonText: String) -> some View {
        Button(action: {
            viewModel.currentStep = 1
        }, label: {
            Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("AzulEscuro"))
                .overlay {
                    Text(buttonText)
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-SemiBold", size: 18))
                }
        })
    }
    
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
