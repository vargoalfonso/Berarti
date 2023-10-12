//
//  MedicineView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 26/11/22.
//

import SwiftUI

struct MedicineView: View {
    
    @StateObject private var viewModel = MedicineViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 45) {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Obat seminggu")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    HStack(alignment: .center) {
                        ForEach(0...6, id: \.self) { value in
                            SupplementWeekProgressCell(day: SupplementWeekday(rawValue: value)!, progress: viewModel.getProgressFromDate(index: value))
                                .frame(maxWidth: .infinity)
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity)
                
                VStack {
                    HStack {
                        Text("Konsumsi Obat")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.TEXT_DARK_GREEN)
                        
                        Spacer()
                        
                        NavigationLink(destination: AddMedicineView()) {
                            Text("Tambah")
                                .font(.system(size: 14))
                                .foregroundColor(.TEXT_PRIMARY_GREEN)
                        }
                    }
                    
                    if !viewModel.reminderList.isEmpty {
                        LazyVStack {
                            ForEach(viewModel.reminderList, id: \.reminderId
                            ) { model in
                                ReminderListCell(model: model)
                            }
                        }
                    } else {
                        Text("Tekan “Tambah” untuk membuat pengingat konsumsi obat")
                            .font(.system(size: 14))
                            .foregroundColor(.TEXT_DARK_GREEN)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 40)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }.padding(.horizontal, 16)
            .onAppear {
                viewModel.getAllData()
            }
    }
}

//struct MedicineView_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicineView()
//    }
//}
