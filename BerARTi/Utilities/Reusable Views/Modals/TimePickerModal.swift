//
//  TimePickerModal.swift
//  BerARTi
//
//  Created by cleanmac-ada on 13/11/22.
//

import SwiftUI

struct TimePickerModal: View {
    @Binding var isPresented: Bool
    var onSave: (Int, Int) -> Void = { _, _ in }
    
    @State private var hour: Int = 0
    @State private var minute: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button("Batal") {
                    withAnimation {
                        self.isPresented = false
                    }
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.TEXT_PRIMARY_GREEN)
                
                Spacer()
                
                Text("Atur Waktu")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color.TEXT_DARK_GREEN)
                
                Spacer()
                
                Button("Simpan") {
                    withAnimation {
                        self.isPresented = false
                    }
                    self.onSave(hour, minute)
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.TEXT_PRIMARY_GREEN)
            }
            .padding(.vertical)
            .padding(.horizontal)
            
            HStack {
                Spacer()
                
                Picker("", selection: $hour) {
                    ForEach(0...23, id: \.self) { value in
                        Text(String(format: "%02d", value))
                    }
                }.pickerStyle(.wheel)
                    .frame(width: 150)
                    .clipped()
                
                Picker("", selection: $minute) {
                    ForEach(0...59, id: \.self) { value in
                        Text(String(format: "%02d", value))
                    }
                }.pickerStyle(.wheel)
                    .frame(width: 150)
                    .clipped()
                
                Spacer()
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.white)
    }
}

struct TimePickerModal_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerModal(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
