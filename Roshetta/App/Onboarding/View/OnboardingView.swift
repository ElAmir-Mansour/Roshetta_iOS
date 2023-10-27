//
//  OnboardingView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTYS
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    private var data = OnbordingModel.onboardingData
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    let hapticFeedback = UINotificationFeedbackGenerator()

    @State private var currentStep: Int = 0
    @State private var isAnimating: Bool = false
        
    // MARK: - VIEW
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                tabView()
                currentPage()
                footer()
                .padding(.horizontal, 32)
            }
            .padding(.top, 64)
            .padding(.bottom, 32)
        }
    }
    
    // MARK: - TABVIEW
    private func tabView() -> some View {
        TabView(selection: $currentStep) {
            ForEach(data) { tab in
                VStack(spacing: 32) {
                    tab.image
                        .resizable()
                        .scaledToFit()
                    
                    VStack(spacing: 16) {
                        Text(tab.title)
                            .font(.custom(GFFonts.roman, size: 24))
                            .foregroundColor(Colors.text)
                        
                        Text(tab.descrption)
                            .font(.custom(GFFonts.popinsMedium, size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray.opacity(0.7))
                            .padding(.horizontal)
                    }
                }
                .tag(tab.id)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onChange(of: isAnimating, perform: { _ in
            isAnimating = false
        })
    }
    
    // MARK: - CURRENT PAGE
    private func currentPage() -> some View {
        HStack {
            ForEach(data.indices, id: \.self) { index in
                if index == currentStep {
                    Rectangle()
                        .fill(Colors.main)
                        .frame(width: 20, height: 8)
                        .cornerRadius(10)
                } else {
                    Rectangle()
                        .frame(width: 8, height: 8)
                        .cornerRadius(10)
                        .foregroundColor(.gray.opacity(0.7))
                }
            }
        }
        .padding(.bottom)
    }

    // MARK: - FOOTER
    private func footer() -> some View {
        HStack {
            if currentStep < data.count - 1 {
                Button {
                    isOnboardingViewActive = false
                } label: {
                    Text("Skip")
                        .font(.custom(GFFonts.popinsBold, size: 14))
                        .foregroundColor(Colors.text)
                }

                Spacer()
                
                GFNextButton {
                    if currentStep < data.count - 1 {
                        isAnimating = true
                        currentStep += 1
                    } else {
                        isOnboardingViewActive = false
                    }
                }
            } else {
                GFSliderButton(isAnimating: $isAnimating) {
                    buttonOffset = buttonWidth - 80
                    isOnboardingViewActive = false
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
