//
//  PopupView.swift
//  AppMam
//
//  Created by Mario Moreno on 3/29/25.
//

import SwiftUI

struct PopupView: View {
    let gameObject: GameObject
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            // Fondo semitransparente
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    onDismiss()
                }
            
            VStack(spacing: 16) {
                // Imagen grande en el popup
                Image(gameObject.imageNamePopup)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120) // Ajusta a tu gusto
                
                // Nombre en Mam
                Text(gameObject.nameInMam)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                // Nombre en Español
                Text(gameObject.nameInSpanish)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                // Descripción
                Text(gameObject.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Botón "Continuar"
                Button(action: onDismiss) {
                    Text("Continuar")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 40)
        }
    }
}



#Preview {
    //PopupView()
}
