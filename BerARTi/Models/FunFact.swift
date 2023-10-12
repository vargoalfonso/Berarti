//
//  FunFact.swift
//  BerARTi
//
//  Created by cleanmac-ada on 30/11/22.
//

import Foundation

struct FunFact: Codable {
    var funFactId: Int
    var title: String
    var hashtag: String
    var content: String
    var sources: [String]
    
    private enum CodingKeys: String, CodingKey {
        case funFactId = "fun_fact_id"
        case title
        case hashtag
        case content
        case sources
    }
}
