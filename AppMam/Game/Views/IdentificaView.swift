//
//  IdentificaView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/2/25.
//
/*
import SwiftUI

public struct IdentificaView: View {
    
    @State private var isPresented: Bool = false
    
    public init() {}
    public var body: some View {
        ZStack {
            Image("salon-fondo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .frame(width: 550, height: 300)
                        .position(x: 600, y:220)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
    // Oculta el botón de regreso predeterminado
            .navigationBarBackButtonHidden(true)
            // Agrega un botón personalizado en la parte izquierda de la barra de navegación
            .navigationBarItems(leading: Button(action: {
                // Regresa a la vista anterior
              //  presentationMode.wrappedValue.dismiss()
            }) {
                // Personaliza el label: puedes usar un icono, texto o ambos
                HStack {
                    Image("back-btn")
                        .resizable()
                        .frame(width:80, height: 80)
                        .padding(.top, 100)
                        .padding(.leading, 50)
                }
                .frame(width:80, height: 80)
               
            })
        .popup(isPresented: $isPresented, style: .dimmed) { // size: CGSize(width: 700, height: 550),
            VStack(alignment: .leading, spacing: 12) {
                Text("SLEW TZ’LAM")
                    .font(.custom("LuckiestGuy-Regular", size: 30))
                Text("Pizarrón")
                    .font(.custom("Urbanist-Regular", size: 20))
                    .foregroundStyle(.secondary)
                
                Button(action: {
                    SoundManager.instance.playSound(sound: .pizarron)
                }) {
                    Image("bocina") // O reemplázalo con tu imagen personalizada
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.green)
                }
            }
            
            
        }
        
        
    }
}

fileprivate
enum PopupStyle {
    case blur
    case dimmed
    case none
}

fileprivate
struct Popup<Message: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    var size: CGSize = CGSize(width: 400, height: 300)
    let style: PopupStyle
    let message: Message
    
    func body(content: Content) -> some View {
        content
            .blur(radius: style == .blur ? (isPresented ? 6 : 0) : 0)
            .overlay(
                Rectangle()
                    .fill(Color.black.opacity(style == .dimmed ? (isPresented ? 0.3 : 0) : 0))
                    .ignoresSafeArea()
            )
            .overlay(popupContent)
            .animation(.easeInOut(duration: 0.26), value: isPresented)
    }
    
    private var popupContent: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    self.message
                }
                .frame(width: self.size.width, height: self.size.height)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
                .overlay(
                    ZStack {
                        Button(action: {
                               // Cierra el popup
                               isPresented = false
                           }) {
                               HStack {
                                   Spacer()
                                   Image(systemName: "xmark")
                                       .font(.system(size: 22))
                                       .foregroundColor(.gray)
                                       .padding(.trailing, 16)
                                       .padding(.top, 16)
                               }
                           }
                           .buttonStyle(PlainButtonStyle())
                    }
                   
                    , alignment: .top)
                .position(x: proxy.size.width / 2, y: proxy.size.height * 0.3)
            }
        }
        .scaleEffect(isPresented ? 1.0 : 0.85)
        .opacity(isPresented ? 1.0 : 0)
        .animation(.easeInOut(duration: 0.26), value: isPresented)
    }

}

fileprivate
struct PopupToggle: ViewModifier {
    
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .disabled(isPresented)
            .onTapGesture {
                self.isPresented.toggle()
            }
    }
}

fileprivate
extension View {
    func popup<T: View>(isPresented: Binding<Bool>,
                        size: CGSize = CGSize(width: 300, height: 200),
                        style: PopupStyle = .blur,
                        @ViewBuilder content: () -> T) -> some View {
        let popup = Popup(isPresented: isPresented, size: size, style: style, message: content())
//        let popupToggle = PopupToggle(isPresented: isPresented)
        let modifiedContent = self.modifier(popup)
        return modifiedContent
    }
}



#Preview {
    IdentificaView()
}
*/
import SwiftUI

public struct IdentificaView: View {
    @Environment(\.presentationMode) var presentationMode
    // Variables para controlar cada popup
    @State private var isMainPopupPresented: Bool = false
    @State private var isPopup1Presented: Bool = false
    @State private var isPopup2Presented: Bool = false
    @State private var isPopup3Presented: Bool = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            // Fondo de la vista
            Image("fondo-salon")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Image("niña2")
                .resizable()
                .scaledToFit()
                .frame(width: 163, height: 291)
                .position(x:340, y:500)
            // Botón invisible para el popup principal (ya existente)
            Button {
                isMainPopupPresented = true
            } label: {
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .frame(width: 400, height: 200)
                    .position(x: 490, y: 200)
            }
            .buttonStyle(PlainButtonStyle())
            
            // Botón invisible para el 1er popup (posición: 1200, 800)
            Button {
                isPopup1Presented = true
            } label: {
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .frame(width: 100, height: 70)
                    .position(x: 320, y: 700)
            }
            .buttonStyle(PlainButtonStyle())
            
