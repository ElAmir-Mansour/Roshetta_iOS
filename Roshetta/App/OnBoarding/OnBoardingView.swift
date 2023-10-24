//
//  OnboardingView1.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 24/10/2023.
//

import SwiftUI

struct OnboardingModel {
    let image: Image
    let title: String
    let description: String
    let alignment: Alignment
}

struct OnboardingView: View {
    let onbordingData: [OnboardingModel] = [
        .init(image: Image("OnboardingView1_img"),
              title: "Find Professional Doctor.",
              description: "You can search for doctors based on their specialization, ensuring that you find the right healthcare provider for your specific needs, whether it's a general practitioner or specialist.", alignment: .leading),
        
        
        .init(image: Image("OnboardingView2_img"),
              title: "Your family is in good hands.",
              description: "Our app places a strong emphasis on family well-being, offering comprehensive healthcare solutions for both you and your cherished family members.", alignment: .center),
        .init(image: Image("OnboardingView3_img"),
              title: "You have our support, always.",
              description: " The app provides a dedicated support channel, such as a help center or a chat support feature, where users can seek assistance for any questions or issues they encounter while using the app.", alignment: .trailing)
    ]
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        NavigationStack{
            VStack (alignment: .center) {
                onbordingData[currentIndex].image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 410,height: 401,alignment: onbordingData[currentIndex].alignment)
                    .padding(.top,40)
                Text(onbordingData[currentIndex].title)
                    .bold()
                    .font(.title2)
                    .padding()
                Text(onbordingData[currentIndex].description)
                    .padding(.horizontal,20)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                HStack{
                    // Skip Button
                    NavigationLink(destination: GetStartedView().navigationBarBackButtonHidden(true)){
                        // Next Button
                        Text("Skip")
                            .bold()
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    if currentIndex == onbordingData.count - 1 {
                        NavigationLink(destination: GetStartedView().navigationBarBackButtonHidden(true)){
                            // Next Button
                            SlideToGetStarted()
                        }
                    }
                    else{
                        // Next Button
                        Button{currentIndex += 1}
                        label: {
                            Image(systemName: "chevron.right.circle.fill")
                                .foregroundStyle(Color("LightBlueCustomColor"))
                                .font(.system(size: 34))
                                
                                
                        }
                    }
                }
                .padding(30)
                // HStack
            }
        }
    }
}

#Preview {
    OnboardingView()
}
