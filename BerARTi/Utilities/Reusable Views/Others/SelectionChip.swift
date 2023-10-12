//
//  SelectionChip.swift
//  BerARTi
//
//  Created by cleanmac-ada on 05/11/22.
//

import SwiftUI

struct SelectionChip: View {
    
    var title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 17))
            .padding(.horizontal)
            .frame(height: 30)
            .background(Color.NAVIGATION_BAR_BACKGROUND.opacity(isSelected ? 1 : 0.1))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(4)
    }
}

struct SelectionChip_Previews: PreviewProvider {
    static var previews: some View {
        SelectionChip(title: "Something", isSelected: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
