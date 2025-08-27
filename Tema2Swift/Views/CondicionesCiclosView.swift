import SwiftUI

// Vista que permite experimentar con condiciones y ciclos en Swift
// Incluye ejemplos interactivos para if-else y ciclos con ForEach
struct CondicionesCiclosView: View {
    // Estado para el contador, número y filtro de pares
    @State private var contador: Int = 0 // Contador para ciclos
    @State private var numero: Int = 0 // Número para condición
    @State private var mostrarPares: Bool = false // Filtro para mostrar solo pares
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Condiciones y Ciclos").font(.title2)
                // Sección de condiciones
                Group {
                    Text("Condiciones (if-else)").bold()
                    Text("Las condiciones nos permiten ejecutar código según una condición.")
                        .font(.caption)
                        .foregroundColor(.gray)
                    // Campo para ingresar número y mostrar resultado
                    VStack(alignment: .leading) {
                        TextField("Ingresa un número", value: $numero, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        // Ejemplo de condición
                        if numero < 0 {
                            Text("El número es negativo")
                                .foregroundColor(.red)
                        } else if numero == 0 {
                            Text("El número es cero")
                                .foregroundColor(.blue)
                        } else {
                            Text("El número es positivo")
                                .foregroundColor(.green)
                        }
                    }
                }
                Divider()
                    .padding(.vertical)
                // Sección de ciclos
                Group {
                    Text("Ciclos").bold()
                    Text("Los ciclos nos permiten repetir código varias veces.")
                        .font(.caption)
                        .foregroundColor(.gray)
                    // Controles para incrementar, reiniciar y filtrar pares
                    VStack(alignment: .leading) {
                        HStack {
                            Button("Incrementar") {
                                contador += 1
                            }
                            .buttonStyle(.bordered)
                            Button("Reiniciar") {
                                contador = 0
                            }
                            .buttonStyle(.bordered)
                            Toggle("Mostrar solo pares", isOn: $mostrarPares)
                                .padding(.leading)
                        }
                        Text("Contador: \(contador)")
                            .padding(.vertical, 5)
                        // Ejemplo de ciclo con ForEach
                        if contador > 0 {
                            Text("Números hasta el contador:")
                                .bold()
                            ForEach(1...contador, id: \.self) { numero in
                                if !mostrarPares || numero % 2 == 0 {
                                    HStack {
                                        Text("• Iteración \(numero)")
                                        if numero % 2 == 0 {
                                            Text("(par)")
                                                .foregroundColor(.blue)
                                        } else {
                                            Text("(impar)")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

// Vista previa para desarrollo y aprendizaje
struct CondicionesCiclosView_Previews: PreviewProvider {
    static var previews: some View {
        CondicionesCiclosView()
    }
}
