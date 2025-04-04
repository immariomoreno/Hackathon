//
//  Nivel1ViewModel.swift
//  AppMam
//
//  Created by Mario Moreno on 3/29/25.
//

import SwiftUI
/*
class GameLevel1ViewModel: ObservableObject {
    
    @Published var objects: [GameObject] = []
    
    // Para mostrar popup con la info del objeto
    @Published var showPopup: Bool = false
    @Published var selectedObject: GameObject? = nil
    
    init() {
        // Inicializa tus objetos.
        // Ajusta nameInMam, nameInSpanish, description, etc. según tu caso real.
        objects = [
            GameObject(
                nameInMam: "Ka'",
                nameInSpanish: "Metate",
                imageName: "metate",
                imageNamePopup: "metate-popup",
                description: "Este objeto es usado en la elaboración del nixtamal...",
                initialPosition: CGPoint(x: 100, y: 200),
                targetPosition: CGPoint(x: 600, y: 600)
            ),
            GameObject(
                nameInMam: "Nombre Mam 2",
                nameInSpanish: "Nombre Español 2",
                imageName: "ollaBarro",
                imageNamePopup: "ollaBarro-popup",
                description: "Descripción del objeto 2",
                initialPosition: CGPoint(x: 100, y: 200),
                targetPosition: CGPoint(x: 800, y: 650)
            ),
            // ... Agrega los otros 2 objetos
        ]
    }
    
    /// Se llama cuando el usuario termina de arrastrar un objeto
    func onItemDropped(_ item: GameObject, finalOffset: CGSize, index: Int) {
        
        // Calculamos la posición final absoluta del objeto arrastrado
        // (esto dependerá de tu layout; es un ejemplo simplificado).
        let finalPoint = CGPoint(
            x: item.initialPosition.x + finalOffset.width,
            y: item.initialPosition.y + finalOffset.height
        )
        
        // Creamos una zona de drop (rect) alrededor de `targetPosition`.
        // Ajusta el tamaño según necesites.
        let dropSize: CGFloat = 100
        let dropZone = CGRect(
            x: item.targetPosition.x - dropSize/2,
            y: item.targetPosition.y - dropSize/2,
            width: dropSize,
            height: dropSize
        )
        
        // Un rect para el objeto arrastrado (tamaño 60x60, por ejemplo)
        let draggedFrame = CGRect(
            origin: CGPoint(x: finalPoint.x - 40, y: finalPoint.y - 40),
            size: CGSize(width: 80, height: 80)
        )
        
        // Verificamos intersección
        if draggedFrame.intersects(dropZone) {
            // Marcamos como matched
            objects[index].isMatched = true
            objects[index].offset = finalOffset
            
            // Mostramos popup
            selectedObject = objects[index]
            showPopup = true
            
        } else {
            // Si no está dentro de la zona, regresamos el offset a 0
            objects[index].offset = .zero
        }
    }
    
    func closePopup() {
        showPopup = false
        selectedObject = nil
    }
}
*/

class Nivel1ViewModel: ObservableObject {
    @Published var gameObjects: [GameObject]
    @Published var popupIsVisible = false
    @Published var popupTitle = ""         // Nombre en Mam (título del popup)
    @Published var popupSubtitle = ""      // Nombre en español (subtítulo)
    @Published var popupDescription = ""   // Descripción del objeto
    @Published var currentObject: GameObject? = nil
    init() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        gameObjects = [
            GameObject(
                nameInMam: "KA' METATE",
                nameInSpanish: "Metate",
                imageName: "metate",
                imageNamePopup: "popup-metat",
               // imageNameCheck: "metate-check",
                description: "ESTE OBJETO ES USADO EN LA ELABORACIÓN DEL NIXTAMAL EL CUAL ES UNO DE LOS PRINCIPALES ALIMENTOS EN LA GASTRONOMÍA MAM.",
                initialPosition: CGPoint(x: screenWidth * 0.1, y: screenHeight * 0.3),
                targetPosition: CGPoint(x: screenWidth * 0.3, y: screenHeight * 0.8)
            ),
            GameObject(
                nameInMam: "TXUMB'AL",
                nameInSpanish: "Machete",
                imageName: "machete",
                imageNamePopup: "popup-machete",
               // imageNameCheck: "metate-chec",
                description: "HERRAMIENTA USADA PARA CORTAR VEGETACIÓN O MADERA.",
                initialPosition: CGPoint(x: screenWidth * 0.1, y: screenHeight * 0.5),
                targetPosition: CGPoint(x: screenWidth * 0.6, y: screenHeight * 0.6)
            ),
           
            GameObject(
                nameInMam: "K'UM",
                nameInSpanish: "Olla de Barro",
                imageName: "ollaBarro",
                imageNamePopup: "popup-ollaa",
               // imageNameCheck: "metate-chec",
                description: "RECIPIENTE PARA COCINAR PLATILLOS TRADICIONALES.",
                initialPosition: CGPoint(x: screenWidth * 0.1, y: screenHeight * 0.7),
                targetPosition: CGPoint(x: screenWidth * 0.7, y: screenHeight * 0.7)
            )
        ]
    }
    
    func checkDrop(for object: GameObject, at position: CGPoint) {
        let distance = hypot(position.x - object.targetPosition.x, position.y - object.targetPosition.y)
        if distance < 50 { // Si el objeto está cerca del objetivo
//            popupTitle = object.nameInMam
//            popupSubtitle = object.nameInSpanish
//            popupDescription = object.description
            currentObject = object // Guardamos el objeto que hizo match
            popupIsVisible = true
        }
    }
}

