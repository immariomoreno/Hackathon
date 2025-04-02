//
//  nivel1.swift
//  AppMam
//
//  Created by Mario Moreno on 3/27/25.
//

import SwiftUI

struct nivelprueba: View {
    @State var offsetFondo: CGFloat = .zero
    
    var UISW: CGFloat = UIScreen.main.bounds.width
    var UISH: CGFloat = UIScreen.main.bounds.height
    var body: some View {
        ZStack{
            Image("niv1-fondo")
                .resizable()
                .scaledToFill()
                .frame(width: UISW, height: UISH)
                //.position(x: UISW * 0.5, y: UISH * 0.5)
                .offset(x: offsetFondo)
            
            Personaje()
               
            }
        }
}

#Preview {
    nivelprueba()
}
