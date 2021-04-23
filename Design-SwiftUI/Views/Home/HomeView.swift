//
//  HomeView.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 22.04.2021.
//

import SwiftUI

struct HomeView: View {
    @State private var showProfile = false
    @State private var stateProfile: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                HStack {
                    AvatarView(showProfile: $showProfile)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 30) {
                        RingViewCompleted(
                            title: "20 minutes left",
                            description: "Watching 39 minutes",
                            percent: 87,
                            show: .constant(true)
                        )
                        
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
                    .padding([.top, .horizontal], 30)
                    .padding(.bottom, 40)
                })
                
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 20) {
                        ForEach(sections) { card in
                            GeometryReader { reader in
                                SectionView(section: card)
                                    .rotation3DEffect(Angle(degrees: Double(reader.frame(in: .global).minX - 30) / -20),
                                                      axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                })
                .offset(y: -40)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: showProfile ? -Double(stateProfile.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .ignoresSafeArea(.all, edges: .all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: stateProfile.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            stateProfile = value.translation
                            if stateProfile.height > 50 {
                                showProfile = false
                            }
                        }
                        .onEnded { _ in
                            stateProfile = .zero
                        }
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
