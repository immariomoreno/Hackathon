//
//  SwiftUIView.swift
//  AppMam
//
//  Created by Mario Moreno on 3/28/25.
//

import SwiftUI

public struct DragGestureComponent: View {
    
    @State private var location: CGPoint = CGPoint(x: 125, y: 119)
    @State var isDragging = false
    
    private var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
                self.isDragging = true
                print("Posición del círculo: \(value.location)")
            }
            .onEnded {_ in self.isDragging = false}
    }
    
    public init() {}
    public var body: some View {
        GeometryReader { proxy in
            VStack {
                Text("Posición: \(Float(location.x)), \(Float(location.y))")
                    .font(.headline)
                    .padding()
                Circle()
                    .fill(self.isDragging ? Color.cyan : Color.black.opacity(0.5))
                    .frame(width: 160, height: 160)
                    .overlay(
                        Text("Arrástrame")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                    )
                    .scaleEffect(isDragging ? 1.1 : 1.0)
                    .position(location)
                    .animation(.spring(), value: isDragging)
                    .gesture(drag)
                    .onAppear {
                        DispatchQueue.main.async {
                            let relativeX: CGFloat = 82 / 768.0
                            let relativeY: CGFloat = 240 / 1024.0
                            location = CGPoint(x: proxy.size.width * relativeX, y: proxy.size.height * relativeY)
                        }
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    DragGestureComponent()
}
