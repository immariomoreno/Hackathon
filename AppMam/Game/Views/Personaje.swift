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
                    .offset(x: -400, y: isBreathing ? 0 : -4)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
                
                Image("orejas")
                    .offset(x: -400, y: isBreathing ? 130 : 126)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)

                Image("cabeza")
                    .offset(x: -400, y: isBreathing ? 117 : 113)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)

                

                

                Image("cejas")
                    .offset(x: -400, y: isBreathing ? 55 : 51)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
            }

            Image("ojos")
                .opacity(isBlinking ? 0 : 1)
                .offset(x: -400, y: 110)
               // .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isBlinking)
                .scaleEffect(0.5)
            
            Image("mejillas")
                .offset(x: -400, y: isBreathing ? 142 : 138)
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                .scaleEffect(0.5)
            
            Image("boca")
                .offset(x: -400, y: isBreathing ? 160 : 156)
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                .scaleEffect(0.5)
           
                Image("piernaDerecha")
                    .offset(x: -370, y: 421)
                    .scaleEffect(0.5)
                Image("piernaIzquierda")
                    .offset(x: -430, y: 421)
                    .scaleEffect(0.5)


            ZStack {
                Image("cuerpo")
                    .scaleEffect(isBreathing ? 1.0 : 1.05)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
            }
            .offset(x: -200, y: isBreathing ? 142 : 138)
                    

                Image("cinto")
                .offset(x: -396, y: isBreathing ? 358 : 352)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)

            ZStack {
                Image("brazoIzquierdo")
                    .scaleEffect(isBreathing ? 1.0 : 1.05)
                    .offset(y: isBreathing ? 10 : 6)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
            }.offset(x: isBreathing ? -230 : -224, y: isBreathing ? 160 : 156)

            ZStack {
                Image("brazoDerecho")
                    .scaleEffect(isBreathing ? 1.0 : 1.05)
                    .offset(y: isBreathing ? 10 : 6)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isBreathing)
                    .scaleEffect(0.5)
            }.offset(x: isBreathing ? -170 : -166, y: isBreathing ? 160 : 156)
            
               Image("personaje-guia")
                .offset(x:-400, y:200)
                .scaleEffect(0.5)
                .opacity(0)
        }
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
