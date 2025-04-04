import SwiftUI
import MapKit

// Modelo para cada ubicación
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let population: String
    let languageInfo: String
    let culturalInfo: String
    /*static func == (lhs: Location, rhs: Location) -> Bool {
           return lhs.id == rhs.id
       }*/
}

// Anotación personalizada para contener la ubicación
class CustomAnnotation: NSObject, MKAnnotation {
    let location: Location
    var coordinate: CLLocationCoordinate2D { location.coordinate }
    var title: String? { location.name }
    
    init(location: Location) {
        self.location = location
        super.init()
    }
}

// Vista que envuelve un MKMapView
struct MapViewRepresentable: UIViewRepresentable {
    @Binding var selectedLocation: Location?
    let locations: [Location]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Configurar región inicial
        let center = CLLocationCoordinate2D(latitude: 16.0, longitude: -92.5)
        mapView.setRegion(MKCoordinateRegion(center: center,
                                             latitudinalMeters: 500000,
                                             longitudinalMeters: 500000),
                          animated: false)
        
        // Añadir anotaciones y círculos
        locations.forEach { location in
            let annotation = CustomAnnotation(location: location)
            mapView.addAnnotation(annotation)
            
            let circle = MKCircle(center: location.coordinate, radius: 5000)
            mapView.addOverlay(circle)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Limpiar solo si es necesario (en este caso wh actualizamos)
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable
        
        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let circleOverlay = overlay as? MKCircle {
                let renderer = MKCircleRenderer(circle: circleOverlay)
                renderer.strokeColor = UIColor.blue
                renderer.fillColor = UIColor.blue.withAlphaComponent(0.2)
                renderer.lineWidth = 1
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let annotation = view.annotation as? CustomAnnotation else { return }
            parent.selectedLocation = annotation.location
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is CustomAnnotation else { return nil }
            
            let identifier = "CustomAnnotation"
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView.annotation = annotation
            annotationView.canShowCallout = false
            return annotationView
        }
    }
}

// Popup de información
struct LocationPopup: View {
    @Binding var location: Location?
    
