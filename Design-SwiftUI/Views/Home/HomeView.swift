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
    @State private var showContent = false
    
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
                .padding(.leading, 5)
                .padding(.top, 30)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        RingsView(showContent: $showContent)
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
                        .padding(20)
                        .padding(.bottom, 30)
                    })
                    .offset(y: -40)
                    
                    VStack {
                        HStack {
                            Text("Courses")
                                .font(.title)
                                .bold()
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        SectionView(section: sections[4], width: screen.width - 40, height: 275)
                    }
                    .offset(y: -60)
                })
            }
            .padding(.top, 30)
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
            
            if showContent {
                ContentView()
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            showContent = false
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .clipShape(Circle())
                                .shadow(color: .black, radius: 3, x: 0, y: 1)
                        })
                    }
                    .padding([.horizontal])
                    
                    Spacer()
                }
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
