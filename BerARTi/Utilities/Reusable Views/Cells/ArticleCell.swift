//
//  ArticleCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 30/11/22.
//

import SwiftUI

struct ArticleCell: View {
    let model: FunFact
    
    var body: some View {
        HStack(spacing: 12) {
            Image(Assets.ARTICLE(model.funFactId))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 135, height: 100)
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
            
            VStack(alignment: .leading, spacing: 5) {
                Text("#\(model.hashtag)")
                    .padding(.horizontal, 7)
                    .padding(.vertical, 2)
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(.TEXT_PRIMARY_GREEN))
                
                Text(model.title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.black)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }.padding(.vertical, 8)
                .padding(.trailing, 8)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }.frame(height: 100)
        
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(model: FunFact(funFactId: 1,
                                   title: "Title",
                                   hashtag: "Hashtag",
                                   content: "Content",
                                   sources: ["https://google.com"]))
        .previewLayout(.sizeThatFits)
    }
}
