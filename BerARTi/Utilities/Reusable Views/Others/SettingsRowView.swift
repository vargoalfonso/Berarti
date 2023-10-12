//
//  SettingRowView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 17/11/22.
//

import SwiftUI

struct SettingsRowView<Content: View>: View {
    var title: String
    var subtitle: String? = nil
    var trailingView: () -> Content
    
    init(
        title: String,
        subtitle: String? = nil,
        @ViewBuilder trailingView: @escaping () -> Content = {
            Image(systemName: "chevron.right")
                .foregroundColor(.TEXT_PRIMARY_GREEN)
        }) {
        self.title = title
        self.subtitle = subtitle
        self.trailingView = trailingView
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                
                if let subtitle {
                    Text(subtitle)
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(.TEXT_GRAY)
                }
                
            }
            
            Spacer()
            
            trailingView()
        }
        .padding(.vertical, 8)
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(title: "Title", subtitle: "Subtitle")
            .previewLayout(.sizeThatFits)
    }
}
