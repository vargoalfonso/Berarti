//
//  SocialBannerView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 02/12/22.
//

import SwiftUI

struct SocialBannerView: View {
    let page: Int
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(Assets.BANNER(page))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .black))
                .padding(.bottom, 36)
                .padding(.leading, 16)
                .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1.5)
        }
    }
    
    private var title: String {
        switch page {
        case 1:
            return "Tersambung dengan komunitas"
        case 2:
            return "Berbagi pengalaman dan kisah mu!"
        case 3:
            return "Lebih dekat dengan komunitas"
        default:
            return ""
        }
    }
}

struct SocialBannerView_Previews: PreviewProvider {
    static var previews: some View {
        SocialBannerView(page: 1)
            .previewLayout(.sizeThatFits)
    }
}
