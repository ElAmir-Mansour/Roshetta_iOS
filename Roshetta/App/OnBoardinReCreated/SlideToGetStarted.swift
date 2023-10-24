//
//  SlideToGetStarted.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 24/10/2023.
//

import SwiftUI

struct SlideToGetStarted: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 60
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    var body: some View {
        ZStack {
          VStack(spacing: 20) {
            Spacer()
            
            ZStack {
              // PARTS OF THE CUSTOM BUTTON
              
              // 1. BACKGROUND (STATIC)
                
              Capsule()
                    .fill(Color(.lightBlueCustom))
                .padding(2)
                .opacity(0.5)
              
              // 2. CALL-TO-ACTION (STATIC)
              
              Text("Get Started")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color(.darkBlueCustom))
                .offset(x: 10)
                
                // 3. CAPSULE (DYNAMIC WIDTH)
                
                HStack {
                  Capsule()
                        .fill(Color(.lightBlueCustom))
                    .frame(width: buttonOffset + 60)
                  
                  Spacer()
                }
              
              // 4. CIRCLE (DRAGGABLE)
              
              HStack {
                ZStack {
                  Circle()
                    .fill(.white)
                    .padding(2)
                  Image(systemName: "chevron.right")
                    .font(.system(size: 24))
                }
                .foregroundColor(Color(.lightBlueCustom))
                .frame(width: 60, height: 60, alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                  DragGesture()
                    .onChanged { gesture in
                      if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 60 {
                        buttonOffset = gesture.translation.width
                      }
                    }
                    .onEnded { _ in
                      withAnimation(Animation.easeOut(duration: 0.4)) {
                        if buttonOffset > buttonWidth / 2 {
                          hapticFeedback.notificationOccurred(.success)
                          buttonOffset = buttonWidth - 60
                          isOnboardingViewActive = false
                        } else {
                          hapticFeedback.notificationOccurred(.warning)
                          buttonOffset = 0
                        }
                      }
                    }
                ) //: GESTURE
                
                Spacer()
              } //: HSTACK
            } //: FOOTER
            .frame(width: buttonWidth, height: 60, alignment: .center)
            .padding()
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : 40)
            .animation(.easeOut(duration: 1), value: isAnimating)
          } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
          isAnimating = true
        })
        
    }
}

#Preview {
    SlideToGetStarted()
}
