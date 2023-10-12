//
//  DetailViewArticle.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 07/11/22.
//

import Foundation
import SwiftUI

struct DetailViewArticle: View{
    let contact: ArticleFill
    var body: some View{
        VStack{
            ScrollView{
        Image(contact.Image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: .infinity, height: 300)
            .clipped()
            .shadow(radius: 3)
        Text(contact.title)
            .font(.title)
            .fontWeight(.bold)
            Text(contact.text)
                    .padding()
    }
}
    }}
struct DetailViewArticle_previews: PreviewProvider{
    static var previews: some View{
        DetailViewArticle(contact: Artfill[0])
    }
}
