//
//  ReminderCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/10/22.
//

import SwiftUI

struct ReminderCell: View {
    
    let model: ReminderModel
    let isFinished: Bool
    var finishAction: (ReminderModel) -> Void = { _ in }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.date.toString(format: "hh:mm aa"))
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.TEXT_DARK_GREEN)
            
            HStack(alignment: .top, spacing: 16) {
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
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.TEXT_PRIMARY_GREEN, lineWidth: 4)
                    .frame(width: 28, height: 28)
                    .overlay {
                        if isFinished {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.TEXT_PRIMARY_GREEN)
                        }
                    }
                    .onTapGesture {
                        if !isFinished {
                            finishAction(model)
                        }
                    }
            }
        }.padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 30))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.TEXT_PRIMARY_GREEN))
        
    }
}

struct ReminderCell_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCell(model: ReminderModel(reminderId: UUID(),
                                          medicineId: UUID(),
                                          arvId: 11,
                                          hour: 22,
                                          minute: 10,
                                          remindBefore: 5), isFinished: false)
            .previewLayout(.sizeThatFits)
    }
}
