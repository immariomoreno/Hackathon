//
//  MainView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/3/25.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                // Fondo
                Image("background-main")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Botón de información
                    HStack {
                        
                        Button(action: {
                            // Acción del botón de información
                        }) {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.top, 20)
                                .padding(.trailing, 20)
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    GeometryReader { geometry in
                        let isLandscape = geometry.size.width > geometry.size.height
                        let horizontalPadding: CGFloat = 32 // Padding total horizontal (ej. 16 a cada lado)
                        let spacing: CGFloat = 16           // Espaciado entre tarjetas
                        let availableWidth = geometry.size.width - horizontalPadding - (2 * spacing)
                        // Si está en horizontal, usamos divisor mayor para que sean más chicas
                        let divisor: CGFloat = isLandscape ? 4 : 3
                        let cardWidth = availableWidth / divisor
                        let cardHeight = cardWidth * 1.5 // Relación de aspecto
                        Text("ONURA")
                            .font(.custom("LuckiestGuy-Regular", size: 120))
                            .foregroundStyle(.white)
                            .position(x: geometry.size.width / 2, y: 100)
                            .shadow(radius: 5)

                        HStack(spacing: spacing) {
                            NavigationLink(destination: MapaDeLenguaMam()) {
                                CardView(imageName: "explora-2", width: cardWidth, height: cardHeight)
                            }
                            NavigationLink(destination: GameView()) {
                                CardView(imageName: "juega", width: cardWidth, height: cardHeight)
                            }
                            NavigationLink(destination: CulturaMamView()) {
                                CardView(imageName: "conoce", width: cardWidth, height: cardHeight)
                            }
                        }
                        .frame(width: geometry.size.width, height: cardHeight, alignment: .center)
                        // Si la vista está en horizontal, movemos las tarjetas un poco más abajo
                        .offset(y: isLandscape ? cardHeight * 0.5 : 0)
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                }
            }
            //.navigationBarHidden(true)
            //
        }.navigationViewStyle(.stack)
    }
}

// Vista que representa cada "card" usando dimensiones dinámicas
struct CardView: View {
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .background(Color.clear)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
    }
}

// Ejemplo de vista de destino a la que se navega al presionar un card
struct DetailView: View {
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding()
            Text("Detalle de \(imageName)")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Detalle")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
