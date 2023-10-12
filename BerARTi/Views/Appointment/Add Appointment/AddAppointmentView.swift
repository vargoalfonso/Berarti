//
//  AddAppointmentView.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 27/10/22.
//

import SwiftUI

struct AddAppointmentView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = AddAppointmentViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 13) {
                        Text("Jenis Janji Temu")
                            .font(.system(size: 17))
                            .foregroundColor(.TEXT_DARK_GREEN)
                        
                        FormTextField(placeholder: "Check-up Bulanan", text: $viewModel.appointmentName)
                            .padding(.leading, 15)
                    }
                    
                    HStack {
                        Text("Tanggal")
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        DatePicker("", selection: $viewModel.appointmentDate, displayedComponents: .date)
                            .labelsHidden()
                    }.padding(.trailing, 16)
                    
                    HStack {
                        Text("Waktu")
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        DatePicker("", selection: $viewModel.appointmentTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }.padding(.trailing, 16)
                    
                    HStack {
                        Text("Tambah ke Kalender")
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        Toggle("", isOn: $viewModel.isAddedToCalendar)
                            .labelsHidden()
                            .tint(Color.NAVIGATION_BAR_BACKGROUND)
                    }.padding(.trailing, 16)
                    
                    Spacer()
                }
            }.zIndex(0)
                .padding(.top, 24)
                .padding(.leading, 16)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Tambah Janji Temu")
                            .bold()
                            .foregroundColor(.NAVIGATION_TITLE)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.saveData()
                        }, label: {
                            Text("Simpan")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.NAVIGATION_TITLE)
                        })
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
            
            if viewModel.isSuccessModalPresented || viewModel.isValidationModalPresented {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .zIndex(1)
            }
        }
        .gesture(TapGesture().onEnded {
            dismissKeyboard()
        })
        .overlay(alignment: .bottom) {
            modalPresented
        }
    }
    
    @ViewBuilder private var modalPresented: some View {
        if viewModel.isSuccessModalPresented {
            let ctaViewModel = CTAModalViewModel(type: .success, title: "Sampai Bertemu Nanti!", subtitle: "Janti temu kamu sudah tersimpan. Kamu yakin ingin keluar?", primaryActionTitle: "Lihat Pengingat", secondaryActionTitle: "Tambah Janji Temu lain", primaryActionHandler: {
                presentationMode.wrappedValue.dismiss()
            }, secondaryActionHandler: {
                presentationMode.wrappedValue.dismiss()
            })

            CTAModal(isPresented: $viewModel.isSuccessModalPresented, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        } else if viewModel.isValidationModalPresented {
            let ctaViewModel = CTAModalViewModel(type: .warning, subtitle: "Data kamu ada yang belom diisi nih, ayo lengkapi dulu!", primaryActionTitle: "Lanjutkan isi data")

            CTAModal(isPresented: $viewModel.isValidationModalPresented, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        }
    }
}

struct AddAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddAppointmentView()
        }
    }
}
