import SwiftUI

// Vista que permite experimentar con la asignación de valores y tipos en Swift
// Incluye ejemplos interactivos para Int, String, Double y Bool
struct AsignacionValoresView: View {
    // Variables de estado para cada tipo de dato
    @State private var numero: Int = 0 // Ejemplo de Int
    @State private var texto: String = "" // Ejemplo de String
    @State private var decimal: Double = 0.0 // Ejemplo de Double
    @State private var booleano: Bool = false // Ejemplo de Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Asignación de Valores").font(.title2)
            // Sección para asignar y mostrar valores de cada tipo
            Group {
                Text("Asignación de número entero (Int):")
                    .bold()
                TextField("Ingresa un número", value: $numero, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Valor actual: \(numero)")
                    .foregroundColor(.gray)
            }
            
            Group {
                Text("Asignación de texto (String):")
                    .bold()
                TextField("Ingresa un texto", text: $texto)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Valor actual: \(texto.isEmpty ? "vacío" : texto)")
                    .foregroundColor(.gray)
            }
            
            Group {
                Text("Asignación de decimal (Double):")
                    .bold()
                TextField("Ingresa un decimal", value: $decimal, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Valor actual: \(String(format: "%.2f", decimal))")
                    .foregroundColor(.gray)
            }
            
            Group {
                Text("Asignación de booleano (Bool):")
                    .bold()
                Toggle("Activar/Desactivar", isOn: $booleano)
                Text("Valor actual: \(booleano ? "verdadero" : "falso")")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}
