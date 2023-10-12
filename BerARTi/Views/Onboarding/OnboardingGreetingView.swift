//
//  OnboardingGreetingView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 30/11/22.
//

import SwiftUI

struct OnboardingGreetingView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Image(Assets.ILLUSTRATION_ONBOARDING_GREETING_1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 100)
                
                Text("Hai,\nAku Richie")
                    .foregroundColor(Color(hex: "4F4C4C"))
                    .font(.defaultFont(size: 31, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                
                Text("Temen kamu,\nyang selalu ada buat kamu!")
                    .foregroundColor(Color(hex: "4F4C4C"))
                    .font(.defaultFont(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: OnboardingNameView(isPresented: $isPresented)) {
                    Text("Hai, Richie!")
                }.buttonStyle(PrimaryButtonStyle())
                    .frame(height: 45)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 30)
            }.navigationBarHidden(true)
        }
    }
}

struct OnboardingGreetingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingGreetingView(isPresented: .constant(true))
    }
}
