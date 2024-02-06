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
                onboardingTabView
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                withAnimation {
                    self.viewModel.showSplash = false
                }
            }
        }
    }
    
    var onboardingTabView: some View {
        NavigationView {
            TabView(selection: $viewModel.currentStep) {
                ForEach(Array(viewModel.onboardingSteps.enumerated()), id: \.offset) { index, step in
                    VStack {
                        trainersImages(stepIndex: index)
                        Spacer().frame(height: 45)
                        titleAndDescription(title: step.title,
                                            description: step.description)
                        Spacer().frame(height: 50)
                        continueButton(buttonText: step.buttonText)
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .bottom)
                    .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay {
                onboardingIndicator
            }
        }
    }
    
    @ViewBuilder
    func trainersImages(stepIndex: Int) -> some View {
        if stepIndex == 0 {
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
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(PokedexColors.primary)
            Text(description)
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(PokedexColors.secondary)
        }
    }
    
    @ViewBuilder
    func continueButton(buttonText: String) -> some View {
        if viewModel.currentStep == 0 {
            Button(action: {
                withAnimation {
                    viewModel.currentStep = 1
                }
            }, label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .foregroundStyle(.white)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                    }
            })
        } else {
            NavigationLink {
                LoginOrSignUpView()
            } label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .foregroundStyle(.white)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                    }
            }
        }
    }
    
    var onboardingIndicator: some View {
        HStack {
            ForEach(viewModel.onboardingSteps.indices, id: \.self) { index in
                    Capsule()
                    .foregroundStyle(viewModel.currentStep == index ? PokedexColors.blue : PokedexColors.secondary)
                    .frame(width: viewModel.currentStep == index ? 28 : 9, height: 9)
                    .animation(.bouncy, value: viewModel.currentStep)
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .bottom)
        .padding(.bottom, 95)
    }
    
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
