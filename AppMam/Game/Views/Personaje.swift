//
//  Personaje.swift
//  AppMam
//
//  Created by Mario Moreno on 3/27/25.
//
import SwiftUI

struct Personaje: View {
    var UISW: CGFloat = UIScreen.main.bounds.width
    var UISH: CGFloat = UIScreen.main.bounds.height

    @State private var isBreathing = false
    @State private var isBlinking = false

    var body: some View {
        ZStack {
            Group {
                Image("cabelloRecurso")
                    .offset(x: -400, y: isBreathing ? 150 : 150) // 150 / 146
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
                
                Image("orejas")
                    .offset(x: -400, y: isBreathing ? 130 + 150 : 126 + 150) // 280 / 276
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)

                Image("cabeza")
                    .offset(x: -400, y: isBreathing ? 117 + 150 : 113 + 150) // 267 / 263
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
                
                Image("cejas")
                    .offset(x: -400, y: isBreathing ? 55 + 150 : 51 + 150) // 205 / 201
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
            }

            Image("ojos")
                .opacity(isBlinking ? 0 : 1)
                .offset(x: -400, y: 110 + 150) // 260
                .scaleEffect(0.5)
            
            Image("mejillas")
                .offset(x: -400, y: isBreathing ? 142 + 150 : 138 + 150) // 292 / 288
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                .scaleEffect(0.5)
            
            Image("boca")
                .offset(x: -400, y: isBreathing ? 160 + 150 : 156 + 150) // 310 / 306
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                .scaleEffect(0.5)
           
            Image("piernaDerecha")
                .offset(x: -370, y: 421 + 150) // 571
                .scaleEffect(0.5)
            Image("piernaIzquierda")
                .offset(x: -430, y: 421 + 150) // 571
                .scaleEffect(0.5)

            ZStack {
                Image("cuerpo")
                    .scaleEffect(isBreathing ? 1.0 : 1.05)
//                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
            }
            .offset(x: -200, y: isBreathing ? 218 : 214 ) // 292 / 288

            Image("cinto")
                .offset(x: -396, y: isBreathing ? 358 + 150 : 352 + 150) // 508 / 502
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                .scaleEffect(0.5)

            ZStack {
                Image("brazoIzquierdo")
                    .scaleEffect(isBreathing ? 1.0 : 1.05)
                    .offset(y: isBreathing ? -142 : -136) // 160 / 156
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
            }
            .offset(x: isBreathing ? -230 : -224, y: isBreathing ? 160 + 150 : 156 + 150) // 310 / 306

            ZStack {
                Image("brazoDerecho")
                    .scaleEffect(isBreathing ? 1.0 : 1.05)
                    .offset(y: isBreathing ? -142  : -136) // 160 / 156
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
            }
            .offset(x: isBreathing ? -170 : -166, y: isBreathing ? 160 + 150 : 156 + 150) // 310 / 306
            
            Image("personaje-guia")
                .offset(x: -400, y: 200 + 150) // 350
                .scaleEffect(0.5)
                .opacity(0)
        }
        .ignoresSafeArea()
        .onAppear {
            isBreathing = true

            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                isBlinking = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isBlinking = false
                }
            }
        }
    }
}

#Preview {
    Personaje()
}
