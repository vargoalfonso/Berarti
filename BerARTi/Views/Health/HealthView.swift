//
//  HealthView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 26/11/22.
//

import SwiftUI

struct HealthView: View {
    @State private var segmentedPage: Int = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.NAVIGATION_BAR_BACKGROUND)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $segmentedPage) {
                    Text("Vital").tag(0)
                    Text("Obat").tag(1)
                    Text("Janji Temu").tag(2)
                }.pickerStyle(.segmented)
                    .padding(.vertical, 9)
                    .padding(.horizontal, 16)
                
                TabView(selection: $segmentedPage) {
                    VitalView()
                        .tag(0)
                    
                    MedicineView()
                        .tag(1)
                    
                    AppointmentView()
                        .tag(2)
                }.tabViewStyle(.page)
            }
            .navigationTitle(
                Text("Kesehatan")
            )
            .navigationBarTitleTextColor(.NAVIGATION_TITLE)
            /*
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "clock.arrow.circlepath")
                            .foregroundColor(.black)
                    })
                }
            }
            */
        }
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
