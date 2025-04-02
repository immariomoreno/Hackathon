//
//  ManView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/1/25.
//

import SwiftUI

struct ManView: View {
    var body: some View {
        NavigationView {
           NavigationLink("Hi", destination: MyOtherScreen())
                .position(x:300, y:300)
            
        }
        .navigationViewStyle(.stack)
    }
}

struct MyOtherScreen: View {
    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
        }.ignoresSafeArea()
    }
}

struct MyOtherScreen2: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2)
        }.ignoresSafeArea()
    }
}

struct MyOtherScreen3: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.2)
        }.ignoresSafeArea()
    }
}

#Preview {
    ManView()
}
