//
//  CTAModal.swift
//  BerARTi
//
//  Created by cleanmac-ada on 13/11/22.
//

import SwiftUI

struct CTAModal: View {
    @Binding var isPresented: Bool
    
    var viewModel: CTAModalViewModel
    
    var body: some View {
        VStack(spacing: 22) {
            Image(viewModel.type.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            
            if let title = viewModel.title {
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.TEXT_DARK_GREEN)
            }
            
            Text(viewModel.subtitle)
                .font(.system(size: 15, weight: .medium))
                .multilineTextAlignment(.center)
            
            Button(viewModel.primaryActionTitle) {
                withAnimation {
                    isPresented = false
                }
                viewModel.primaryActionHandler()
            }.frame(height: 45)
                .buttonStyle(PrimaryButtonStyle())
            
            if let secondaryActionTitle = viewModel.secondaryActionTitle{
                Button(secondaryActionTitle) {
                    withAnimation {
                        isPresented = false
                    }
                    viewModel.secondaryActionHandler()
                }.frame(height: 45)
                    .buttonStyle(SecondaryButtonStyle())
            }
            
        }.padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(22, corners: [.topLeft, .topRight])
            .onAppear {
                if viewModel.type == .success {
                    HapticsManager.shared.notifySuccess()
                }
            }
    }
}

struct CTAModal_Previews: PreviewProvider {
    static var previews: some View {
        CTAModal(isPresented: .constant(true), viewModel: CTAModalViewModel(type: .neutral, subtitle: "Something", primaryActionTitle: "Yes"))
            .previewLayout(.sizeThatFits)
    }
}

struct CTAModalViewModel {
    var type: CTAModalType
    var title: String? = nil
    var subtitle: String
    var primaryActionTitle: String
    var secondaryActionTitle: String? = nil
    
    var primaryActionHandler: () -> Void = {}
    var secondaryActionHandler: () -> Void = {}
}

