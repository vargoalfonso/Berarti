//
//  VitalDataCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 02/12/22.
//

import SwiftUI

struct VitalDataCell: View {
    
    let type: VitalType
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 19) {
            HStack {
                Image(systemName: type.icon)
                    .resizable()
                    .frame(width: 21, height: 21)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(type.colorTint)
                
                Text(type.title)
                    .foregroundColor(type.colorTint)
                    .font(.system(size: 16, weight: .bold))
            }
            
            HStack(alignment: .bottom) {
                Text(value)
                    .font(.system(size: 28, weight: .bold))
                
                Text(type.unit)
                    .foregroundColor(.TEXT_GRAY)
                    .font(.system(size: 15, weight: .bold))
            }
        }.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 30))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.TEXT_PRIMARY_GREEN))
    }
}

struct VitalDataCell_Previews: PreviewProvider {
    static var previews: some View {
        VitalDataCell(type: .heartRate,
                      value: "100")
            .previewLayout(.sizeThatFits)
    }
}
