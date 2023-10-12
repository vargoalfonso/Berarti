//
//  OnboardingNameView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 30/11/22.
//

import SwiftUI

struct OnboardingNameView: View {
    
    @Binding var isPresented: Bool
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            Image(Assets.ILLUSTRATION_ONBOARDING_GREETING_2)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 100)
            
            Text("Tak kenal maka tak sayang,\nBoleh tau kamu panggilannya siapa?")
                .foregroundColor(Color(hex: "4F4C4C"))
                .font(.defaultFont(size: 22))
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            TextField("Nama", text: $name)
                .foregroundColor(Color(hex: "4F4C4C"))
                .font(.defaultFont(size: 31, weight: .bold))
                .padding(.horizontal, 50)
                .padding(.top, 60)
            
            Spacer()
            
            Button("Lanjut") {
                if !name.isEmpty {
                    UserDefaults.standard.username = name
                    isPresented = false
                }
            }.buttonStyle(PrimaryButtonStyle())
                .frame(height: 45)
                .padding(.horizontal, 50)
                .padding(.vertical, 30)
        }.navigationBarHidden(true)
            .onTapGesture {
                dismissKeyboard()
            }
    }
}

struct OnboardingNameView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingNameView(isPresented: .constant(true))
    }
}
