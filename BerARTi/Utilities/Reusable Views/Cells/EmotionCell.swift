//
//  EmotionCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import SwiftUI

struct EmotionCell: View {
    
    var model: EmotionModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(model.emotion.imageName)
                .resizable()
                .frame(width: 45, height: 45)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 14) {
                Text("\(model.emotion.title), \(model.timestamp.toString(format: "hh:mm aa"))")
                
                HStack(spacing: 19) {
                    ProgressView(value: CGFloat(model.intensity), total: 10)
                        .progressViewStyle(.linear)
                        .tint(Color.TEXT_PRIMARY_GREEN)
                    
                    Text("\(model.intensity)/10")
                        .font(.system(size: 10))
                }
                
                if !model.story.isEmpty {
                    Text(model.story)
                        .font(.system(size: 13))
                }
            }
        }.padding()
    }
}

struct EmotionCell_Previews: PreviewProvider {
    static var previews: some View {
        EmotionCell(model: EmotionModel(emotionId: UUID(),
                                        emotionTypeId: Emotion.happy.rawValue,
                                        intensity: 7,
                                        story: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non volutpat nibh. Ut eget tellus gravida, congue arcu in",
                                        timestamp: .now))
            .previewLayout(.sizeThatFits)
    }
}
