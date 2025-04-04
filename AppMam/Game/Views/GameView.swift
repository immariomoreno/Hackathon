//
//  GameView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/1/25.
//
/*
import SwiftUI

struct GameView: View {
    @State private var isFloating = false
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    // Fondo
                    Color(#colorLiteral(red: 0.1568627451, green: 0.7921568627, blue: 0.8980392157, alpha: 1))
                        .ignoresSafeArea()
                    Image("mapa")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(1.1)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: isFloating ? -6 : 6)
                        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    Image("Rocas")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: isFloating ? -4 : 4)
                        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    
                    // Primer botón (Nivel1View)
                    NavigationLink(destination: Nivel1View()) {
                        Image("nivel1-btn")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(y: isFloating ? -6 : 6)
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 120, height: 120)  // Asegura el área de toque
                    .position(x: 400, y: 400)
                    
                    // Segundo botón (IdentificaView)
                    NavigationLink(destination: IdentificaView()) {
                        Image("nivel1-btn")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(y: isFloating ? -6 : 6)
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 120, height: 120)
                    .position(x: 490, y: 600)
                }
                .onAppear {
                    isFloating.toggle()
                    SoundManager.instance.playSoundLoop(sound: .mapaJuego)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
            
}
*/

import SwiftUI

struct GameView: View {
    @State private var isFloating = false
    @State private var nubeOffset: CGFloat = 0

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    // Fondo
                    Color(#colorLiteral(red: 0.1568627451, green: 0.7921568627, blue: 0.8980392157, alpha: 1))
                        .ignoresSafeArea()

                   

                    Image("mapa")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(1.1)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: isFloating ? -6 : 6)
                        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)

                    Image("Rocas")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: isFloating ? -4 : 4)
                        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    
                   
                    // Nubes animadas
                    Image("nubes")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: nubeOffset)
                        
                    // Primer botón (Nivel1View)
                    NavigationLink(destination: Nivel1View()) {
                        Image("nivel1-btn")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(y: isFloating ? -6 : 6)
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 120, height: 120)
                    .position(x: 400, y: 400)

                    // Segundo botón (IdentificaView)
                    NavigationLink(destination: IdentificaView()) {
                        Image("cara-nina")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(y: isFloating ? -6 : 6)
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 120, height: 120)
                    .position(x: 490, y: 600)
                    
                    // tercer botón (IdentificaView)
                    NavigationLink(destination: Nivel3View()) {
                        Image("iconoMod3")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(y: isFloating ? -6 : 6)
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 120, height: 120)
                    .position(x: 610, y: 300)

                }
                .onAppear {
                    isFloating.toggle()
                    SoundManager.instance.playSoundLoop(sound: .mapaJuego)
                    animateNubes(screenWidth: geometry.size.width)
                }
            }
        }
        .navigationViewStyle(.stack)
    }

    // Animación de las nubes
    func animateNubes(screenWidth: CGFloat) {
        nubeOffset = screenWidth
        withAnimation(Animation.linear(duration: 40).repeatForever(autoreverses: false)) {
            nubeOffset = -screenWidth
        }
    }
}



#Preview {
    GameView()
}
