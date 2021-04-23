//
//  RingViewCompleted.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 23.04.2021.
//

import SwiftUI

struct RingViewCompleted: View {
    var startColor = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    var endColor = Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
    var title: String
    var description: String
    var width: CGFloat = 44
    var height: CGFloat = 44
    var percent: CGFloat = 68
    
    @Binding var show: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            RingView(
                colorStart: startColor,
                colorEnd: endColor,
                width: width,
                height: height,
                percent: percent,
                show: $show
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .bold()
                
                Text(description)
                    .font(.caption)
            }
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}
