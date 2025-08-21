import SwiftUI

// Vista que permite experimentar con funciones en Swift
// Incluye ejemplos interactivos de funciones simples, con parámetros y valores de retorno
struct FuncionesView: View {
    // Estado para los parámetros de las funciones
    @State private var numero1: Int = 0 // Primer número para operaciones
    @State private var numero2: Int = 0 // Segundo número para operaciones
    @State private var nombre: String = "" // Nombre para función de saludo
    @State private var veces: Int = 1 // Repeticiones para saludo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Funciones").font(.title2)
                Text("Las funciones son bloques de código reutilizable que realizan una tarea específica.")
                    .font(.caption)
                    .foregroundColor(.gray)
                // Sección de funciones simples
                Group {
                    Text("Función Simple").bold()
                    HStack {
                        TextField("Número 1", value: $numero1, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Número 2", value: $numero2, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    // Muestra resultados de suma y multiplicación
                    Text("Resultado de la suma: \(sumar(a: numero1, b: numero2))")
                    Text("Resultado de la multiplicación: \(multiplicar(a: numero1, b: numero2))")
                }
                Divider()
                    .padding(.vertical)
                // Sección de función con parámetros de texto
                Group {
                    Text("Función con Parámetros de Texto").bold()
                    TextField("Escribe tu nombre", text: $nombre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Stepper("Repeticiones: \(veces)", value: $veces, in: 1...5)
                    // Muestra el saludo repetido
                    if !nombre.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Resultado:")
                            ForEach(0..<veces, id: \.self) { _ in
                                Text(saludar(nombre: nombre))
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                Divider()
                    .padding(.vertical)
                // Sección de función con valor de retorno opcional
                Group {
                    Text("Función con Valor de Retorno Opcional").bold()
                    Text("Número mayor: \(obtenerMayor(a: numero1, b: numero2))")
                    if let promedio = calcularPromedio(num1: numero1, num2: numero2) {
                        Text("Promedio: \(String(format: "%.1f", promedio))")
                    } else {
                        Text("No se puede calcular el promedio con números negativos")
                            .foregroundColor(.red)
                    }
                }
            }
            .padding()
        }
    }
    // Funciones de ejemplo
    func sumar(a: Int, b: Int) -> Int {
        return a + b
    }
    func multiplicar(a: Int, b: Int) -> Int {
        return a * b
    }
    func saludar(nombre: String) -> String {
        return "¡Hola, \(nombre)!"
    }
    func obtenerMayor(a: Int, b: Int) -> Int {
        return max(a, b)
    }
    func calcularPromedio(num1: Int, num2: Int) -> Double? {
        guard num1 >= 0 && num2 >= 0 else { return nil }
        return Double(num1 + num2) / 2.0
    }
}
