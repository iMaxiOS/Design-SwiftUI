//
//  SectionView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 23.04.2021.
//

import SwiftUI

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("Logo SwiftUI")
            }
            
            Text(section.lesson.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(section.image)
                .resizable()
                .scaledToFit()
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.bgColor)
        .cornerRadius(20)
        .shadow(color: section.bgColor.opacity(0.5), radius: 20, x: 0, y: 20)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: sections[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
