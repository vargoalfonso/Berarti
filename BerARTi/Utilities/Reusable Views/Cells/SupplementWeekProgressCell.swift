//
//  SuplementWeekProgressCell.swift
//  BerARTi
//
//  Created by cleanmac-ada on 26/11/22.
//

import SwiftUI

struct SupplementWeekProgressCell: View {
    
    let day: SupplementWeekday
    let progress: Double
    
    init(day: SupplementWeekday, progress: Double = 0) {
        self.day = day
        guard progress <= 1 else {
            self.progress = 1
            return
        }
        self.progress = progress
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Text(day.title)
                .font(.system(size: 12))
                .foregroundColor(.TEXT_GRAY)
            
            ZStack {
                Path { path in
                    let width: CGFloat = min(38, 38)
                    let height = width
                    
                    let center = CGPoint(x: width * 0.5, y: height * 0.5)
                    
                    path.move(to: center)
                    path.addArc(
                        center: center,
                        radius: width * 0.5,
                        startAngle: Angle(degrees: -90.0) + Angle(degrees: 0.0),
                        endAngle: Angle(degrees: -90.0) + Angle(degrees: (progress * 360)),
                        clockwise: false)
                    
                }
                .fill(Color.TEXT_PRIMARY_GREEN)
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 38, height: 38)
                
                Circle()
                    .strokeBorder(Color.TEXT_PRIMARY_GREEN, lineWidth: 1)
                    .foregroundColor(.white)
                    .frame(width: 38, height: 38)
            }
        }
    }
}

struct SupplementWeekProgressCell_Previews: PreviewProvider {
    static var previews: some View {
        SupplementWeekProgressCell(day: .mon)
            .previewLayout(.sizeThatFits)
        
    }
}
