//
//  OnboardingPageView.swift
//  BerARTi
//
//  Created by Vanessa Ladiocha on 25/10/22.
//

import SwiftUI

struct OnboardingPageView: View {
    private let model: OnboardingModel
    
    init(page: Int) {
        model = OnboardingModel(page: page)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                Image(model.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .padding(.top, 160)
                
                Text(model.title)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.top, 40)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(page: 1)
    }
}
