//
//  AddBloodResultView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 31/10/22.
//

import SwiftUI

struct AddBloodResultView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = AddBloodViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Tanggal")
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        DatePicker("", selection: $viewModel.selectedDate, displayedComponents: .date)
                            .labelsHidden()
                            
                    }.padding(.horizontal, 24)
                        .padding(.top, 33)
                    
                    HStack {
                        Text("Waktu")
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        DatePicker("", selection: $viewModel.selectedDate, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            
                    }.padding(.horizontal, 24)
                        .padding(.top, 16)
                    
                    VStack(spacing: 24) {
                        FormTextField(placeholder: "CD4", text: $viewModel.cd4Amount, keyboardType: .numberPad)
                        
                        FormTextField(placeholder: "Viral Load", text: $viewModel.viralLoadAmount, keyboardType: .numberPad)
                    }.padding(.leading, 30)
                        .padding(.top, 16)
                }
            }.zIndex(0)
            
            if viewModel.isSuccessModalPresented || viewModel.isValidationModalPresented || viewModel.isCancelModalPresented {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .zIndex(1)
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Tambah Hasil Darah")
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
                        withAnimation {
                            viewModel.isCancelModalPresented = true
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.NAVIGATION_TITLE)
                    })
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
        if viewModel.isCancelModalPresented {
            let ctaViewModel = CTAModalViewModel(type: .warning, subtitle: "Hasil darah kamu belum tersimpan. Kamu yakin ingin batal?", primaryActionTitle: "Lanjut", secondaryActionTitle: "Batal", secondaryActionHandler: {
                presentationMode.wrappedValue.dismiss()
            })
            
            CTAModal(isPresented: $viewModel.isCancelModalPresented, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        } else if viewModel.isSuccessModalPresented {
            let ctaViewModel = CTAModalViewModel(type: .success, subtitle: "Hasil darah kamu berhasil disimpan", primaryActionTitle: "Lihat hasil darah", secondaryActionTitle: "Kembali ke beranda", primaryActionHandler: {
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

struct AddBloodResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddBloodResultView()
        }
    }
}
