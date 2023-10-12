//
//  AppointmentView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

struct AppointmentView: View {
    
    @StateObject private var viewModel = AppointmentViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Janji Temu")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    Spacer()
                    
                    NavigationLink(destination: AddAppointmentView()) {
                        Text("Tambah")
                            .font(.system(size: 14))
                            .foregroundColor(.TEXT_PRIMARY_GREEN)
                    }
                }
                
                if !viewModel.appointmentList.isEmpty {
                    LazyVStack {
                        ForEach(viewModel.appointmentList, id: \.appointmentId
                        ) { model in
                            DashboardAppointmentCell(model: model)
                        }
                    }
                } else {
                    Text("Tekan “Tambah” untuk membuat pengingat janji temu ")
                        .font(.system(size: 14))
                        .foregroundColor(.TEXT_DARK_GREEN)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 40)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
            }
        }.padding(.horizontal, 16)
            .onAppear {
                viewModel.getAllData()
            }
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
