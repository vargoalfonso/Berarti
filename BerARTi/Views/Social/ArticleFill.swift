//
//  ArticleFill.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 07/11/22.
//

import Foundation
import SwiftUI

struct ArticleFill: Identifiable{
    let Image: String
    let title: String
    let text: String
    let id = UUID()
}

let Artfill = [
 ArticleFill(Image: "0", title: "LoremIpsum1", text: "loremipsum1"),
 ArticleFill(Image: "1", title: "LoremIpsum2", text: "loremipsum2"),
 ArticleFill(Image: "3", title: "LoremIpsum3", text: "loremipsum3")
]

