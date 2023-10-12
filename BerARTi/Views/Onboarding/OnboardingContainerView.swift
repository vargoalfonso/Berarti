//
//  OnboardingContainerView.swift
//  BerARTi
//
//  Created by Vanessa Ladiocha on 25/10/22.
//

import SwiftUI

struct OnboardingContainerView: View {
    
    private let pages: [OnboardingPageView] = [
        OnboardingPageView(page: 1),
        OnboardingPageView(page: 2),
        OnboardingPageView(page: 3),
        OnboardingPageView(page: 4),
        OnboardingPageView(page: 5),
    ]
    
    @Binding var isPresented: Bool
    @State private var pageIndex: Int = 0
    
    var body: some View {
        ZStack {
            Image(Assets.ILLUSTRATION_REVAMPED_ONBOARDING_BACKGROUND)
                .resizable()
                .ignoresSafeArea()
                .padding(.top, currentWindow?.safeAreaInsets.top)
            
            TabView(selection: $pageIndex) {
                ForEach(pages.indices, id: \.self) { index in
                    pages[index]
                        .tag(index)
                }
            }
            .padding(.bottom, 50)
            .tabViewStyle(.page)
            .disabled(true)
        }.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("BerARTi")
                        .bold()
                        .foregroundColor(.NAVIGATION_TITLE)
                        .fixedSize(horizontal: true, vertical: false)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text("Skip")
                            .foregroundColor(.TEXT_GRAY)
                            .font(.system(size: 14))
                    })
                }
            }
            .overlay(alignment: .bottom) {
                Button(action: {
                    if pageIndex != 4 {
                        withAnimation{
                            pageIndex += 1
                        }
                    } else {
                        UserDefaults.standard.isPresentingOnboarding = true
                        isPresented = false
                    }
                }, label: {
                    Text("Lanjut")
                }).buttonStyle(PrimaryButtonStyle())
                    .frame(height: 45)
                    .padding(.horizontal, 50)
                    .padding(.bottom, (currentWindow?.safeAreaInsets.bottom ?? 0) + 24)
            }
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OnboardingContainerView(isPresented: .constant(true))
        }
    }
}

