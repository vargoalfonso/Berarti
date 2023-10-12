//
//  EmotionIntensityView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import SwiftUI
import Lottie

struct EmotionIntensityView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel: EmotionIntensityViewModel
    @Binding private var isPresented: Bool
    @State private var isNavigationLinkTapped: Bool = false
    
    init(_ emotion: Emotion, isPresented: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: EmotionIntensityViewModel(selectedEmotion: emotion))
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Text("Intensitas Emosimu")
                    .font(.system(size: 20))
                    .padding(.top, 24)
                
                EmotionAnimationViewRepresentation(viewModel.selectedEmotion) { [unowned viewModel] value in
                    viewModel.intensity = Int((value * 10).rounded())
                }.padding(.horizontal, 34)
                    .frame(height: 300)
                
                VStack(alignment: .leading) {
                    Text("Kalau mau, kamu bisa cerita")
                        .font(.system(size: 16))
                    
                    TextEditor(text: $viewModel.story)
                        .frame(height: 130)
                        .colorMultiply(.TEXTEDITOR_BACKGROUND)
                        .cornerRadius(10, corners: .allCorners)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.TEXTEDITOR_BORDER, lineWidth: 1.5)
                        }
                }.padding(.horizontal, 20)
                    .padding(.top, 54)
                
                EmptySpacer(height: 50)
            }
            
            Spacer()
            
            if !UserDefaults.standard.isPresentingOnboarding {
                NavigationLink(destination: OnboardingContainerView(isPresented: $isPresented), isActive: Binding<Bool>(get: {
                    isNavigationLinkTapped
                }, set: {
                    isNavigationLinkTapped = $0
                    viewModel.saveData()
                }),label: {
                    Text("Lanjut")
                }).buttonStyle(PrimaryButtonStyle())
                    .frame(height: 45)
                    .padding(EdgeInsets(top: 10, leading: 50, bottom: 20, trailing: 50))
            } else {
                Button("Lanjut", action: {
                    viewModel.saveData()
                    isPresented = false
                }).buttonStyle(PrimaryButtonStyle())
                    .frame(height: 45)
                    .padding(EdgeInsets(top: 10, leading: 50, bottom: 20, trailing: 50))
            }
            
        }.navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Emosi")
                        .bold()
                        .foregroundColor(.NAVIGATION_TITLE)
                        .fixedSize(horizontal: true, vertical: false)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.NAVIGATION_TITLE)
                    })
                }
            }
            .gesture(TapGesture().onEnded {
                dismissKeyboard()
            })
    }
}

struct EmotionIntensityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmotionIntensityView(.normal, isPresented: .constant(true))
        }
    }
}
