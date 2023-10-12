//
//  ArticleView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

struct SocialView: View {
    @StateObject private var viewModel = SocialViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        TabView {
                            ForEach(1...3, id: \.self) { index in
                                SocialBannerView(page: index)
                                    .onTapGesture {
                                        withAnimation {
                                            viewModel.isPresentingCommunityModal = true
                                        }
                                    }
                            }
                        }.tabViewStyle(.page)
                            .frame(height: 145)
                            .cornerRadius(10, corners: .allCorners)
                            .padding(.top, 10)
                        
                        Text("Tahukah kamu?")
                            .font(.system(size: 17, weight: .bold))
                            .padding(.top, 10)
                        
                        LazyVStack(spacing: 10) {
                            ForEach(viewModel.funFactList, id: \.funFactId) { model in
                                NavigationLink(destination: ArticleDetailView(model: model)) {
                                    ArticleCell(model: model)
                                }
                            }
                        }
                        
                    }.padding(.horizontal, 20)
                }.zIndex(0)
                
                if viewModel.isPresentingCommunityModal {
                    Color.black.opacity(0.6)
                        .ignoresSafeArea()
                        .zIndex(1)
                }
            }
            .navigationTitle(Text("Sosial"))
            .overlay(alignment: .bottom) {
                modalPresented
            }
        }
    }
    
    @ViewBuilder private var modalPresented: some View {
        if viewModel.isPresentingCommunityModal {
            let ctaViewModel = CTAModalViewModel(type: .greet, title: "Ada yang baru nih! ", subtitle: "Kami dalam proses untuk menjangkau komunitas, tunggu kabar selanjutnya ya!", primaryActionTitle: "Kembali")
            
            CTAModal(isPresented: $viewModel.isPresentingCommunityModal, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