            // Botón invisible para el 2do popup (posición: 1500, 300)
            Button {
                isPopup2Presented = true
            } label: {
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .frame(width: 100, height: 40)
                    .position(x: 680, y: 400)
            }
            .buttonStyle(PlainButtonStyle())
            
            // Botón invisible para el 3er popup (posición: 800, -400)
            Button {
                isPopup3Presented = true
            } label: {
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .frame(width: 100, height: 100)
                    .position(x: 1040, y: 560)
            }
            .buttonStyle(PlainButtonStyle())
        }
        // Configuración de la barra de navegación
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
             presentationMode.wrappedValue.dismiss()
        }) {
//            HStack {
//                Image("back-btn")
//                    .resizable()
//                    .frame(width: 80, height: 80)
//                    .padding(.top, 100)
//                    .padding(.leading, 50)
//            }
//            .frame(width: 80, height: 80)
        })
        // Se aplican los popups a la vista (cada uno se muestra según su estado)
        .popup(isPresented: $isMainPopupPresented, style: .dimmed) {
            VStack(alignment: .leading, spacing: 12) {
                Text("SLEW TZ’LAM")
                    .font(.custom("LuckiestGuy-Regular", size: 30))
                Text("Pizarrón")
                    .font(.custom("Urbanist-Regular", size: 20))
                    .foregroundStyle(.secondary)
                Button(action: {
                    SoundManager.instance.playSound(sound: .pizarron)
                }) {
                    Image("bocina")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.green)
                }
            }
        }
        .popup(isPresented: $isPopup1Presented, style: .dimmed) {
            VStack(alignment: .leading, spacing: 12) {
                Text("ÜJ")
                    .font(.custom("LuckiestGuy-Regular", size: 30))
                Text("Libro")
                    .font(.custom("Urbanist-Regular", size: 20))
                    .foregroundStyle(.secondary)
                Button(action: {
                    SoundManager.instance.playSound(sound: .libro)
                }) {
                    Image("bocina")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.green)
                }
            }
        }
        .popup(isPresented: $isPopup2Presented, style: .dimmed) {
            VStack(alignment: .leading, spacing: 12) {
                Text("TZ’IBIL")
                    .font(.custom("LuckiestGuy-Regular", size: 30))
                Text("Lápiz")
                    .font(.custom("Urbanist-Regular", size: 20))
                    .foregroundStyle(.secondary)
                Button(action: {
                    SoundManager.instance.playSound(sound: .lapiz)
                }) {
                    Image("bocina")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.green)
                }
            }
        }
        .popup(isPresented: $isPopup3Presented, style: .dimmed) {
            VStack(alignment: .leading, spacing: 12) {
                Text("CH'UẌ")
                    .font(.custom("LuckiestGuy-Regular", size: 30))
                Text("Mochila")
                    .font(.custom("Urbanist-Regular", size: 20))
                    .foregroundStyle(.secondary)
                Button(action: {
                    SoundManager.instance.playSound(sound: .mochila)
                }) {
                    Image("bocina")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.green)
                }
            }
        }
    }
}

/// MARK: - Popup Modifiers y Extensión

fileprivate enum PopupStyle {
    case blur
    case dimmed
    case none
}

fileprivate struct Popup<Message: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    var size: CGSize = CGSize(width: 400, height: 300)
    let style: PopupStyle
    let message: Message
    
    func body(content: Content) -> some View {
        content
            .blur(radius: style == .blur ? (isPresented ? 6 : 0) : 0)
            .overlay(
                Rectangle()
                    .fill(Color.black.opacity(style == .dimmed ? (isPresented ? 0.3 : 0) : 0))
                    .ignoresSafeArea()
            )
            .overlay(popupContent)
            .animation(.easeInOut(duration: 0.26), value: isPresented)
    }
    
    private var popupContent: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    self.message
                }
                .frame(width: self.size.width, height: self.size.height)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
                .overlay(
                    // Botón para cerrar el popup
                    Button(action: {
                        isPresented = false
                    }) {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                                .padding(.trailing, 16)
                                .padding(.top, 16)
                        }
                    }
                    .buttonStyle(PlainButtonStyle()),
                    alignment: .top
                )
                // La posición del popup se fija (por defecto en proxy.size.width/2, proxy.size.height*0.3)
                .position(x: proxy.size.width / 2, y: proxy.size.height * 0.3)
            }
        }
        .scaleEffect(isPresented ? 1.0 : 0.85)
        .opacity(isPresented ? 1.0 : 0)
        .animation(.easeInOut(duration: 0.26), value: isPresented)
    }
}

fileprivate extension View {
    func popup<T: View>(isPresented: Binding<Bool>,
                        size: CGSize = CGSize(width: 300, height: 200),
                        style: PopupStyle = .blur,
                        @ViewBuilder content: () -> T) -> some View {
        let popup = Popup(isPresented: isPresented, size: size, style: style, message: content())
        return self.modifier(popup)
    }
}

struct IdentificaView_Previews: PreviewProvider {
    static var previews: some View {
        IdentificaView()
    }
}

