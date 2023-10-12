//
//  InputEmotionView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 28/11/22.
//

import SwiftUI

struct InputEmotionView: View {
    private let emotionIconSize: CGFloat
    private let editIconSize: CGFloat
    private let editIconPadding: CGFloat
    private let imageName: String
    
    init(sizeMultiplier: CGFloat = 1, imageName: String = Assets.IC_ADD_EMOTION) {
        self.imageName = imageName
        
        guard sizeMultiplier <= 1 else {
            emotionIconSize = 56
            editIconSize = 15
            editIconPadding = 5
            return
        }
        
        emotionIconSize = sizeMultiplier * 56
        editIconSize = sizeMultiplier * 15
        editIconPadding = sizeMultiplier * 5
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: emotionIconSize, height: emotionIconSize)
            .aspectRatio(contentMode: .fit)
            .overlay(alignment: .bottomTrailing) {
                Image(Assets.IC_PENCIL)
                    .resizable()
                    .frame(width: editIconSize, height: editIconSize)
                    .padding(editIconPadding)
                    .aspectRatio(contentMode: .fit)
                    .background(Color.TEXT_PRIMARY_GREEN)
                    .cornerRadius(15, corners: [.allCorners])
                    .overlay {
                        RoundedRectangle(cornerRadius: editIconSize)
                            .stroke(.white, lineWidth: 1)
                    }
                    .offset(x: 4, y: 4)
            }.padding(8)
    }
}

struct InputEmotionView_Previews: PreviewProvider {
    static var previews: some View {
        InputEmotionView()
            .previewLayout(.sizeThatFits)
    }
}
