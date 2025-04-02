//
//  DraggableItemView.swift
//  AppMam
//
//  Created by Mario Moreno on 3/29/25.
//

import SwiftUI
/*
struct DraggableItemView: View {
    @Binding var object: GameObject
    let index: Int
    @ObservedObject var viewModel: GameLevel1ViewModel
    
    var body: some View {
      

        
        Image(object.imageName)
            .resizable()
            .frame(width: 60, height: 60)
            //.offset(x: object.offset.width, y: object.offset.height)
            .position(
                x: object.initialPosition.x + object.offset.width,
                y: object.initialPosition.y + object.offset.height
            )

            .gesture(
                DragGesture()
                    .onChanged { value in
                        // Actualiza la posición mientras se arrastra
                        object.offset = CGSize(
                            width: value.translation.width,
                            height: value.translation.height
                        )
                    }
                    .onEnded { value in
                        // Cuando se suelta, avisamos al ViewModel
                        viewModel.onItemDropped(object, finalOffset: value.translation, index: index)
                    }
            )
    }
}
*/

import SwiftUI

struct DraggableItemView: View {
    let object: GameObject
    @Binding var draggedOffset: CGSize
    @Binding var isDragging: Bool
    let onDrop: (CGPoint) -> Void
    
    var body: some View {
        Image(object.imageName)
            .resizable()
            .frame(width: 80, height: 80)
            .scaleEffect(isDragging ? 1.2 : 1.0)
            .offset(draggedOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggedOffset = value.translation
                        isDragging = true
                    }
                    .onEnded { value in
                        let dropPosition = CGPoint(
                            x: object.initialPosition.x + value.translation.width,
                            y: object.initialPosition.y + value.translation.height
                        )
                        onDrop(dropPosition)
                        if !isDragging {
                            withAnimation {
                                draggedOffset = .zero
                            }
                        }
                        isDragging = false
                    }
            )
            .animation(.spring(), value: draggedOffset)
    }
}

/*
#Preview {
    DraggableItemView()
}
*/
