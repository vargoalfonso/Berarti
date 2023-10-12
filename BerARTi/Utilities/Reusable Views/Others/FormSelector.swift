//
//  FormSelector.swift
//  BerARTi
//
//  Created by cleanmac-ada on 06/11/22.
//

import SwiftUI

struct FormSelector: View {
    
    var title: String
    var withLeadingTitle: Bool = false
    @Binding var selectedString: String?
    var action: () -> Void = {}
    
    var body: some View {
        VStack {
            HStack {
                Text(withLeadingTitle ? title : (selectedString ?? title))
                    .font(.system(size: 17))
                    .foregroundColor(withLeadingTitle ? .black : (selectedString != nil ? .black : .TEXT_DISABLED))
                
                Spacer()
                
                if withLeadingTitle {
                    Text(selectedString ?? "")
                        .font(.system(size: 17))
                        .foregroundColor(.TEXT_DISABLED)
                }
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.TEXT_PRIMARY_GREEN)
            }.padding(.vertical, 6)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.TEXT_PRIMARY_GREEN)
        }.gesture(TapGesture().onEnded(action))
    }
}

struct FormSelector_Previews: PreviewProvider {
    static var previews: some View {
        FormSelector(title: "Title", withLeadingTitle: false, selectedString: .constant(nil))
            .previewLayout(.sizeThatFits)
    }
}
