//
//  CardView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 22.04.2021.
//

import SwiftUI


struct CardView: View {
    var title: String
    var descr: String
    var bgColor: Color
    var image: String
    
    @Binding var showCard: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(descr)
                        .foregroundColor(Color("Primary"))
                }
                
                Spacer()
                
                Image("Logo SwiftUI")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 110)
        }
        .frame(width: showCard ? 360 : 340, height: 220)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Design in SwiftUI", descr: "Certificates", bgColor: .black, image: "2", showCard: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
