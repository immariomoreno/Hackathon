//
//  Nivel1View.swift
//  AppMam
//
//  Created by Mario Moreno on 3/29/25.
//

import SwiftUI
struct Nivel1View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = Nivel1ViewModel()
    @State private var draggedOffsets: [UUID: CGSize] = [:]
    @State private var activeObject: UUID? = nil
    @State private var showNewImage = false //Image después de que el popup se quita
   
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Fondo
                Image("niv1-fondo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                // Personaje
                Personaje()
                
                if let firstObject = viewModel.gameObjects.first {
                    Image(firstObject.imageNamePopup)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .position(firstObject.targetPosition)
                }
                /*
                 if viewModel.gameObjects.count > 2 {
                 Image("")
                 .resizable()
                 .frame(width: 120, height: 120)
                 .position(viewModel.gameObjects[2].initialPosition)
                 }
                 */
                ForEach(viewModel.gameObjects) { object in
                    Circle()
                        .fill(Color.teal)
                        .overlay(
                            Circle().stroke(Color(#colorLiteral(red: 0.1342210174, green: 0.4771937132, blue: 0.5578050017, alpha: 1)), lineWidth: 6)
                        )
                        .frame(width: 130, height: 130)
                        .position(object.initialPosition)
                }
                
                ForEach(viewModel.gameObjects) { object in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow.opacity(0.5))
                        .position(object.targetPosition)
                }
                
                // Objetos arrastrables
                ForEach(viewModel.gameObjects) { object in
                    DraggableItemView(
                        object: object,
                        draggedOffset: Binding(
                            get: { self.draggedOffsets[object.id] ?? .zero },
                            set: { self.draggedOffsets[object.id] = $0 }
                        ),
                        isDragging: Binding(
                            get: { self.activeObject == object.id },
                            set: { if $0 { self.activeObject = object.id } else { self.activeObject = nil } }
                        ),
                        onDrop: { position in
                            viewModel.checkDrop(for: object, at: position)
                            if !viewModel.popupIsVisible {
                                self.draggedOffsets[object.id] = .zero
                            } else {
                                self.draggedOffsets[object.id] = CGSize(
                                    width: object.targetPosition.x - object.initialPosition.x,
                                    height: object.targetPosition.y - object.initialPosition.y
                                )
                            }
                        }
                    )
                    .position(object.initialPosition)
                }
                
                // Botón de regreso
//                VStack {
//                    HStack {
//                        Button(action: {
//                            // Acción para volver a la vista principal (ajústalo según tu navegación)
//                        }) {
//                            Image(systemName: "arrow.left")
//                                .padding()
//                                .background(Color.teal)
//                                .clipShape(Circle())
//                                .foregroundColor(.white)
//                        }
//                        Spacer()
//                    }
//                    Spacer()
//                }
//                .padding()
                
                // Popup
                if viewModel.popupIsVisible {
                    
                    //                    VStack {
                    //                        Text("este es el texto")
                    //                            .padding()
                    //                            .background(Color.white)
                    //                            .cornerRadius(10)
                    //                            .shadow(radius: 5)
                    VStack(spacing: -70) {
                        if viewModel.gameObjects.count == 1 {
                            Image("popup1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 620)
                        }
                        
                        if viewModel.gameObjects.count == 2 {
                            Image("popup1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 620)
                        }
                       
                        if viewModel.gameObjects.count == 3 {
                            Image("popup1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 620)
                        }
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                viewModel.popupIsVisible = false
                                showNewImage = true
                            }
                            
                            // Ocultar la nueva imagen después de 1.5 segundos
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation {
                                    showNewImage = false
                                }
                            }
                        }) {
                            Image("btn-continuar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180)
                            
                        }
                       
                    }
                }
                
                if showNewImage, let newObject = viewModel.currentObject {
                    Image(newObject.imageNameCheck)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        //.position(x: geometry.size.width / 2, y: geometry.size.height * 0.2)
                        .transition(.scale)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
        // Oculta el botón de regreso predeterminado
                .navigationBarBackButtonHidden(true)
                // Agrega un botón personalizado en la parte izquierda de la barra de navegación
                .navigationBarItems(leading: Button(action: {
                    // Regresa a la vista anterior
                    presentationMode.wrappedValue.dismiss()
                }) {
                    // Personaliza el label: puedes usar un icono, texto o ambos
                    HStack {
                        Image("back-btn")
                            .resizable()
                            .frame(width:100, height: 100)
                            .padding(.top, 80)
                    }
                })
    }
}

#Preview {
    Nivel1View()
}

