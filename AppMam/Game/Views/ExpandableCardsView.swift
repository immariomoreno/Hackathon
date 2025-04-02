//
//  ExpandableCardsView.swift
//  AppMam
//
//  Created by Mario Moreno on 3/31/25.
//

import SwiftUI

struct ExpandableCard: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let color: Color
}

struct ExpandableCardsView: View {
    let cards: [ExpandableCard] = [
        .init(title: "Gastronomía", imageName: "goat", color: .green),
        .init(title: "Artefactos", imageName: "jar", color: .yellow),
        .init(title: "Lugares", imageName: "lugares", color: .blue),
        .init(title: "Historias", imageName: "mamsito", color: .cyan)
    ]

    @State private var selectedCard: UUID? = nil

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: geo.size.width * 0.02) {
                ForEach(cards) { card in
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(card.color.opacity(0.8))
                        VStack {
                            Spacer()
                            Image(systemName: "photo")
                                .resizable()
//                                .scaledToFill()
                                .frame(width: selectedCard == card.id ? geo.size.width * 0.25 : geo.size.width * 0.10, height: geo.size.width * 0.10)
                            Text(card.title)
                                .font(.title)
                                .foregroundColor(.white).frame(maxWidth: .infinity, alignment: selectedCard == card.id ? .leading : .center)
                                .padding([.leading, .bottom], selectedCard == card.id ? 20 : 10)
                        }

                        if selectedCard == card.id {
                            Button(action: {
                                // Navegación a otra vista aquí
                            }) {
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }
//                        Text("\(selectedCard)")
//                            .offset(y: -100)
//                        Text("\(card.id)")
                    }
                    .frame(
                        width: selectedCard == nil || selectedCard == card.id ? geo.size.width * (selectedCard == nil ? 0.23 : 0.30) : geo.size.width * 0.2,
                        height: geo.size.height * 0.3
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            if selectedCard == card.id {
                                selectedCard = nil
                            } else {
                                selectedCard = card.id
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
}

#Preview {
    ExpandableCardsView()
}

