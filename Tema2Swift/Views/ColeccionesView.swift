import SwiftUI

// Vista que permite experimentar con colecciones en Swift
// Incluye ejemplos interactivos para arreglos (Array) y diccionarios (Dictionary)
struct ColeccionesView: View {
    // Estado para el arreglo de frutas y el campo de nueva fruta
    @State private var frutas: [String] = ["Manzana", "Plátano", "Naranja", "Pera"]
    @State private var nuevaFruta: String = ""
    // Estado para el diccionario de estudiantes y campos de entrada
    @State private var estudiantes: [String: Int] = [
        "Ana": 95,
        "Juan": 87,
        "María": 92,
        "Pedro": 88
    ]
    @State private var nuevoEstudiante: String = ""
    @State private var nuevaCalificacion: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Colecciones").font(.title2)
                // Sección de arreglos
                Group {
                    Text("Arreglos (Array)").bold()
                    Text("Un arreglo es una colección ordenada de elementos del mismo tipo.")
                        .font(.caption)
                        .foregroundColor(.gray)
                    // Campo para agregar frutas al arreglo
                    HStack {
                        TextField("Nueva fruta", text: $nuevaFruta)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Agregar") {
                            if !nuevaFruta.isEmpty {
                                frutas.append(nuevaFruta)
                                nuevaFruta = ""
                            }
                        }
                        .disabled(nuevaFruta.isEmpty)
                    }
                    // Lista de frutas con opción de eliminar
                    ForEach(frutas, id: \.self) { fruta in
                        HStack {
                            Text("• \(fruta)")
                            Spacer()
                            Button {
                                if let index = frutas.firstIndex(of: fruta) {
                                    frutas.remove(at: index)
                                }
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                Divider()
                    .padding(.vertical)
                // Sección de diccionarios
                Group {
                    Text("Diccionarios (Dictionary)").bold()
                    Text("Un diccionario es una colección de pares clave-valor.")
                        .font(.caption)
                        .foregroundColor(.gray)
                    // Campo para agregar estudiantes y calificaciones
                    HStack {
                        TextField("Nombre", text: $nuevoEstudiante)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Calificación", value: $nuevaCalificacion, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                        Button("Agregar") {
                            if !nuevoEstudiante.isEmpty {
                                estudiantes[nuevoEstudiante] = nuevaCalificacion
                                nuevoEstudiante = ""
                                nuevaCalificacion = 0
                            }
                        }
                        .disabled(nuevoEstudiante.isEmpty)
                    }
                    // Lista de estudiantes con opción de eliminar
                    ForEach(Array(estudiantes.keys.sorted()), id: \.self) { estudiante in
                        HStack {
                            Text("• \(estudiante): \(estudiantes[estudiante] ?? 0)")
                            Spacer()
                            Button {
                                estudiantes.removeValue(forKey: estudiante)
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
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
struct ColeccionesView_Previews: PreviewProvider {
    static var previews: some View {
        ColeccionesView()
    }
}
