//
//  DateCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 28/11/22.
//

import SwiftUI

struct DateCell: View {
    let date: Date
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack(spacing: 2) {
            Text("\(date.toString(format: "d"))")
                .font(.system(size: 12))
                .foregroundColor(.TEXT_GRAY)
            
            Text(String(date.toString(format: "E").first!))
                .font(.system(size: 16))
                .foregroundColor(selectedDate.toString(format: "dd/MM/yyyy") == date.toString(format: "dd/MM/yyyy") ? .white : .black)
                .padding()
                .background(selectedDate.toString(format: "dd/MM/yyyy") == date.toString(format: "dd/MM/yyyy") ? Color.TEXT_PRIMARY_GREEN : Color.TEXTEDITOR_BORDER)
                .clipShape(Circle())
        }
    }
}

struct DateCell_Previews: PreviewProvider {
    static var previews: some View {
        DateCell(date: .now, selectedDate: .constant(.now))
            .previewLayout(.sizeThatFits)
    }
}
