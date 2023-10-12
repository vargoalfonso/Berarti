//
//  ReminderListCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 30/11/22.
//

import SwiftUI

struct ReminderListCell: View {
    let model: ReminderModel
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: 16) {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
                    .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1.5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(model.arvModel.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    Text("1 pill")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.TEXT_GRAY)
                }
                
                Spacer()
                
                Text(model.date.toString(format: "hh:mm aa"))
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.TEXT_DARK_GREEN)
            }
        }.padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 30))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .frame(height: 81)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.TEXT_PRIMARY_GREEN))
    }
}

struct ReminderListCell_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListCell(model: ReminderModel(reminderId: UUID(),
                                              medicineId: UUID(),
                                              arvId: 11,
                                              hour: 22,
                                              minute: 10,
                                              remindBefore: 5))
        .previewLayout(.sizeThatFits)
    }
}
