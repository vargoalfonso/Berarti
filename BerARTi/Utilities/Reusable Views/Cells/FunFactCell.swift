//
//  FunFactCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 26/11/22.
//

import SwiftUI

struct FunFactCell: View {
    let model: FunFact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(Assets.ARTICLE(model.funFactId))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 157, height: 103)
                .cornerRadius(10, corners: .allCorners)
                /*
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(hex: "E2F5F8"))
                        
                        Image(Assets.IC_LOGO)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 65)
                    }
                }
                */
            
            Text("#\(model.hashtag)")
                .padding(.horizontal, 7)
                .font(.system(size: 11))
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.TEXT_PRIMARY_GREEN))
            
            Text(model.title)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
//                .fixedSize(horizontal: false, vertical: true)
//                .frame(maxWidth: .infinity, alignment: .topLeading)
//                .frame(height: 45)
                .lineLimit(3)
            
            Spacer()
        }.frame(maxWidth: 157, alignment: .leading)
            .frame(height: 175)
            
    }
}

struct FunFactCell_Previews: PreviewProvider {
    static var previews: some View {
        FunFactCell(model: FunFact(funFactId: 1,
                                   title: "Title",
                                   hashtag: "Hashtag",
                                   content: "Content",
                                   sources: ["https://google.com"]))
            .previewLayout(.sizeThatFits)
    }
}
