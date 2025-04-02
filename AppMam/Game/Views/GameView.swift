//
//  GameView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/1/25.
//

import SwiftUI

struct GameView: View {
    @State private var isFloating = false
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                ZStack {
                    // Fondo
                    Color(#colorLiteral(red: 0.1568627451, green: 0.7921568627, blue: 0.8980392157, alpha: 1)).ignoresSafeArea()
                    Image("mapa")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(1.1)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: isFloating ? -6 : 6)
                        .animation(
                            Animation.easeInOut(duration: 2)
                                .repeatForever(autoreverses: true),
                            value: isFloating
                        )
                    
                    Image("Rocas")
                        .resizable()
                        .scaledToFit()
//                        .scaleEffect(1.1)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: isFloating ? -4 : 4)
                        .animation(
                            Animation.easeInOut(duration: 2)
                                .repeatForever(autoreverses: true),
                            value: isFloating
                        )
                        
                    
                    NavigationLink(destination: Nivel1View()) {
                        Image("nivel1-btn")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .position(x:400, y:400)
                            .offset(y: isFloating ? -6 : 6)
                            .animation(
                                Animation.easeInOut(duration: 2)
                                    .repeatForever(autoreverses: true),
                                value: isFloating
                            )
                        
                    }
                }
                .onAppear {
                    isFloating.toggle()
                }
                }

            
        }
        .navigationViewStyle(.stack)
    }
            
}

#Preview {
    GameView()
}
