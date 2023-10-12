//
//  BloodResultCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/10/22.
//

import SwiftUI

struct BloodResultCell: View {
    
    var model: BloodResultModel
    
    var body: some View {
        VStack {
            HStack(spacing: 90) {
                VStack {
                    Image(model.stage.icon)
                        .resizable()
                        .frame(width: 55, height: 78)
                        .aspectRatio(contentMode: .fit)
                    
                    Text(model.stage.title)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.TEXT_DARK_GREEN)
                }
                
                VStack(alignment: .leading) {
                    Text("CD4")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    Text(model.cd4Amount != 0 ? "\(model.cd4Amount)" : "--")
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Text("Viral Load")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.TEXT_DARK_GREEN)
                    
                    Text(model.viralLoadAmount != 0 ? "\(model.viralLoadAmount)" : "--")
                        .font(.system(size: 20, weight: .semibold))
                }
            }
            
            Rectangle()
                .frame(minHeight: 1, maxHeight: 1)
                .foregroundColor(.TEXT_PRIMARY_GREEN)
            
            Text("Tes pada \(model.testDate.toString(format: "dd/MM/yyyy"))")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.TEXT_DARK_GREEN)
        }.padding(.horizontal, 36)
            .padding(.vertical, 24)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
            .background(Color.CARD_BACKGROUND)
    }
}

struct BloodResultCell_Previews: PreviewProvider {
    static var previews: some View {
        BloodResultCell(model: BloodResultModel(bloodResultId: UUID(), testDate: .now, testTime: .now, cd4Amount: 100, viralLoadAmount: 600))
            .previewLayout(.sizeThatFits)
    }
}
