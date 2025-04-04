//
//  CardView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/2/25.
//


import SwiftUI

struct ImageCardScrollView2: View {
    let images = ["nina-mam", "mujer-mam", "chiapas-mam"] // Reemplaza por los nombres reales
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Historias que nos inspiran")
                .font(.title)
                .padding(.leading, 10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(images, id: \.self) { imageName in
                        ZStack(alignment: .bottomTrailing) {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 400, height: 300)
                                .clipped()
                                .cornerRadius(20)
                            
                            Button(action: {
                                print("Ir a detalle de \(imageName)")
                            }) {
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.3))
                                    .clipShape(Circle())
                                    .padding(12)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.leading, 30)
    }
}

#Preview {
    ImageCardScrollView2()
}


