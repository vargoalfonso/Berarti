//
//  DashboardAppointmentCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 28/10/22.
//

import SwiftUI

struct DashboardAppointmentCell: View {
    
    var model: AppointmentModel
    
    var body: some View {
        HStack(spacing: 27) {
            VStack(spacing: 5) {
                Text(model.date.toString(format: "MMMM"))
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.TEXT_DARK_GREEN)
                
                Text(model.date.toString(format: "dd"))
                    .font(.system(size: 30,weight: .heavy))
                    .foregroundColor(.TEXT_PRIMARY_GREEN)
                
                Text(model.date.toString(format: "EEE"))
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.TEXT_DARK_GREEN)
            }
            
            Rectangle()
                .frame(width: 1)
                .foregroundColor(.CARD_BACKGROUND)
            
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Waktu")
                        .font(.system(size: 11))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    Text(model.time.toString(format: "h:mm a"))
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.TEXT_PRIMARY_GREEN)
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.CARD_BACKGROUND)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Jenis Janji Temu")
                        .font(.system(size: 11))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    Text(model.name)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.TEXT_PRIMARY_GREEN)
                }
            }
            
        }.padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 13))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 102, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.TEXT_PRIMARY_GREEN))
    }
}

struct DashboardAppointmentCell_Previews: PreviewProvider {
    static var previews: some View {
        DashboardAppointmentCell(model: AppointmentModel(appointmentId: UUID(),
                                                         name: "Check-up",
                                                         date: .now,
                                                         time: .now,
                                                         addToCalendar: true))
            .previewLayout(.sizeThatFits)
    }
}
