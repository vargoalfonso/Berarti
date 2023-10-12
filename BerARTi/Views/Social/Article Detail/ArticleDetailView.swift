//
//  ArticleDetailView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 30/11/22.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    let model: FunFact
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text(model.title)
                    .font(.system(size: 30, weight: .semibold))
                    .multilineTextAlignment(.leading)
                
                /*
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(hex: "E2F5F8"))
                    
                    Image(Assets.IC_LOGO)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 65)
                }.frame(height: 188)
                 */
                
                Image(Assets.ARTICLE(model.funFactId))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 188)
                
                Text(model.content)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.leading)
                
                VStack(alignment: .leading) {
                    Text("Sumber :")
                        .padding(.bottom, 2)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                    
                    ForEach(model.sources, id: \.self) { link in
                        Link(destination: URL(string: link)!) {
                            Text(link)
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .underline()
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 1)
                        }
                    }
                }
                
                EmptySpacer(height: 100)
                
            }.padding(.horizontal, 18)
                .padding(.top, 20)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }.navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Artikel")
                        .bold()
                        .foregroundColor(.NAVIGATION_TITLE)
                        .fixedSize(horizontal: true, vertical: false)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.NAVIGATION_TITLE)
                    })
                }
            }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArticleDetailView(model: FunFact(funFactId: 1,
                                             title: "Title",
                                             hashtag: "Hashtag",
                                             content: "Content", sources: ["https://google.com", "https://facebook.com"]))
        }
    }
}
