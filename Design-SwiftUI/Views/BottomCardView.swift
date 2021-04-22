//
//  BottomCardView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 22.04.2021.
//

import SwiftUI

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 2.5, style: .continuous)
                .frame(width: 40, height: 5)
                .opacity(0.1)
            
            Text("Exploring the possibilities of developing responsive design in SwiftUI")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(5)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("Background 3"))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView()
    }
}
