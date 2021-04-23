//
//  RingsView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 23.04.2021.
//

import SwiftUI

struct RingsView: View {
    @Binding var showContent: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            RingViewCompleted(
                title: "20 minutes left",
                description: "Watching 39 minutes",
                percent: 87,
                show: .constant(true)
            )
            .onTapGesture {
                showContent = true
            }
            
            RingViewCompleted(
                startColor: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
                endColor: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)),
                title: "12 minutes left",
                description: "Watching 55 minutes",
                width: 32,
                height: 32,
                percent: 63,
                show: .constant(true)
            )
            
            RingViewCompleted(
                startColor: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),
                endColor: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
                title: "17 minutes left",
                description: "Watching 35 minutes",
                width: 32,
                height: 32,
                percent: 35,
                show: .constant(true)
            )
        }
        .padding([.top, .horizontal], 20)
        .padding(.bottom, 40)
    }
}