    var body: some View {
        if let location = location {
            VStack(alignment: .leading, spacing: 15) {
                // Header
                HStack {
                    Text(location.name)
                        .font(.title.bold())
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button {
                        self.location = nil
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 10)
                
                Divider()
                
                // Contenido principal
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        InfoRow(icon: "person.2.fill",
                                title: "Población:",
                                value: location.population)
                        
                        InfoRow(icon: "bubble.left.and.bubble.right.fill",
                                title: "Lenguas:",
                                value: location.languageInfo)
                        
                        InfoRow(icon: "book.closed.fill",
                                title: "Cultura:",
                                value: location.culturalInfo)
                        
                        Divider()
                        
                        Text("Información detallada:")
                            .font(.headline.bold())
                        
                        Text(getAdditionalInfo(for: location.name))
                            .font(.body)
                            .lineSpacing(5)
                            .fixedSize(horizontal: false, vertical: true)
                        Divider()
                        
                        ImageCardScrollView()
                        
                    }
                }
            }
            .padding(25)
                        .frame(maxWidth: 400, maxHeight: .infinity)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.trailing, 20)
                        .transition(.asymmetric(
                                        insertion: .move(edge: .trailing).combined(with: .opacity),
                                        removal: .move(edge: .trailing).combined(with: .opacity)
                                    ))
                        //.zIndex(1)
        }
    }
    
    // Vista auxiliar para filas de información
    private func InfoRow(icon: String, title: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .font(.title3)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(value)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.vertical, 8)
    }
    
    // Función para información adicional
    private func getAdditionalInfo(for locationName: String) -> String {
        switch locationName {
        case "Chicomuselo":
            return "Municipio ubicado en la Sierra Madre de Chiapas. Conocido por su producción agrícola y ganadera. Clima templado húmedo con lluvias en verano. Altitud promedio: 720 metros sobre el nivel del mar."
        case "La Trinitaria":
               return "Altitud: 1,600 msnm. Clima templado. Importante destino ecoturístico con cascadas y lagunas. Fiesta patronal: Santísima Trinidad (mayo/junio)."
           case "Frontera Comalapa":
               return "Frontera activa con Guatemala. Altitud: 620 msnm. Producción de café orgánico. Sitio estratégico durante la época colonial."
           case "Juárez":
               return "Zona ganadera importante. Clima cálido-húmedo. Fundada en 1883. Celebración principal: Feria Municipal en abril."
           case "Reforma":
               return "Temperatura media: 26°C. Importante yacimiento petrolero. Parque Central con árboles centenarios. Museo comunitario."
           case "Ixtapa":
               return "Altitud: 1,100 msnm. Conocida como 'La Perla de los Altos'. Mercado artesanal los domingos. Producción de cerámica."
           case "Amatenango de la Frontera":
               return "Pueblo indígena con fuerte identidad mam. Mujeres alfareras reconocidas internacionalmente. Altitud: 1,200 msnm."
           case "Motozintla":
               return "Cabecera comercial de la región. Altitud: 1,280 msnm. Dañada por sismos en 2017. Zona de cultivo de frutas tropicales."
           case "Tapachula":
               return "Segunda ciudad más importante de Chiapas. Aeropuerto internacional. Zona libre. Feria Internacional Tapachula (noviembre)."
           case "Tonalá":
               return "Puerto comercial histórico. Clima tropical. Playas como Puerto Arista y Boca del Cielo. Pesca deportiva y gastronomía marina."
        case "Bejucal de Ocampo":
                return "Altitud: 1,500 msnm. Clima frío. Producción de manzana y durazno. Tejidos de lana tradicionales. Último reducto del mam puro."
                
            case "Bella Vista":
                return "Altitud: 2,200 msnm. Clima frío. Mayor productor de brócoli en Chiapas. Miradores naturales. Tradición de música de marimba."
                
            case "La Grandeza":
                return "Altitud: 2,100 msnm. Clima frío. Cultivo de flores ornamentales. Artesanías en paja. Récord Guinness por el tamal más grande."
                
            case "Mazapa de Madero":
                return "Altitud: 1,800 msnm. Clima templado. Migración histórica a EUA. Panaderías tradicionales. Festival de la Rosca (enero)."
                
            
            case "El Porvenir":
                return "Altitud: 1,600 msnm. Clima frío. Reserva ecológica El Triunfo. Café de altura. Último avistamiento de quetzal en la región."
                
            case "Siltepec":
                return "Altitud: 1,500 msnm. Clima templado. Mayor productor de papa. Cascada El Corralito. Lengua mam en declive generacional."
                
            case "Acacoyagua":
                return "Altitud: 80 msnm. Clima tropical. Comunidad afromexicana. Playa San Benito. Producción de coco y cacao."
                
            case "Cacahoatán":
                return "Altitud: 500 msnm. Clima cálido-húmedo. Cuna del café en México. Fincas históricas (Hamburgo, Chiripa). Volcán Tacaná."
                
            case "Frontera Hidalgo":
                return "Altitud: 60 msnm. Clima tropical. Paso fronterizo Río Suchiate. Producción de plátano. Puente internacional Rodolfo Robles."
                
            case "Tuzantán":
                return "Altitud: 200 msnm. Clima cálido. Comunidad zoque. Artesanías de jarcia. Enclave de la cultura olmeca."
                
            case "Unión Juárez":
                return "Altitud: 1,200 msnm. Clima templado. Pueblo Mágico. Cafetaleros alemanes siglo XIX. Vista al volcán Tacaná."
                
            case "Huehuetán":
                return "Altitud: 50 msnm. Clima tropical. Zona arqueológica Izapa. Producción de banana. Lluvias más intensas de México."
                
          
                
            case "Escuintla":
                return "Altitud: 30 msnm. Clima tropical. Playas vírgenes. Reserva La Encrucijada. Producción de palma africana."
                
            case "Tuxtla Chico":
                return "Altitud: 250 msnm. Clima cálido. Frontera con Guatemala. Haciendas cacaoteras. Sitio arqueológico de Izapa."
                
            
        // Añade más casos según necesites
        default:
            return "Municipio con rica diversidad cultural y ecológica. Importante para la conservación de tradiciones indígenas y ecosistemas únicos."
        }
    }
}

