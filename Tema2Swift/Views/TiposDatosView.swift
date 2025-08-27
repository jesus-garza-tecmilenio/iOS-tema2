import SwiftUI

// Vista que muestra ejemplos de tipos de datos básicos en Swift
// Permite visualizar valores de Int, Double, String y Bool
struct TiposDatosView: View {
    // Variables de estado para cada tipo de dato
    @State private var numero: Int = 42 // Ejemplo de Int
    @State private var decimal: Double = 3.14 // Ejemplo de Double
    @State private var texto: String = "Hola mundo" // Ejemplo de String
    @State private var esVerdadero: Bool = true // Ejemplo de Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tipos de Datos Básicos").font(.title2)
            // Sección de ejemplos para cada tipo
            Group {
                Text("Int (número entero):")
                    .bold()
                Text("\(numero)")
                    .padding(.leading)
                
                Text("Double (decimal):")
                    .bold()
                Text("\(decimal)")
                    .padding(.leading)
                
                Text("String (texto):")
                    .bold()
                Text(texto)
                    .padding(.leading)
                
                Text("Bool (booleano):")
                    .bold()
                Text(esVerdadero ? "verdadero" : "falso")
                    .padding(.leading)
            }
        }
        .padding()
    }
}

// Vista previa para desarrollo y aprendizaje
struct TiposDatosView_Previews: PreviewProvider {
    static var previews: some View {
        TiposDatosView()
    }
}
