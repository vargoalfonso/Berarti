//
//  EmotionGridCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 26/11/22.
//

import SwiftUI

struct EmotionGridCell: View {
    
    private var emotion: Emotion
    
    init(_ emotion: Emotion) {
        self.emotion = emotion
    }
    
    var body: some View {
        VStack {
            Image(emotion.imageName)
                .resizable()
                .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
                .aspectRatio(contentMode: .fit)
            
            Text(emotion.title)
                .font(.system(size: 16))
        }
    }
}

struct EmotionGridCell_Previews: PreviewProvider {
    static var previews: some View {
        EmotionGridCell(.happy)
            .previewLayout(.sizeThatFits)
    }
}