// Vista principal
struct MapaDeLenguaMam: View {
    let locations = [
        // Tu lista de ubicaciones...
        Location(name: "Chicomuselo",
                 coordinate: CLLocationCoordinate2D(latitude: 15.7833, longitude: -92.2667),
                 population: "15,000 habitantes",
                         languageInfo: "Variante del Mam: Chicomuselteco",
                         culturalInfo: "Famoso por su festival anual de maíz"),
        Location(
               name: "La Trinitaria",
               coordinate: CLLocationCoordinate2D(latitude: 16.1167, longitude: -91.7167),
               population: "27,500 habitantes",
               languageInfo: "Mam (45%), Español (55%)",
               culturalInfo: "Famosa por las Lagunas de Montebello. Producción de café y artesanías en madera."
           ),
           Location(
               name: "Frontera Comalapa",
               coordinate: CLLocationCoordinate2D(latitude: 15.6667, longitude: -92.1333),
               population: "18,200 habitantes",
               languageInfo: "Mam (60%), Español (40%)",
               culturalInfo: "Zona fronteriza con Guatemala. Mercado binacional los viernes."
           ),
           Location(
               name: "Juárez",
               coordinate: CLLocationCoordinate2D(latitude: 17.7667, longitude: -93.1500),
               population: "12,800 habitantes",
               languageInfo: "Español (95%), Zoque (5%)",
               culturalInfo: "Economía basada en agricultura (maíz, frijol) y ganadería."
           ),
           Location(
               name: "Reforma",
               coordinate: CLLocationCoordinate2D(latitude: 17.8833, longitude: -93.1500),
               population: "39,000 habitantes",
               languageInfo: "Español (90%), Lenguas indígenas (10%)",
               culturalInfo: "Importante zona petrolera. Parque Central con murales históricos."
           ),
           Location(
               name: "Ixtapa",
               coordinate: CLLocationCoordinate2D(latitude: 16.7833, longitude: -92.9000),
               population: "15,300 habitantes",
               languageInfo: "Tzotzil (30%), Español (70%)",
               culturalInfo: "Conocida por sus tejidos tradicionales y fiestas patronales coloridas."
           ),
           Location(
               name: "Amatenango de la Frontera",
               coordinate: CLLocationCoordinate2D(latitude: 15.5333, longitude: -92.1333),
               population: "9,500 habitantes",
               languageInfo: "Mam (85%), Español (15%)",
               culturalInfo: "Alfarería tradicional y conservación de rituales antiguos."
           ),
           Location(
               name: "Bejucal de Ocampo",
               coordinate: CLLocationCoordinate2D(latitude: 15.5667, longitude: -92.1667),
               population: "6,200 habitantes",
               languageInfo: "Mam (95%), Español (5%)",
               culturalInfo: "Comunidad agrícola con tradiciones musicales únicas."
           ),
           Location(
               name: "Bella Vista",
               coordinate: CLLocationCoordinate2D(latitude: 15.5667, longitude: -92.1667),
               population: "7,800 habitantes",
               languageInfo: "Mam (80%), Español (20%)",
               culturalInfo: "Vistas panorámicas espectaculares. Producción de miel orgánica."
           ),
           Location(
               name: "La Grandeza",
               coordinate: CLLocationCoordinate2D(latitude: 15.5667, longitude: -92.1667),
               population: "5,600 habitantes",
               languageInfo: "Mam (90%), Español (10%)",
               culturalInfo: "Tradiciones textiles y cultivo de flores exóticas."
           ),
           Location(
               name: "Mazapa de Madero",
               coordinate: CLLocationCoordinate2D(latitude: 15.5667, longitude: -92.1667),
               population: "8,400 habitantes",
               languageInfo: "Mam (75%), Español (25%)",
               culturalInfo: "Famosa por su pan tradicional y arquitectura colonial."
           ),
           Location(
               name: "Motozintla",
               coordinate: CLLocationCoordinate2D(latitude: 15.3667, longitude: -92.2500),
               population: "23,100 habitantes",
               languageInfo: "Mam (70%), Español (30%)",
               culturalInfo: "Centro comercial regional. Festival anual de la Naranja."
           ),
           Location(
               name: "El Porvenir",
               coordinate: CLLocationCoordinate2D(latitude: 15.3833, longitude: -92.2833),
               population: "4,900 habitantes",
               languageInfo: "Mam (95%), Español (5%)",
               culturalInfo: "Comunidad agrícola con reservas naturales vírgenes."
           ),
           Location(
               name: "Siltepec",
               coordinate: CLLocationCoordinate2D(latitude: 15.4167, longitude: -92.4000),
               population: "14,700 habitantes",
               languageInfo: "Mam (60%), Español (40%)",
               culturalInfo: "Producción de café de altura. Arquitectura tradicional bien conservada."
           ),
           Location(
               name: "Acacoyagua",
               coordinate: CLLocationCoordinate2D(latitude: 15.3333, longitude: -92.6833),
               population: "16,300 habitantes",
               languageInfo: "Español (85%), Lenguas indígenas (15%)",
               culturalInfo: "Playas vírgenes y cocoteros. Tradición pesquera."
           ),
           Location(
               name: "Cacahoatán",
               coordinate: CLLocationCoordinate2D(latitude: 14.9833, longitude: -92.1667),
               population: "42,000 habitantes",
               languageInfo: "Español (70%), Mam (30%)",
               culturalInfo: "Capital del café en Chiapas. Clima tropical húmedo."
           ),
           Location(
               name: "Frontera Hidalgo",
               coordinate: CLLocationCoordinate2D(latitude: 14.9667, longitude: -92.1667),
               population: "11,200 habitantes",
               languageInfo: "Español (90%), Mam (10%)",
               culturalInfo: "Puente internacional con Guatemala. Producción de cacao."
           ),
           Location(
               name: "Tuzantán",
               coordinate: CLLocationCoordinate2D(latitude: 15.2000, longitude: -92.4167),
               population: "13,500 habitantes",
               languageInfo: "Mam (55%), Español (45%)",
               culturalInfo: "Rituales agrícolas tradicionales. Mercado de productos orgánicos."
           ),
           Location(
               name: "Unión Juárez",
               coordinate: CLLocationCoordinate2D(latitude: 15.0333, longitude: -92.1000),
               population: "8,700 habitantes",
               languageInfo: "Mam (80%), Español (20%)",
               culturalInfo: "Pueblo mágico con vista al volcán Tacaná. Cultivo de flores."
           ),
           Location(
               name: "Huehuetán",
               coordinate: CLLocationCoordinate2D(latitude: 15.0333, longitude: -92.4167),
               population: "24,300 habitantes",
               languageInfo: "Español (75%), Mam (25%)",
               culturalInfo: "Zona arqueológica. Producción de bananas y plátanos."
           ),
           Location(
               name: "Tapachula",
               coordinate: CLLocationCoordinate2D(latitude: 14.9000, longitude: -92.2667),
               population: "217,550 habitantes",
               languageInfo: "Español (85%), Lenguas indígenas (15%)",
               culturalInfo: "Capital económica del Soconusco. Arquitectura neoclásica."
           ),
           Location(
               name: "Escuintla",
               coordinate: CLLocationCoordinate2D(latitude: 15.3333, longitude: -92.6167),
               population: "29,800 habitantes",
               languageInfo: "Español (80%), Lenguas indígenas (20%)",
               culturalInfo: "Playas vírgenes y reservas ecológicas. Producción de coco."
           ),
           Location(
               name: "Tuxtla Chico",
               coordinate: CLLocationCoordinate2D(latitude: 14.9167, longitude: -92.2000),
               population: "37,400 habitantes",
               languageInfo: "Español (90%), Mam (10%)",
               culturalInfo: "Zona ganadera. Fiestas tradicionales con danzas autóctonas."
           ),
           Location(
               name: "Tonalá",
               coordinate: CLLocationCoordinate2D(latitude: 16.0833, longitude: -93.7500),
               population: "46,000 habitantes",
               languageInfo: "Español (95%), Lenguas indígenas (5%)",
               culturalInfo: "Importante puerto pesquero. Playas y zona comercial activa."
           )
        
        
    ]
    
    @State private var selectedLocation: Location?
    
    var body: some View {
        ZStack(alignment: .trailing) {
            MapViewRepresentable(selectedLocation: $selectedLocation, locations: locations)
                .edgesIgnoringSafeArea(.all)
            
            if selectedLocation != nil {
                LocationPopup(location: $selectedLocation)
                    .transition(.move(edge: .trailing))
                    //.animation(.easeInOut, value: selectedLocation)
            }
        } .animation(.easeInOut(duration: 0.3), value: selectedLocation?.id)
    }
}

struct ImageCardScrollView: View {
    let images = ["cenotes-de-candelaria", "lagos-de-colon", "zona-arqueologica-de-tenam-puente"] // Reemplaza por los nombres reales
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Destinos cercanos para visitar")
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
                //.padding(.horizontal, 30)
            }
        }
        .padding(.leading)
    }
}



#Preview {
    MapaDeLenguaMam()
}
