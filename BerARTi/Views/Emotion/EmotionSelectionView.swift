//
//  EmotionSelectionView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 26/11/22.
//

import SwiftUI

struct EmotionSelectionView: View {
    
    @Binding var isPresented: Bool
    @State private var selectedEmotion: Emotion? = nil
    
    private let emotions: [Emotion] = [
        .normal, .happy, .loved,
        .angry, .anxious, .sad,
        .stressed, .sick, .healthy
    ]
    private let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Text("Kamu lagi ngerasain apa?")
                        .font(.system(size: 20))
                        .padding(.top, 40)
                    
                    LazyVGrid(columns: gridItems, spacing: 30) {
                        ForEach(emotions, id: \.rawValue) { value in
                            EmotionGridCell(value)
                                .onTapGesture {
                                    withAnimation {
                                        selectedEmotion = value
                                    }
                                }
                                .overlay {
                                    if selectedEmotion == value {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.TEXT_PRIMARY_GREEN, lineWidth: 3)
                                            .padding(-7)
                                    }
                                }
                        }
                    }.padding(.horizontal, 50)
                    
                    Spacer()
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
                        if UserDefaults.standard.isPresentingOnboarding {
                            Button(action: {
                                isPresented = false
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.NAVIGATION_TITLE)
                            })
                        }
                    }
                }
                .overlay(alignment: .bottom) {
                    if let selectedEmotion {
                        NavigationLink(destination: EmotionIntensityView(selectedEmotion, isPresented: $isPresented)) {
                            Text("Lanjut")
                        }.buttonStyle(PrimaryButtonStyle())
                            .frame(height: 45)
                            .padding(.horizontal, 50)
                            .padding(.bottom, 32)
                    }
                }
        }
    }
}

struct EmotionSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionSelectionView(isPresented: .constant(true))
    }
}
