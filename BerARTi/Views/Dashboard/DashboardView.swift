//
//  DashboardView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI
import Combine

struct DashboardView: View {
    
    @StateObject private var viewModel = DashboardViewModel()
    private let trailingLeadingPadding: CGFloat = 20
    
    var body: some View {
        NavigationView { [unowned viewModel] in
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 19) {
                        // MARK: - Top  Navigation Bar (Start)
                        ZStack {
                            VStack(spacing: 21) {
                                HStack(alignment: .center) {
                                    Text("Halo!")
                                        .foregroundColor(.TEXT_DARK_GREEN)
                                        .font(.system(size: 30, weight: .bold))
                                    
                                    Spacer()
                                    
                                    
                                    HStack(spacing: 15) {
                                        NavigationLink(destination: SettingsView()) {
                                            Image(systemName: "gearshape")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.TEXT_DARK_GREEN)
                                        }
                                        
                                        Image(systemName: "person.crop.circle")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.TEXT_DARK_GREEN)
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 30, leading: trailingLeadingPadding, bottom: 0, trailing: trailingLeadingPadding))
                        }
                        // MARK: - Top  Navigation Bar (End)
                        
                        // MARK: - Emotion Log (Start)
                        VStack {
                            ZStack {
                                if viewModel.latestEmotion != nil {
                                    Image(viewModel.latestEmotion!.emotion.backgroundName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                }
                                
                                VStack {
                                    HStack {
                                        Text(viewModel.latestEmotion == nil ?
                                             "Apa Kabar, \(viewModel.username)!" :
                                                "\(viewModel.username), you feeling ")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.TEXT_DARK_GREEN)
                                        
                                        if let latestEmotion = viewModel.latestEmotion {
                                            InputEmotionView(sizeMultiplier: 0.5, imageName: latestEmotion.emotion.imageName)
                                                .onTapGesture {
                                                    viewModel.isPresentingEmotionModal = true
                                                }
                                        }
                                    }
                                    
                                    if viewModel.latestEmotion == nil {
                                        InputEmotionView()
                                            .onTapGesture {
                                                viewModel.isPresentingEmotionModal = true
                                            }
                                    } else {
                                        VStack(alignment: .leading, spacing: 24) {
                                            Text("“\(viewModel.randomQuote.quote)”")
                                                .font(.system(size: 14))
                                                .foregroundColor(.TEXT_DARK_GREEN)
                                            
                                            Text("- \(viewModel.randomQuote.author.isEmpty ? "Anonymous" : viewModel.randomQuote.author)")
                                                .font(.system(size: 14))
                                                .foregroundColor(.TEXT_DARK_GREEN)
                                        }
                                        .padding(EdgeInsets(top: 24,
                                                            leading: 16,
                                                            bottom: 39,
                                                            trailing: 16))
                                    }
                                }.padding(.horizontal, trailingLeadingPadding)
                                    .zIndex(1)
                            }
                            
                            HStack {
                                Spacer()
                                
                                NavigationLink(destination: EmotionHistoryView()) {
                                    Text("riwayat emosi")
                                        .font(.system(size: 14))
                                        .foregroundColor(.TEXT_PRIMARY_GREEN)
                                }
                            }.padding(.horizontal, trailingLeadingPadding)
                        }
                        // MARK: - Emotion Log (End)
                        
                        // MARK: - Today's consumption (Start)
                        VStack(alignment: .leading, spacing: 21) {
                            Text("Konsumsi hari ini")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.TEXT_DARK_GREEN)
                            
                            if !viewModel.reminderList.isEmpty {
                                LazyVStack(spacing: 10) {
                                    ForEach(viewModel.reminderList, id: \.reminderId) { model in
                                        ReminderCell(model: model, isFinished: viewModel.isReminderFinished(reminderId: model.reminderId)) { model in
                                            viewModel.willFinishReminder(model)
                                        }
                                    }
                                }
                            } else {
                                VStack {
                                    Text("Tambahkan Konsusmsi mu!")
                                        .font(.system(size: 14))
                                        .foregroundColor(.TEXT_DARK_GREEN)
                                        .multilineTextAlignment(.center)
                                }.frame(height: 80)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, trailingLeadingPadding)
                        // MARK: - Today's consumption (End)
                        
                        // MARK: - Upcoming Appointments (Start)
                        VStack(alignment: .leading, spacing: 21) {
                            Text("Janji Temu")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.TEXT_DARK_GREEN)
                            if !viewModel.upcomingAppointments.isEmpty {
                                LazyVStack(spacing: 10) {
                                    ForEach(viewModel.upcomingAppointments, id: \.appointmentId) { model in
                                        DashboardAppointmentCell(model: model)
                                    }
                                }
                            } else {
                                VStack {
                                    Text("Kamu belum memiliki Janji Temu hari ini")
                                        .font(.system(size: 14))
                                        .foregroundColor(.TEXT_DARK_GREEN)
                                        .multilineTextAlignment(.center)
                                }.frame(height: 80)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, trailingLeadingPadding)
                        // MARK: - Upcoming Appointments (End)
                        
                        // MARK: - Article Recomendations (Start)
                        VStack(alignment: .leading, spacing: 21) {
                            HStack {
                                Text("Tahukah Kamu?")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.TEXT_DARK_GREEN)
                                
                                Spacer()
                                
                                /*
                                 Text("lihat lainnya")
                                 .font(.system(size: 14))
                                 .foregroundColor(.TEXT_PRIMARY_GREEN)
                                 */
                            }.padding(.horizontal, trailingLeadingPadding)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 0) {
                                    ForEach(Array(zip(viewModel.funFactList.indices, viewModel.funFactList)), id: \.0) { index, model in
                                        NavigationLink(destination: ArticleDetailView(model: model)) {
                                            FunFactCell(model: model)
                                                .padding(.leading, 20)
                                                .padding(.trailing, index == viewModel.funFactList.count-1 ? 20 : 0)
                                        }
                                    }
                                }
                            }
                        }
                        // MARK: - Article Recomendations (End)
                        
                        EmptySpacer(height: 100)
                    }
                    .ignoresSafeArea()
                    .navigationBarHidden(true)
                    .onAppear {
                        viewModel.getAllReminders()
                        viewModel.getLatestEmotion()
                        viewModel.getUpcomingAppointments()
                    }
                    .fullScreenCover(isPresented: $viewModel.isPresentingOnboarding, content: {
                        OnboardingGreetingView(isPresented: $viewModel.isPresentingOnboarding)
                    })
                    .fullScreenCover(isPresented: $viewModel.isPresentingEmotionModal, content: {
                        EmotionSelectionView(isPresented: $viewModel.isPresentingEmotionModal)
                    })
                }.zIndex(0)
                
                if viewModel.isPresentingReminderFinishedModal {
                    Color.black.opacity(0.6)
                        .ignoresSafeArea()
                        .zIndex(1)
                }
            }.overlay(alignment: .bottom) {
                modalPresented
            }
            
        }
    }
    
    @ViewBuilder private var modalPresented: some View {
        if viewModel.isPresentingReminderFinishedModal {
            let ctaViewModel = CTAModalViewModel(type: .success, subtitle: "Kamu yakin sudah minum obat?", primaryActionTitle: "Sudah", secondaryActionTitle: "Belum", primaryActionHandler: {
                viewModel.finishReminder()
            })
            
            CTAModal(isPresented: $viewModel.isPresentingReminderFinishedModal, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
