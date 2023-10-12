//
//  MedicineStockCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 28/10/22.
//

import SwiftUI

struct MedicineStockCell: View {
    
    var model: MedicineModel
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1.5)
                    
                    Text("1 pill")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.TEXT_DARK_GREEN)
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.white)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(model.arvModel.name)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    HStack {
                        Text("0 g")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundColor(.TEXT_DARK_GREEN)

                        Spacer()

                        Text("2/10")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundColor(.TEXT_GRAY)
                    }
                }.frame(minWidth: 0, maxWidth: .infinity)
            }
            
            Button(action: {
                
            }, label: {
                Image(systemName: "")
            })
        }.padding(.horizontal, 6)
            .frame(width: 116, height: 130)
            .background(Color.CARD_BACKGROUND)
            .cornerRadius(8)
    }
}

struct MedicineStockCell_Previews: PreviewProvider {
    static var previews: some View {
        MedicineStockCell(model: MedicineModel(id: UUID(),
                                               type: .unit,
                                               arvId: 11,
                                               frequency: 3,
                                               remindBefore: 5))
            .previewLayout(.sizeThatFits)
    }
}
