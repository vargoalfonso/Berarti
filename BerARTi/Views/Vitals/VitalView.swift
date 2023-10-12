//
//  BloodResultView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 31/10/22.
//

import SwiftUI
import HealthKit

struct VitalView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = VitalViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hasil Darah")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.TEXT_DARK_GREEN)
                        
                        Spacer()
                        
                        NavigationLink(destination: AddBloodResultView()) {
                            Text("Tambah")
                                .font(.system(size: 14))
                                .foregroundColor(.TEXT_PRIMARY_GREEN)
                        }
                    }
                    
                    if !viewModel.bloodResultList.isEmpty {
                        LazyVStack(spacing: 10) {
                            ForEach(viewModel.bloodResultList, id: \.bloodResultId) { model in
                                BloodResultCell(model: model)
                            }
                        }
                    } else {
                        Text("Tekan “Tambah” untuk membuat ringkasan hasil darah")
                            .font(.system(size: 14))
                            .foregroundColor(.TEXT_DARK_GREEN)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 40)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Data Terkini")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    LazyVStack {
                        if let heartRateData = viewModel.healthManager.heartRateData {
                            VitalDataCell(type: .heartRate, value: HealthDataCalculator.calculateHeartRateValue(heartRateData))
                        }
                        
                        if let oxygenSaturationData = viewModel.healthManager.oxygenSaturationData {
                            VitalDataCell(type: .oxygenSaturation, value: HealthDataCalculator.calculateOxygenSaturationValue(oxygenSaturationData))
                        }
                        
                        if let systolic = viewModel.healthManager.bloodPressureSystolicData, let diastolic = viewModel.healthManager.bloodPressureDiastolicData {
                            VitalDataCell(type: .bloodPressureSystolic, value: HealthDataCalculator.calculateBloodPressureValue(systolic, diastolic))
                        }
                        
                        if let respiratoryRateData = viewModel.healthManager.respiratoryRateData {
                            VitalDataCell(type: .respiratoryRate, value: HealthDataCalculator.calculateRespiratoryRateValue(respiratoryRateData))
                        }
                    }
                }
                
                EmptySpacer(height: 100)
            }.padding(.horizontal, 16)
                .onAppear {
                    viewModel.getAllData()
                }
        }
    }
}

struct BloodResultView_Previews: PreviewProvider {
    static var previews: some View {
        VitalView()
    }
}
