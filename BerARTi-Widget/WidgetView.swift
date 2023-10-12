//
//  WidgetView.swift
//  BerARTi-WidgetExtension
//
//  Created by Vargo Alfonso on 03/12/22.
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        if widgetFamily == .systemSmall {
            ZStack {
                ContainerRelativeShape()
                    .fill(.white)
                
                VStack {
                    HStack {
                        Text(entry.date.formatted(.dateTime.weekday(.wide)))
                            .bold()
                            .foregroundColor(.BUTTON_PRIMARY_BACKGROUND)
                        
                        Text(entry.date.formatted(.dateTime.day()))
                            .bold()
                            .foregroundColor(.BUTTON_PRIMARY_BACKGROUND)
                        
                    }.padding(.trailing, 35)
                    
                    Image(Assets.IC_ADD_EMOTION)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing,100)
                    
                    Text("Apa yang kamu rasain hari ini?")
                        .font(.system(size: 12))
                }
            }
        }
        if widgetFamily == .systemMedium {
            ZStack {
                ContainerRelativeShape()
                    .fill(.white)
                VStack {
                    HStack {
                        Text(entry.date.formatted(.dateTime.weekday(.wide)))
                            .bold()
                            .foregroundColor(.BUTTON_PRIMARY_BACKGROUND)
                        
                        Text(entry.date.formatted(.dateTime.day()))
                            .bold()
                            .foregroundColor(.BUTTON_PRIMARY_BACKGROUND)
                        
                    }.padding(.trailing,80)
                    
                    Image(Assets.IC_ADD_EMOTION)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 140)
                    
                    Text("Apa yang kamu rasain hari ini?")
                        .font(.system(size: 12))
                    
                }.padding()
                    .border(width: 2, edges: [.trailing], color: .BUTTON_PRIMARY_BACKGROUND)
                    .padding(.trailing,130)
                
                VStack {
                    HStack {
                        Text("Upcoming schedule")
                            .font(.system(size: 12))
                            .padding(.leading,200)
                    }.padding(.top,5)
                    
                    Text("Waktunya Minum")
                        .padding(.leading,7)
                        .border(width: 4, edges: [.leading], color: .BUTTON_PRIMARY_BACKGROUND)
                        .cornerRadius(2)
                        .padding(.leading,200)
                        .foregroundColor(.BUTTON_PRIMARY_BACKGROUND)
                        .font(.system(size: 12, weight: .bold))
                }
            }
        }
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

