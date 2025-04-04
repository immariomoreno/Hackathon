//
//  ManView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/1/25.
//

import SwiftUI

struct ManView: View {
    @State private var selectedIndex = 0
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 57 / 255, green: 121 / 255, blue: 91 / 255), location: 0.3),
                .init( color: Color.white, location: 0.3),
            ], center: .top, startRadius: 600, endRadius: 800)
            
            VStack {
                Text("Bienvenido  a AppMam")
                    .font(.custom("LuckiestGuy-Regular", size: 68))
                
//                Spacer()
            }
         
        }.ignoresSafeArea()
    }
}



#Preview {
    ManView()
}
