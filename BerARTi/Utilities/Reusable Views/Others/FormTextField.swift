//
//  FormTextField.swift
//  BerARTi
//
//  Created by cleanmac-ada on 06/11/22.
//

import SwiftUI

struct FormTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.TEXT_PRIMARY_GREEN)
        }
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(placeholder: "Title", text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
