//
//  BerARTi_Widget.swift
//  BerARTi-Widget
//
//  Created by Vargo Alfonso on 03/12/22.
//

import WidgetKit
import SwiftUI

struct BerARTi_Widget: Widget {
    let kind: String = "BerARTi_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}
