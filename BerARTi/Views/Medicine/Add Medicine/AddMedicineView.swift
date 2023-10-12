//
//  AddMedicineView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 04/11/22.
//

import SwiftUI

struct AddMedicineView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = AddMedicineViewModel()
    
    var body: some View {
        let unitBinding = Binding(
            get: { return self.viewModel.type == .unit },
            set: {
                if $0 {
                    self.viewModel.type = .unit
                }
            }
        )
        
        let combinationBinding = Binding(
            get: { return self.viewModel.type == .combination },
            set: {
                if $0 {
                    self.viewModel.type = .combination
                }
            }
        )
        
        ZStack {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading) {
                    Text("Jenis Obat")
                        .font(.system(size: 17))
                    
                    HStack {
                        SelectionChip(title: "Satuan", isSelected: unitBinding)
                            .gesture(TapGesture().onEnded {
                                self.viewModel.type = .unit
                            })
                        
                        SelectionChip(title: "Kombinasi", isSelected: combinationBinding)
                            .gesture(TapGesture().onEnded {
                                self.viewModel.type = .combination
                            })
                    }
                }
                
                Menu(content: {
                    ForEach(viewModel.type == .unit ? ARVModel.getUnitAll() : ARVModel.getCombinationAll(), id: \.self) { value in
                        Button(value.name) {
                            self.viewModel.arvModel = value
                        }
                    }
                }, label: {
                    FormSelector(title: "Nama Obat", selectedString: .constant(viewModel.arvModel?.name))
                })
                
                Menu(content: {
                    ForEach(viewModel.frequencies, id: \.self) { value in
                        Button("\(value.toString)") {
                            self.viewModel.frequency = value
                        }
                    }
                }, label: {
                    FormSelector(title: "Kali Dalam Sehari", selectedString: .constant("\(viewModel.frequency.rawValue) kali sehari"))
                })
                
                ForEach(1...viewModel.frequency.rawValue, id: \.self) { tag in
                    FormSelector(title: "Atur waktu", selectedString: .constant(viewModel.getSelectedStringForReminderTimeSelector(tag: tag))) {
                        self.viewModel.showReminderTimePickerModal(tag: tag)
                    }
                }
                
                Menu(content: {
                    ForEach(viewModel.remindBefores, id: \.self) { value in
                        Button("\(value) Menit") {
                            self.viewModel.remindBefore = value
                        }
                    }
                }, label: {
                    FormSelector(title: "Atur pengingat sebelum", selectedString: .constant(viewModel.remindBefore != nil ? "\(viewModel.remindBefore!) menit" : nil))
                })
                
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            .zIndex(0)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Tambah Obat")
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
            
            if viewModel.isTimePickerModalPresented || viewModel.isSuccessModalPresented || viewModel.isValidationModalPresented || viewModel.isCancelModalPresented {
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
        if viewModel.isTimePickerModalPresented {
            TimePickerModal(isPresented: $viewModel.isTimePickerModalPresented) { hour, minute in
                viewModel.reminderTimes[viewModel.frequencyModalTag-1] = (hour, minute)
            }.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        } else if viewModel.isSuccessModalPresented {
            let ctaViewModel = CTAModalViewModel(type: .success, subtitle: "\(viewModel.arvModel?.name ?? "") berhasil disimpan", primaryActionTitle: "Tambah obat lain", secondaryActionTitle: "Lanjutkan ke dashboard", primaryActionHandler: {
                
            }, secondaryActionHandler: {
                presentationMode.wrappedValue.dismiss()
            })
            
            CTAModal(isPresented: $viewModel.isSuccessModalPresented, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        } else if viewModel.isValidationModalPresented {
            let ctaViewModel = CTAModalViewModel(type: .warning, subtitle: "Data kamu ada yang belom diisi nih, ayo lengkapi dulu!", primaryActionTitle: "Lanjutkan isi data")
            
            CTAModal(isPresented: $viewModel.isValidationModalPresented, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        } else if viewModel.isCancelModalPresented {
            let ctaViewModel = CTAModalViewModel(type: .warning, subtitle: "Obat kamu belum tersimpan. Kamu yakin ingin batal?", primaryActionTitle: "Kembali Tambah Obat", secondaryActionTitle: "Batal", secondaryActionHandler: {
                presentationMode.wrappedValue.dismiss()
            })
            
            CTAModal(isPresented: $viewModel.isCancelModalPresented, viewModel: ctaViewModel)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        }
    }
}

struct AddMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMedicineView()
        }
    }
}
