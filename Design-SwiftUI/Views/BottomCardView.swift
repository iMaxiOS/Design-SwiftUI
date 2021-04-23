//
//  BottomCardView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 22.04.2021.
//

import SwiftUI

struct BottomCardView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 2.5, style: .continuous)
                .frame(width: 40, height: 5)
                .foregroundColor(.black)
                .opacity(0.1)
            
            Text("Exploring the possibilities of developing responsive design in SwiftUI")
                .foregroundColor(Color(.systemBackground))
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(5)
            
            HStack(spacing: 20) {
                RingView(colorStart: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), colorEnd: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), width: 88, height: 88, percent: 56, show: $show)
                
                VStack(alignment: .leading) {
                    Text("Design in SwiftUI")
                        .bold()
                        .foregroundColor(Color(.systemBackground))
                    
                    Text("27 of 50 lessons completed")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
            }
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView(show: .constant(false))
    }
}
