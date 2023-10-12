//
//  Quote.swift
//  BerARTi
//
//  Created by cleanmac-ada on 29/11/22.
//

import Foundation

struct Quote: Codable {
    var emotionId: Int
    var author: String
    var quote: String
    
    private enum CodingKeys: String, CodingKey {
        case emotionId = "emotion_id"
        case author
        case quote
    }
}
