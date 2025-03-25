//
//  ContentView.swift
//  AppMam
//
//  Created by Mario Moreno on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.custom("LuckiestGuy-Regular", size: 54))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
