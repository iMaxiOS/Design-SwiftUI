//
//  NavigationView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 22.04.2021.
//

import SwiftUI


struct NavigationView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                
                Spacer()
                
                Image("playstore")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
