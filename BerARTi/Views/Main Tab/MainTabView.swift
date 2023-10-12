//
//  MainTabView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = MainTabViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView {
            DashboardView()
                .tag(0)
                .tabItem {
                    VStack {
                        Image(systemName: "circle.grid.cross")
                        Text("Hari Ini")
                    }
                }
            
            HealthView()
                .tag(1)
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg")
                        Text("Kesehatan")
                    }
                }
            
            SocialView()
                .tag(3)
                .tabItem {
                    VStack {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Sosial")
                    }
                }
        }.accentColor(Color.PAGE_INDICATOR_ACTIVE)
            .blur(radius: viewModel.isPresentingAuthenticationView ? 20 : 0)
            .onAppear {
                viewModel.authenticate()
            }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
