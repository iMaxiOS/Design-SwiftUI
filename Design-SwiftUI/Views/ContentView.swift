//
//  ContentView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 21.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    @State private var showCard = false
    @State private var viewState: CGSize = .zero
    @State private var bottomState: CGSize = .zero
    
    var body: some View {
        ZStack {
            
            NavigationView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .animation(Animation.linear.delay(0.05))
            
            
            CardView(title: "Design in QA", descr: "Full course", bgColor: show ? Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)) : Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), image: "3", showCard: $showCard)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -210 : -40)
                .scaleEffect(show ? 1 : 0.89)
                .shadow(radius: 20)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.difference)
                .animation(.easeInOut(duration: 0.5))
            
            CardView(title: "Design in Web", descr: "Get certificates", bgColor: show ? Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)), image: "5", showCard: $showCard)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -150 : -20)
                .scaleEffect(show ? 1 : 0.95)
                .shadow(radius: 20)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.difference)
                .animation(.easeInOut(duration: 0.3))
            
            CardView(title: "Design in SwiftUI", descr: "Certificates", bgColor: .black, image: "2", showCard: $showCard)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .shadow(radius: 20)
                .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0))
                .onTapGesture {
                    showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            viewState = value.translation
                            showCard = false
                            show = true
                        }
                        .onEnded{ _ in
                            viewState = .zero
                            show = false
                        }
                )
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.7))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
