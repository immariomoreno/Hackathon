//
//  Nivel3View.swift
//  Onura
//
//  Created by Mario Moreno on 4/3/25.
//

import SwiftUI

struct Nivel3View: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Fondo
                Image("mod3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Nivel3View()
}
