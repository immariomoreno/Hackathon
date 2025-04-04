//
//  GameObject.swift
//  AppMam
//
//  Created by Mario Moreno on 3/29/25.
//

import Foundation
import SwiftUI

/// Modelo que describe un objeto arrastrable en el juego
struct GameObject: Identifiable {
    let id = UUID()
    
    // Información del objeto
    let nameInMam: String       
    let nameInSpanish: String
    let imageName: String       // Imagen para arrastrar en la escena
    let imageNamePopup: String  // Imagen que se mostrará en el popup
    //let imageNameCheck: String //Imagen después del popup
    let description: String     // Descripción en el popup

    // Posiciones
    let initialPosition: CGPoint  // Punto de partida
    let targetPosition: CGPoint   // Zona objetivo para “encajar”

    // Estado
//    var offset: CGSize = .zero
//    var isMatched: Bool = false
}
