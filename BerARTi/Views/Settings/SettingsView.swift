//
//  SettingsView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        List {
            /*
            Section(header:
                        Text("Notifikasi").font(.system(size: 17, weight: .bold)).foregroundColor(.black)
            ) {
                
                SettingsRowView(title: "Pengingat Genting", subtitle: "Dapatkan notifikasi suara pengingat genting apabila terapi belum dikonsumsi dalam satu jam") {
                    Toggle(isOn: viewModel.$biometricAuthenticationEnabled) {}
                        .labelsHidden()
                        .tint(Color.NAVIGATION_BAR_BACKGROUND)
                }
                
                SettingsRowView(title: "Waktu Getar")
                
                ZStack {
                    SettingsRowView(title: "Ubah Kata-kata Notifikasi")
                    
                    NavigationLink(destination: ChangeNotificationMessageView()) {
                        EmptyView()
                    }.opacity(0)
                }
                
            }.listSectionSeparator(.hidden)
             */
            
            Section(header:
                        Text("Lain-lain").font(.system(size: 17, weight: .bold)).foregroundColor(.black)
            ) {
                SettingsRowView(title: "Gunakan Autentikasi Biometrik") {
                    Toggle(isOn: viewModel.$biometricAuthenticationEnabled) {}
                        .labelsHidden()
                        .tint(Color.NAVIGATION_BAR_BACKGROUND)
                }
                
                ZStack {
                    SettingsRowView(title: "Kebijakan Privasi", subtitle: "Baca dokumen terkait Informasi dan Data Pribadi")
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        EmptyView()
                    }.opacity(0)
                }
                
                SettingsRowView(title: "Bagikan BerARTi", subtitle: "Buat hidup lingkunganmu menjadi BerARTi ")
                    .onTapGesture {
                        viewModel.showShareActionSheet()
                    }
                
                ZStack {
                    SettingsRowView(title: "Hubungi Kami")
                    
                    NavigationLink(destination: ContactUsView()) {
                        EmptyView()
                    }.opacity(0)
                }
            }.listSectionSeparator(.hidden)
        }
        .listStyle(.inset)
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Pengaturan")
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

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
