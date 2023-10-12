//
//  EmotionHistoryView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import SwiftUI

struct EmotionHistoryView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = EmotionHistoryViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("Hari Ini, \(Date.now.toString(format: "dd MMMM"))")
                    .font(.system(size: 18, weight: .bold))
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(hex: "#E0E0E0"))
                
                HStack(alignment: .center) {
                    ForEach(viewModel.daysOfTheCurrentWeek, id: \.self) { date in
                        DateCell(date: date, selectedDate: $viewModel.selectedDate)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                viewModel.selectedDate = date
                                viewModel.fetchEmotions()
                            }
                    }
                }.padding(.horizontal, 14)
                    .padding(.top, 18)
                
            }.padding(EdgeInsets(top: 35, leading: 0, bottom: 0, trailing: 0))
            
            if !viewModel.currentEmotions.isEmpty {
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.currentEmotions, id: \.emotionId) { model in
                        EmotionCell(model: model)
                    }
                }
            }
            
            Spacer()
        }.navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Riwayat Emosi")
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
    }
}

struct EmotionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmotionHistoryView()
        }
    }
}
