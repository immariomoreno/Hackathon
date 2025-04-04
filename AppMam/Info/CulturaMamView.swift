//
//  CulturaMamView.swift
//  AppMam
//
//  Created by Mario Moreno on 4/3/25.
//

import SwiftUI

struct CulturaMamView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("fondo-info2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        VStack {
                            HStack {
                                Spacer()
                                Image("mujeres-mam")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(15)
                                    .padding(.trailing, 20)
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Cultura Mam")
                                        .font(.title)
                                        .bold()
                                        .padding(.bottom)
                                    
                                    Text("Un recorrido por la historia, idioma y costumbres del pueblo Mam.")
                                        .font(.title3)
                                        .foregroundColor(.gray)
                                        .fontWeight(.bold)
                                }
                                Spacer()
                            }
                            .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(secciones, id: \ .id) { seccion in
                                    NavigationLink(destination: DetalleSeccionView(seccion: seccion)) {
                                        SeccionCard(title: seccion.title, description: seccion.description, imageName: seccion.imageName)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct Seccion: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let content: String
}

let secciones = [
    Seccion(title: "Historia y Origen", description: "Descubre el origen y evolución del pueblo Mam.", imageName: "historia", content: """
    El pueblo Mam es uno de los pueblos indígenas mayas que ha habitado la región de Guatemala y México durante siglos. Su historia se remonta a la época precolombina, cuando desarrollaron una sociedad con una estructura política y económica organizada. Los Mam fueron conocidos por su capacidad para cultivar y trabajar la tierra, especialmente el maíz, que es un alimento esencial para su cultura.

    Durante el período clásico de la civilización maya, los Mam formaban parte de un sistema interconectado de ciudades-estado, en las que el comercio y la interacción cultural fluían entre diferentes grupos. Estos pueblos mantenían una fuerte conexión con la naturaleza y con los ciclos astronómicos, lo que les permitió crear un calendario preciso y desarrollar una rica cosmovisión relacionada con el cosmos y los dioses.

    Tras la llegada de los colonizadores españoles en el siglo XVI, los Mam, al igual que otros pueblos indígenas, enfrentaron graves consecuencias. La invasión, la imposición del cristianismo y la esclavitud forzada fueron solo algunas de las adversidades que atravesaron. A pesar de ello, los Mam resistieron con determinación, preservando su lengua, sus costumbres y su organización social a lo largo de los siglos.

    Hoy en día, los Mam siguen siendo una comunidad resiliente que vive principalmente en las tierras altas de Guatemala, particularmente en el altiplano occidental, y en algunas regiones del sur de México. Aunque enfrentan desafíos significativos, como la pobreza y la discriminación, han logrado mantener vivas muchas de sus tradiciones, como su lengua, el traje típico y las ceremonias religiosas.

    Uno de los aspectos más destacados de la cultura Mam es su sistema de organización comunitaria basado en la reciprocidad y la cooperación. A lo largo de los años, han defendido su derecho a la autodeterminación y a la preservación de su cultura, especialmente a través de movimientos sociales y educativos que promueven la revitalización del idioma Mam y el reconocimiento de su historia.

    La historia del pueblo Mam es testimonio de la resistencia y la lucha por la identidad. Su legado es una mezcla de sabiduría ancestral y adaptaciones modernas, lo que les permite mantener su rica herencia cultural mientras navegan por los desafíos del siglo XXI. Hoy en día, el pueblo Mam sigue siendo un ejemplo de fortaleza, orgullo y la importancia de la memoria histórica en la lucha por la justicia y la equidad.
    """)
,
    
    Seccion(title: "Idioma Mam", description: "Aprende frases básicas y escucha su pronunciación.", imageName: "idioma", content: """
    El idioma Mam es una lengua maya que forma parte del grupo de lenguas mayenses de la familia K'iche'. Es hablado por más de medio millón de personas, principalmente en las regiones montañosas de Guatemala, en departamentos como San Marcos, Huehuetenango y Quetzaltenango, y en algunas áreas del sur de México. A pesar de la presión cultural y lingüística externa, el idioma Mam sigue siendo un elemento fundamental en la vida diaria de la comunidad y en la preservación de su identidad cultural.

    La lengua Mam tiene una estructura gramatical compleja y distintiva que difiere significativamente de las lenguas indoeuropeas. Una de las características más destacadas del Mam es su sistema de conjugación verbal, que depende del aspecto y la relación temporal de la acción, en lugar de seguir el sistema de tiempo verbal tradicional. Además, utiliza una serie de afijos para modificar el significado de las palabras según el contexto.

    En términos fonéticos, el Mam posee una rica variedad de sonidos que incluyen una serie de consonantes glotales, que no se encuentran en las lenguas europeas. Esto da lugar a una pronunciación única, con variaciones dependiendo de la región y el contexto social. Además, el idioma Mam tiene un sistema tonal, lo que significa que el significado de una palabra puede cambiar dependiendo del tono con el que se pronuncie. Este aspecto tonal puede ser un desafío para quienes no están familiarizados con el idioma.

    Uno de los aspectos más interesantes del idioma Mam es su capacidad para expresar conceptos profundos relacionados con la cosmovisión y las creencias del pueblo Mam. A través de su lengua, se transmiten historias, rituales y conocimientos sobre la naturaleza, los dioses y el mundo espiritual. En el Mam, muchas palabras tienen significados que se entrelazan con la historia y la cultura del pueblo, y son esenciales para entender la forma en que ven el mundo.

    A pesar de los esfuerzos de modernización y la expansión del español, el idioma Mam sigue siendo hablado con orgullo por las nuevas generaciones, quienes están comprometidas con su preservación. En las comunidades Mam, la lengua se utiliza en la vida cotidiana, en las ceremonias religiosas y en los rituales de la vida comunitaria, como las celebraciones del solsticio y las festividades tradicionales.

    El idioma también está siendo promovido a través de diversas iniciativas de revitalización lingüística. Programas educativos en las escuelas de las áreas mayas han comenzado a enseñar el Mam junto con el español, y se están produciendo recursos multimedia, como grabaciones, aplicaciones y materiales educativos, para asegurar que las futuras generaciones mantengan su lengua viva.

    El aprendizaje de algunas frases básicas en Mam es una excelente manera de conectarse con la cultura y la comunidad. Por ejemplo, "Tzajb’il" significa "Gracias", y "B’an ti" se traduce como "Hola". Aunque estas frases pueden parecer simples, son una puerta de entrada al entendimiento de una lengua que está profundamente entrelazada con la identidad, la historia y la cosmovisión del pueblo Mam.

    El idioma Mam no solo es un medio de comunicación, sino también un símbolo de resistencia y de orgullo cultural. A través de la preservación y el uso continuo de su lengua, el pueblo Mam asegura que su rica herencia siga viva y transmitida a las generaciones futuras.
    """),
    
    Seccion(title: "Vestimenta Tradicional", description: "Conoce la vestimenta típica y su significado.", imageName: "vestimenta", content: """
    La vestimenta tradicional del pueblo Mam es mucho más que una simple ropa: es un símbolo de identidad, un medio para expresar la cosmovisión y los valores de la comunidad, y un testamento de su historia y su resistencia cultural. A través de los trajes tradicionales, las personas Mam cuentan historias sobre su origen, sus creencias espirituales, y los eventos históricos que han marcado sus vidas.

    El traje tradicional de las mujeres Mam se caracteriza principalmente por el huipil, una prenda elaborada a mano con técnicas de bordado que varían según la región. El huipil es una pieza de gran significado, ya que cada diseño tiene un simbolismo que puede representar elementos de la naturaleza, como las montañas, el sol, y el maíz, que son fundamentales en la cosmovisión Mam. Los colores y patrones del huipil también tienen un gran significado. Los tonos rojos, amarillos y naranjas, por ejemplo, son comunes en los huipiles de algunas comunidades, y representan el fuego, la vida y el renacimiento, mientras que los tonos más oscuros, como el negro, simbolizan la tierra y la fertilidad. Cada mujer Mam tiene un huipil que se convierte en un reflejo de su vida personal, su familia y su comunidad.

    El proceso de confección del huipil es largo y laborioso, y en muchas comunidades es una tradición que se pasa de generación en generación. Las mujeres no solo aprenden a tejer y bordar desde pequeñas, sino que cada diseño también lleva consigo historias, mitos y tradiciones de su pueblo. Los huipiles no son solo ropa, sino una forma de conectarse con el pasado y mantener vivas las enseñanzas ancestrales.

    Por otro lado, la vestimenta masculina tradicional incluye pantalones de algodón y una camisa, que aunque simple en su diseño, también lleva consigo un significado cultural importante. Los hombres Mam suelen portar camisas que, al igual que los huipiles, pueden llevar bordados o elementos que representan su conexión con la tierra y la espiritualidad. Las camisas a menudo tienen detalles que aluden a la mitología Mam o a la naturaleza, y como los huipiles, son parte esencial de la identidad cultural masculina en la comunidad.

    El uso de la vestimenta tradicional no solo tiene un valor cultural, sino que también está relacionado con las creencias espirituales y rituales del pueblo Mam. En las festividades y ceremonias religiosas, el traje tradicional se convierte en una manera de honrar a los dioses, la tierra y los ancestros. Además, la vestimenta juega un papel crucial en las celebraciones de la cosecha, cuando los colores y los diseños de los trajes representan la abundancia, la fertilidad y la conexión con la Madre Tierra.

    A pesar de las influencias externas y la globalización, la vestimenta tradicional Mam sigue siendo un símbolo de resistencia cultural. Aunque es cada vez más común ver a las personas jóvenes usar ropa más occidental en su vida diaria, las celebraciones, fiestas y rituales comunitarios siguen siendo una oportunidad para que todos se vistan con sus trajes tradicionales. Es en esos momentos cuando la comunidad se recuerda a sí misma sus raíces y su conexión profunda con su cultura.

    La vestimenta tradicional del pueblo Mam es un testimonio vivo de su historia, su resistencia y su identidad. Cada hilo, cada diseño y cada color lleva consigo una historia que ha sido transmitida a través de generaciones, y se convierte en un medio de expresión de la cosmovisión única del pueblo Mam. Al conocer y apreciar los trajes tradicionales Mam, no solo se honra la belleza de sus diseños, sino también el profundo significado cultural que encierran, que continúa siendo un pilar de la comunidad y un símbolo de su lucha por la preservación de su identidad.
    """)
,
    
    Seccion(title: "Costumbres y Tradiciones", description: "Explora festividades, rituales y creencias.", imageName: "tradiciones", content: """
    Las costumbres y tradiciones del pueblo Mam están profundamente enraizadas en su relación con la naturaleza, los ciclos agrícolas y la espiritualidad. Desde tiempos ancestrales, estas tradiciones han sido transmitidas de generación en generación, no solo como un legado cultural, sino como un medio para honrar a los dioses, la tierra y los ancestros, y para asegurar la prosperidad y el bienestar de la comunidad.

    

    Una de las celebraciones más emblemáticas del pueblo Mam es el 'Baile del Venado', una fiesta ritual que tiene lugar en diversas comunidades de la región. Esta festividad es una representación simbólica de la caza del venado, un animal considerado sagrado por su conexión con los espíritus de la naturaleza. Durante esta celebración, los danzantes se visten con trajes que imitan al venado, llevando máscaras elaboradas y pintadas a mano. El baile tiene un profundo significado espiritual: se cree que al danzar como el venado, la comunidad se conecta con las fuerzas naturales que gobiernan la vida, la fertilidad y las cosechas. A través de esta danza, los Mam buscan rendir homenaje a los dioses, pedirles buenas cosechas y agradecerles por la abundancia recibida.

    Otra de las festividades importantes es la veneración de los cerros sagrados, un ritual que demuestra la profunda conexión espiritual de los Mam con su tierra. Los cerros son considerados moradas de los espíritus ancestrales, y son venerados en ceremonias donde se realizan ofrendas de alimentos, flores y otros elementos simbólicos. La tradición de visitar los cerros sagrados se mantiene viva, y cada año, la comunidad realiza peregrinaciones hacia estos lugares para pedir protección, salud y prosperidad. Esta veneración no solo es una práctica religiosa, sino también una forma de reafirmar la relación que los Mam tienen con su entorno natural, un vínculo que les ha permitido sobrevivir a lo largo de siglos de adversidades.


    Los rituales del pueblo Mam están estrechamente relacionados con la agricultura y los ciclos de la naturaleza. La siembra y la cosecha son momentos clave en la vida de la comunidad, y los rituales que se celebran en estas fechas son una forma de pedir bendiciones para las cosechas, así como para la salud y la protección de los miembros de la comunidad. Los rituales incluyen ofrendas a los dioses y espíritus protectores de la tierra, como el Dios del Maíz, que es considerado el dador de la vida y la fertilidad.

    El culto a los muertos también tiene un lugar importante en las tradiciones Mam. La creencia en la vida después de la muerte es central en su cosmovisión, y se celebran ceremonias para honrar a los ancestros. Durante estas ceremonias, se colocan ofrendas en las tumbas y se recitan oraciones para que las almas de los muertos encuentren paz y puedan proteger a los vivos. Esta conexión espiritual con los antepasados asegura que la memoria colectiva de la comunidad se mantenga viva, y que las enseñanzas y valores heredados continúen guiando las generaciones futuras.

    

    Las costumbres y tradiciones del pueblo Mam no solo son un reflejo de su historia y su cosmovisión, sino también una forma de resistencia cultural ante los desafíos del mundo moderno. A pesar de las presiones de la globalización y las influencias externas, el pueblo Mam sigue manteniendo vivas sus festividades, rituales y creencias. Las celebraciones, como el 'Baile del Venado' y la veneración de los cerros sagrados, son actos de afirmación cultural, una forma de demostrar que, a pesar de los cambios en el mundo exterior, su identidad y su conexión con la naturaleza siguen siendo inquebrantables.

    El respeto por las costumbres tradicionales también es una manera de enseñar a las nuevas generaciones el valor de sus raíces, y de asegurarse de que las futuras generaciones continúen practicando y transmitiendo estos rituales y celebraciones. A través de la participación en estas tradiciones, los jóvenes Mam no solo aprenden sobre su historia, sino que también se sienten parte de una comunidad que comparte valores y creencias profundas.

    

    Las costumbres y tradiciones del pueblo Mam son un testimonio de su profunda conexión con la tierra, la naturaleza y los ancestros. A través de sus festividades y rituales, los Mam celebran la vida, la fertilidad, la abundancia y la espiritualidad. Estas tradiciones no solo son una forma de honrar el pasado, sino también de asegurar el futuro de la comunidad, manteniendo viva la identidad cultural y ofreciendo un sentido de pertenencia y continuidad para las generaciones venideras. Al explorar las costumbres y tradiciones del pueblo Mam, no solo se descubre un rico legado cultural, sino también una profunda lección sobre la resistencia, la conexión con la naturaleza y el respeto por la vida.
    """)
,
    
    Seccion(title: "Gastronomía", description: "Platos típicos y su preparación.", imageName: "gastronomia", content: """
    La gastronomía del pueblo Mam es un reflejo de su conexión con la tierra y sus raíces ancestrales. A través de sus platillos tradicionales, se expresa la riqueza cultural y los conocimientos culinarios que han sido transmitidos de generación en generación. Los ingredientes autóctonos, cultivados en la región, juegan un papel crucial en la preparación de los alimentos, lo que les da un sabor único y auténtico. Cada comida Mam es mucho más que solo un platillo, es una historia de resistencia, identidad y comunidad.


    Uno de los platillos más representativos de la gastronomía Mam es el *Tamalito de Chipilín*, un delicioso manjar que combina maíz y hierbas locales. El chipilín, una planta de hojas verdes que crece en la región, es un ingrediente esencial que le otorga al tamalito un sabor y aroma únicos. El proceso de preparación es una verdadera obra de arte: las hojas de maíz se rellenan con masa de maíz, chipilín y otros ingredientes naturales, y luego se cocinan al vapor, resultando en una textura suave y un sabor fresco. El *Tamalito de Chipilín* es típicamente consumido en celebraciones y festividades, pero también forma parte de la alimentación diaria de las familias Mam.

    Este platillo no solo es sabroso, sino también nutritivo, ya que el chipilín es una planta rica en proteínas, calcio y hierro, lo que lo convierte en un alimento esencial para la dieta de la comunidad. El *Tamalito de Chipilín* es un excelente ejemplo de cómo la cocina Mam aprovecha los recursos naturales de la región para crear platillos que no solo son deliciosos, sino también saludables.


    El *Caldo de Res* es otro platillo emblemático de la cocina Mam. Este caldo espeso y reconfortante se prepara con carne de res, huesos, verduras locales y hierbas frescas. El proceso de cocción lento permite que los sabores se integren de manera profunda, creando un caldo lleno de sabor y nutrientes. Es comúnmente acompañado de arroz, tortillas y chile fresco, lo que le da un toque picante y sabroso.

    El *Caldo de Res* no solo es un platillo delicioso, sino también un símbolo de la hospitalidad Mam. Se sirve durante reuniones familiares, celebraciones y ocasiones especiales, y es considerado un platillo que une a la comunidad. La preparación del caldo es una actividad que involucra a toda la familia, desde la selección de los ingredientes hasta el momento de compartirlo en la mesa. Cada bocado del *Caldo de Res* está lleno de tradición, sabor y calidez, lo que lo convierte en un platillo querido por todos.


    El *Atol de Elote* es una bebida espesa y dulce que se prepara con maíz fresco, azúcar, canela y otros ingredientes. Este atol es una bebida tradicional que se consume especialmente en las mañanas o como merienda, y se disfruta en todo el país. El maíz, uno de los ingredientes más importantes en la cultura Mam, es el protagonista en esta bebida, que se elabora cocinando los granos de maíz con agua y luego mezclándolos con otros ingredientes hasta obtener una consistencia espesa y suave.

    El *Atol de Elote* tiene un sabor reconfortante que evoca recuerdos de la niñez y de las celebraciones familiares. Se sirve caliente, y es comúnmente acompañado de pan o tamales. En algunas ocasiones, se añade un toque de cacao o de otras especias locales, lo que le da un sabor aún más delicioso. Esta bebida, además de ser deliciosa, tiene propiedades energéticas, lo que la convierte en una opción perfecta para comenzar el día con energía.


    Los ingredientes autóctonos, cultivados en la región, son la base de la gastronomía Mam. La tierra de Guatemala y México, rica en biodiversidad, proporciona una variedad de productos como el maíz, el chipilín, las hierbas frescas y las verduras, que son esenciales para la creación de estos platillos tradicionales. La cocina Mam se caracteriza por el uso de ingredientes frescos y locales, lo que le da un sabor auténtico y genuino.

    Además de los platillos mencionados, la cocina Mam también incluye una variedad de guisos, sopas y postres, todos preparados con ingredientes naturales y cocinados de manera tradicional. La preparación de estos platillos no es solo una habilidad culinaria, sino también una forma de preservar y transmitir la cultura y las tradiciones del pueblo Mam.


    La comida Mam no solo es una parte importante de la vida cotidiana, sino también un componente clave en las celebraciones y rituales de la comunidad. Durante las festividades, la gastronomía se convierte en un medio para expresar la identidad cultural, para compartir con los demás y para rendir homenaje a los dioses y ancestros. A través de la preparación y el consumo de estos platillos, la comunidad Mam fortalece sus lazos y mantiene vivas sus tradiciones.

    La gastronomía también juega un papel importante en la educación de las nuevas generaciones. Los jóvenes aprenden a cocinar y a valorar los ingredientes autóctonos desde temprana edad, lo que les permite conectarse con su herencia cultural y continuar con las tradiciones culinarias de sus abuelos y padres. De esta manera, la comida Mam no solo alimenta el cuerpo, sino también el espíritu y la identidad del pueblo.


    La gastronomía del pueblo Mam es una celebración de los sabores, ingredientes y tradiciones que han sido parte de la comunidad durante siglos. A través de platillos como el *Tamalito de Chipilín*, el *Caldo de Res* y el *Atol de Elote*, se puede conocer mejor la historia, la cultura y la conexión espiritual de este pueblo indígena. La cocina Mam no solo es una delicia para el paladar, sino también un recordatorio de la riqueza cultural y la sabiduría ancestral que sigue viva en cada platillo preparado con amor y dedicación.
    """)
,
    
    Seccion(title: "Arte y Arquitectura", description: "Descubre el arte textil y estructuras emblemáticas.", imageName: "arquitectura", content: """
    El arte y la arquitectura del pueblo Mam son reflejos de su rica historia y conexión profunda con la tierra, la espiritualidad y la comunidad. A través de su arte textil y sus estructuras arquitectónicas, los Mam han logrado preservar su identidad cultural a lo largo de los siglos, a pesar de los cambios y desafíos que ha enfrentado la región.


    El arte textil Mam es una de las formas de expresión cultural más representativas de este pueblo. Utilizando un *telar de cintura*, los artesanos Mam crean impresionantes tejidos que no solo tienen un propósito práctico, sino también simbólico. Estos tejidos incluyen ropa tradicional, como huipiles, fajas y cinturones, y son conocidos por sus colores vibrantes y complejos patrones geométricos, que tienen significados profundamente enraizados en la cosmovisión de la comunidad.

    Cada diseño y cada color utilizado en los tejidos tiene un mensaje, una historia que conecta al portador con su identidad cultural y sus ancestros. Los patrones, por ejemplo, pueden representar elementos de la naturaleza, como montañas, ríos y animales, o pueden simbolizar eventos importantes de la historia del pueblo Mam. Los textiles también sirven como una forma de resistencia cultural, ya que, a través de ellos, los Mam han logrado preservar su lenguaje visual y sus tradiciones frente a los procesos de colonización y globalización.

    La técnica del *telar de cintura* es un arte milenario que se ha transmitido de generación en generación, principalmente de madres a hijas. El proceso es meticuloso y requiere una gran habilidad, paciencia y conocimiento. Los hilos se entrelazan con precisión para formar los tejidos, y cada pieza lleva consigo horas de trabajo dedicado y amor por la tradición. Las mujeres Mam son las principales guardianas de este arte, y sus creaciones se consideran no solo vestimenta, sino también una expresión tangible de la identidad de la comunidad.


    La arquitectura del pueblo Mam refleja una profunda comprensión de la naturaleza y de los recursos disponibles en la región. Desde tiempos prehispánicos, los Mam han utilizado materiales como el adobe y la piedra para construir sus viviendas y estructuras comunitarias, técnicas que han perdurado a lo largo de los siglos. Las casas tradicionales Mam, hechas de adobe, son especialmente resistentes al clima de la región, proporcionando un ambiente fresco en el calor y cálido en las noches frías.

    El uso del *adobe*, un material natural compuesto de tierra, agua y paja, tiene múltiples beneficios: es accesible, sostenible y excelente para la regulación térmica. Las paredes gruesas de adobe ofrecen una excelente protección contra las altas temperaturas del día y ayudan a mantener el calor durante las noches frescas. Además, el adobe es fácil de moldear y puede adaptarse a diversas formas y diseños, lo que permite una gran creatividad en la construcción de viviendas.

    La *piedra*, por otro lado, es utilizada en las estructuras más grandes y en la construcción de los templos y edificios ceremoniales. Las antiguas ruinas y pirámides de piedra, que se pueden encontrar en algunas áreas del territorio Mam, son un testimonio de la destreza y conocimientos arquitectónicos de los pueblos indígenas mayas. Estas estructuras eran utilizadas en ceremonias religiosas, y muchas de ellas todavía son consideradas lugares sagrados.

    Los diseños arquitectónicos de los Mam están inspirados por la naturaleza y la cosmovisión maya. Las viviendas suelen tener techos a dos aguas, lo que permite la ventilación natural, y los patios centrales son comunes, creando espacios abiertos y comunitarios. La disposición de las casas en los pueblos refleja una organización social basada en la cooperación y el respeto mutuo, con un énfasis en la armonía con el entorno natural.


    Tanto el arte textil como la arquitectura Mam muestran una profunda conexión con la tierra y el cosmos. Los Mam han desarrollado una cosmovisión que los vincula con la naturaleza, los ciclos agrícolas y las fuerzas espirituales. Esto se refleja en sus creaciones artísticas y arquitectónicas, que no son solo prácticas cotidianas, sino también actos simbólicos que honran a los dioses, los ancestros y la Madre Tierra.

    Por ejemplo, los patrones geométricos en los tejidos Mam pueden representar la organización del universo, con cada figura o línea vinculada a un elemento natural, como las montañas, los ríos o los cielos. Del mismo modo, las estructuras de adobe y piedra están dispuestas de manera que resuenan con los ritmos de la naturaleza y las estaciones, mostrando una comprensión profunda de cómo vivir en armonía con el entorno.


    Aunque el pueblo Mam ha mantenido sus tradiciones a lo largo de los siglos, el arte y la arquitectura no han permanecido estáticos. A lo largo del tiempo, los Mam han adaptado sus técnicas y diseños a las influencias externas, sin perder de vista su identidad cultural. Por ejemplo, el arte textil ha incorporado nuevos colores y materiales, mientras que las viviendas tradicionales ahora pueden tener elementos modernos, como ventanas de vidrio o techos de lámina, sin sacrificar la esencia de la construcción original.

    Esta capacidad de adaptación es una característica importante de la cultura Mam, que ha sabido integrar elementos externos sin perder su alma y su autenticidad. El pueblo Mam continúa siendo un ejemplo de resistencia cultural, donde el arte y la arquitectura son medios para preservar su identidad, contar su historia y celebrar su relación con el mundo natural y espiritual.


    El arte textil y la arquitectura del pueblo Mam son pilares fundamentales de su cultura y su historia. A través de los tejidos hechos en telar de cintura, los Mam han logrado contar sus historias y preservar su identidad cultural. Del mismo modo, las construcciones de adobe y piedra, que han resistido el paso del tiempo, son testigos de la sabiduría ancestral en la construcción y de la relación profunda con la tierra. El arte y la arquitectura Mam no solo son bellos, sino que son símbolos de resistencia, adaptación y conexión con el cosmos.
    """)
,
    
    Seccion(title: "Música y Danza", description: "Instrumentos y bailes tradicionales.", imageName: "danzas", content: """
    La música y la danza son elementos fundamentales en la cultura Mam, ya que no solo representan una forma de entretenimiento, sino también un medio para fortalecer los lazos comunitarios, expresar creencias espirituales y transmitir la historia del pueblo. A través de sus instrumentos musicales y danzas, los Mam mantienen vivas sus tradiciones ancestrales, celebrando su conexión con la naturaleza, los ancestros y los dioses.


    La música Mam es una rica combinación de sonidos que evocan la esencia de su tierra y su cosmovisión. Uno de los instrumentos más representativos de este pueblo es la *marimbol*, un tipo de xilófono de madera, cuyas resonantes notas han sido parte de las celebraciones y rituales Mam por generaciones. La marimbol se toca con las manos o con baquetas, y su sonido profundo y melódico se utiliza en festividades, ceremonias religiosas y eventos sociales.

    Otro instrumento clave en la música Mam es el *tun*, un tambor tradicional hecho de madera y cuero. El tun produce un sonido vibrante y potente, utilizado para marcar los ritmos de las danzas y para acompañar cantos ceremoniales. Los ritmos del tun no solo acompañan las canciones, sino que también tienen una función simbólica, representando los latidos de la Madre Tierra y la conexión del pueblo con los elementos naturales.

    La música Mam no se limita solo a estos dos instrumentos; también se encuentran flautas, maracas y otros instrumentos de percusión que enriquecen el repertorio musical. Cada uno de estos instrumentos tiene una función específica en las ceremonias y festividades, y su sonido está profundamente conectado con la espiritualidad y las creencias del pueblo Mam.

    
    La danza es otro aspecto esencial de la cultura Mam, y está estrechamente vinculada con la música. Las danzas tradicionales Mam son expresiones de alegría, agradecimiento y veneración a los dioses y los ancestros. A través del movimiento del cuerpo, los participantes se conectan con las fuerzas espirituales que gobiernan el mundo, y al mismo tiempo, afirman su identidad y pertenencia a la comunidad.

    Uno de los bailes más emblemáticos es el *Baile del Jaguar*, una danza que simula los movimientos de este majestuoso animal, considerado un símbolo de poder, sabiduría y conexión con el mundo espiritual. En esta danza, los participantes se visten con disfraces que imitan la piel y los movimientos del jaguar, y a través de sus pasos y gestos, buscan transmitir la fuerza y la agilidad de este animal sagrado. El *Baile del Jaguar* tiene un significado profundo, ya que se cree que este animal es el protector del pueblo y un intermediario entre los humanos y los espíritus de la naturaleza.

    Además del *Baile del Jaguar*, existen muchas otras danzas que celebran las estaciones del año, los ciclos agrícolas, las cosechas y los rituales de iniciación. Estas danzas son realizadas en comunidad, con hombres y mujeres participando activamente. Las coreografías a menudo imitan movimientos de la naturaleza, como el viento, la lluvia y los animales, y están diseñadas para fortalecer la conexión espiritual con los elementos que sustentan la vida.

    Las festividades y danzas son ocasiones de encuentro comunitario, donde se refuerzan los lazos de solidaridad y se transmiten los conocimientos de generación en generación. Durante las festividades, los miembros de la comunidad se visten con sus trajes tradicionales, se adornan con joyas hechas a mano y se preparan para participar en las danzas y el canto. Los niños aprenden estas tradiciones desde temprana edad, observando y participando en los rituales y celebraciones junto a los adultos, lo que asegura la continuidad de la cultura Mam.

    Además de su importancia en las festividades religiosas, las danzas y la música también son una forma de afirmar la resistencia cultural del pueblo Mam frente a las influencias externas. A través de la música y la danza, los Mam no solo celebran su identidad, sino que también se resisten a la asimilación cultural, manteniendo sus tradiciones vivas en un mundo que cambia rápidamente.

    
    La música y la danza del pueblo Mam son una rica herencia cultural que sigue siendo practicada con orgullo y pasión por las nuevas generaciones. A pesar de los desafíos que ha enfrentado el pueblo Mam, como la colonización, la modernización y la globalización, la música y la danza siguen siendo una forma vital de expresión y una herramienta para preservar la identidad cultural. Estas tradiciones son mucho más que una forma de arte; son una forma de vida, un vínculo profundo con la tierra y los ancestros, y un medio para mantener viva la conexión con lo espiritual.

    
    La música y la danza del pueblo Mam son mucho más que simples expresiones artísticas; son vehículos para mantener la espiritualidad, fortalecer la identidad cultural y asegurar la transmisión de tradiciones a las futuras generaciones. A través de sus instrumentos y bailes, los Mam continúan celebrando su conexión con la naturaleza, los ciclos de la vida y los seres espirituales. La música y la danza Mam son, sin duda, un reflejo de la rica historia y la resiliencia de este pueblo ancestral.
    """)
,
    
    Seccion(title: "Desafíos y Preservación", description: "Iniciativas para conservar la cultura Mam.", imageName: "desafios", content: """
    La cultura Mam, al igual que muchas culturas indígenas, enfrenta una serie de desafíos en la actualidad que amenazan su supervivencia y la preservación de sus tradiciones. Estos desafíos son el resultado de una combinación de factores históricos, sociales, económicos y tecnológicos que, en algunos casos, han puesto en peligro la transmisión de la lengua, las costumbres y los saberes ancestrales. Sin embargo, a pesar de estos obstáculos, diversas iniciativas están en marcha para revitalizar y preservar la cultura Mam, utilizando tanto métodos tradicionales como innovadores.


    Uno de los mayores retos que enfrenta el pueblo Mam es la pérdida gradual de su lengua materna. Aunque el idioma Mam sigue siendo hablado por una parte importante de la población, especialmente en áreas rurales, la globalización, la migración y la creciente influencia de los idiomas dominantes, como el español, han provocado una disminución en el uso del Mam en la vida cotidiana. Esto ha generado preocupación, ya que la lengua es una parte esencial de la identidad cultural y el medio principal para transmitir conocimientos tradicionales, mitos, historias y valores.

    El idioma Mam no solo es un vehículo de comunicación, sino también una forma de conexión espiritual y cultural con los ancestros. La pérdida de esta lengua implica no solo una disminución en la diversidad lingüística, sino también la desaparición de formas de pensar y ver el mundo que son únicas para este pueblo.


    Otro factor que contribuye a los desafíos culturales del pueblo Mam es la migración, tanto interna como internacional. Debido a las dificultades económicas y la búsqueda de mejores oportunidades laborales, muchos Mam han migrado a las ciudades o incluso a otros países, especialmente a los Estados Unidos. Esta migración ha llevado a una mayor asimilación cultural y la pérdida de contacto con las tradiciones rurales y los modos de vida ancestrales. En algunos casos, los jóvenes que migran a las ciudades o al extranjero tienden a adoptar más rápidamente la cultura dominante, lo que puede resultar en la desconexión de las costumbres, la lengua y las raíces de su comunidad.

    La migración también implica un alejamiento de las prácticas tradicionales de agricultura, como el cultivo de maíz y otros productos autóctonos, lo que reduce la transmisión de estos conocimientos agrícolas de generación en generación.

    A pesar de estos desafíos, existen diversas iniciativas que buscan revitalizar la cultura Mam y garantizar que sus tradiciones sigan vivas en el futuro. Estas iniciativas abarcan varias áreas, desde la educación y el uso de la tecnología hasta la creación de espacios de encuentro comunitarios.

    1. Educación y Enseñanza del Idioma Mam: 
       Varias organizaciones no gubernamentales (ONG) y grupos comunitarios están trabajando en la creación de programas educativos que promuevan el aprendizaje del idioma Mam, especialmente entre los jóvenes. Estos programas se implementan en escuelas y comunidades rurales, con el objetivo de enseñar la lengua de una manera atractiva y accesible. Además, algunas universidades han comenzado a ofrecer cursos de lenguas indígenas, lo que permite que más personas aprendan y valoren el idioma Mam.

    2. Uso de la Tecnología para la Conservación:
       La tecnología ha jugado un papel clave en los esfuerzos de preservación cultural. Herramientas como aplicaciones móviles, plataformas en línea y grabaciones de audio y video están siendo utilizadas para enseñar el idioma Mam y difundir las tradiciones culturales a una audiencia más amplia. Los jóvenes Mam, que están familiarizados con las tecnologías digitales, están siendo capacitados para utilizar estas herramientas para documentar y promover su cultura a través de redes sociales, videos, blogs y otros medios de comunicación.

    3. Proyectos de Arte y Cultura:
       Las iniciativas que promueven el arte textil y la música Mam también han ganado fuerza. Proyectos que buscan enseñar a las nuevas generaciones sobre la importancia del arte textil, la marimbol, la danza y otros aspectos de la cultura Mam están ayudando a que las tradiciones se mantengan vivas. Estos proyectos no solo promueven la preservación de las tradiciones, sino que también generan ingresos para las comunidades a través de la venta de productos artesanales.

    4. Revitalización de los Espacios Comunitarios:
       Muchas comunidades Mam están trabajando para fortalecer los espacios culturales donde se pueden realizar actividades tradicionales, como danzas, festividades religiosas y ceremonias. Estos espacios permiten que las personas se reúnan, celebren sus tradiciones y enseñen a los más jóvenes sobre la importancia de la cultura Mam. También se están promoviendo actividades intergeneracionales en las que los abuelos enseñan a los niños sobre la historia, las costumbres y el significado de la cultura Mam.

    5. El Rol de las Mujeres en la Preservación Cultural:
       Las mujeres Mam han jugado un papel fundamental en la preservación de las tradiciones, especialmente en lo que respecta a la transmisión de la lengua, las habilidades textiles y los conocimientos sobre la naturaleza y la agricultura. En muchas comunidades, las mujeres son las encargadas de enseñar a las nuevas generaciones los cantos, los rituales y las costumbres. A medida que las mujeres participan activamente en los esfuerzos de preservación, están ganando mayor visibilidad y apoyo en la lucha por la conservación de la cultura Mam.


    A pesar de estos esfuerzos, los desafíos continúan. La globalización, la migración y la homogeneización cultural siguen siendo amenazas para la preservación de la cultura Mam. Sin embargo, la resistencia del pueblo Mam, su profundo apego a sus tradiciones y su capacidad para adaptarse a los cambios sin perder su identidad les han permitido enfrentar estos desafíos con valentía. Las iniciativas actuales, combinadas con el deseo de la comunidad de preservar su legado cultural, ofrecen esperanza para el futuro.

    La preservación de la cultura Mam es una tarea compleja y de largo plazo, que requiere la colaboración de las generaciones jóvenes y mayores, el uso de nuevas tecnologías y el apoyo de la comunidad en su conjunto. A través de la educación, la innovación tecnológica y el fortalecimiento de los lazos comunitarios, el pueblo Mam está trabajando para garantizar que sus tradiciones, su idioma y su identidad continúen vivas, a pesar de los desafíos que enfrentan. La preservación cultural no es solo una lucha contra el olvido, sino una afirmación de la dignidad, la resistencia y la riqueza de una cultura que ha perdurado por siglos.
    """)
,
]

struct DetalleSeccionView: View {
    let seccion: Seccion
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(seccion.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(15)
                
                    
                Text(seccion.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)
                Spacer()
                Spacer()
                    
                Text(seccion.content)
                    //.font(.title)
                    .font(.headline) // Aumenta el tamaño de la fuente
                        .fontWeight(.bold) // Mantiene un peso fuerte en la fuente
                        .foregroundColor(.primary) // Usamos un color primario que se adapta al modo claro/oscuro
                        .padding(.horizontal)
                        .lineSpacing(12.0) // Aumenta el espaciado entre líneas para mejor legibilidad
                        .multilineTextAlignment(.leading) // Alineación a la izquierda
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                //.shadow(color: .gray, radius: 10, x: 0, y: 5) // Sombra más suave y visible
                        )
                        .padding(.horizontal, 20) // Ajusta el padding horizontal para más espacio
                        .padding(.vertical, 15) // Aumenta el espacio vertical
                
                Spacer()
            }
            //.frame(width: 400, height: 300)
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .shadow(radius: 5)
        }
        .navigationTitle(seccion.title)
    }
}

struct SeccionCard: View {
    var title: String
    var description: String
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                Spacer()
            }
            
            Text(title)
                .font(.title2)
                .bold()
                .padding(.top, 5)
            
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
        }
        .frame(width: 400, height: 300)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}


struct CulturaMamView_Previews: PreviewProvider {
    static var previews: some View {
        CulturaMamView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
