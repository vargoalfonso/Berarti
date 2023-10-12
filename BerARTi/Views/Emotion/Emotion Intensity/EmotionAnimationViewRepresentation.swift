//
//  EmotionAnimationViewRepresentation.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import SwiftUI

struct EmotionAnimationViewRepresentation: UIViewRepresentable {
    private var emotionView: EmotionAnimationView
    private let emotion: Emotion
    private var onProgressUpdated: (CGFloat) -> Void
    
    init(_ emotion: Emotion, onProgressUpdated: @escaping (CGFloat) -> Void = { _ in }) {
        self.emotion = emotion
        self.onProgressUpdated = onProgressUpdated
        self.emotionView = EmotionAnimationView(fileName: Assets.ANIMATION_EMOTION_LEVEL(emotion), initialProgress: 0)
    }
    
    func makeUIView(context: Context) -> some UIView {
        emotionView.setOnProgressUpdateHanlder(onProgressUpdated)
        return emotionView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Do nothing
    }
}
