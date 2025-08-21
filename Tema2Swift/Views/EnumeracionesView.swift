import SwiftUI

// Enumeraciones de ejemplo
enum DiaSemana: String, CaseIterable {
    case lunes = "Lunes"
    case martes = "Martes"
    case miercoles = "Miércoles"
    case jueves = "Jueves"
    case viernes = "Viernes"
    case sabado = "Sábado"
    case domingo = "Domingo"
    
    var esFinDeSemana: Bool {
        self == .sabado || self == .domingo
    }
}

enum Calificacion: String, CaseIterable {
    case excelente = "A"
    case bueno = "B"
    case regular = "C"
    case suficiente = "D"
    case reprobado = "F"
    
    var descripcion: String {
        switch self {
        case .excelente: return "Excelente desempeño"
        case .bueno: return "Buen desempeño"
        case .regular: return "Desempeño regular"
        case .suficiente: return "Apenas suficiente"
        case .reprobado: return "No aprobado"
        }
    }
}

// Vista que permite experimentar con enumeraciones en Swift
// Incluye ejemplos interactivos de enum personalizados y enum del proyecto
struct EnumeracionesView: View {
    // Recibe el subtema seleccionado desde la vista principal
    let temaSeleccionado: Subtemas // Enum para navegación de subtemas
    @State private var diaSeleccionado: DiaSemana = .lunes // Enum personalizado
    @State private var calificacionSeleccionada: Calificacion = .bueno // Enum personalizado
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Enumeraciones").font(.title2)
                Text("Las enumeraciones definen un tipo común para un grupo de valores relacionados.")
                    .font(.caption)
                    .foregroundColor(.gray)
                // Ejemplo de enum personalizado: días de la semana
                Group {
                    Text("Ejemplo: Días de la Semana").bold()
                    Picker("Selecciona un día", selection: $diaSeleccionado) {
                        ForEach(DiaSemana.allCases, id: \.self) { dia in
                            Text(dia.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    VStack(alignment: .leading) {
                        Text("Día seleccionado: \(diaSeleccionado.rawValue)")
                        if diaSeleccionado.esFinDeSemana {
                            Text("¡Es fin de semana! 🎉")
                                .foregroundColor(.green)
                        } else {
                            Text("Día laboral 💼")
                                .foregroundColor(.blue)
                        }
                    }
                }
                Divider()
                    .padding(.vertical)
                // Ejemplo de enum personalizado: sistema de calificaciones
                Group {
                    Text("Ejemplo: Sistema de Calificaciones").bold()
                    Picker("Selecciona una calificación", selection: $calificacionSeleccionada) {
                        ForEach(Calificacion.allCases, id: \.self) { calif in
                            Text(calif.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    VStack(alignment: .leading) {
                        Text("Calificación: \(calificacionSeleccionada.rawValue)")
                        Text(calificacionSeleccionada.descripcion)
                            .foregroundColor(
                                calificacionSeleccionada == .reprobado ? .red :
                                calificacionSeleccionada == .excelente ? .green : .blue
                            )
                    }
                }
                Divider()
                    .padding(.vertical)
                // Ejemplo de enum del proyecto: navegación de subtemas
                Group {
                    Text("Ejemplo: Enumeración del proyecto").bold()
                    Text("Tema actual seleccionado: \(temaSeleccionado.rawValue)")
                    Text("Todos los subtemas disponibles:")
                    ForEach(Subtemas.allCases, id: \.self) { tema in
                        Text("• \(tema.rawValue)")
                    }
                }
                Divider()
                    .padding(.vertical)
                // Características de las enumeraciones en Swift
                Group {
                    Text("Características de las Enumeraciones:").bold()
                    Text("• Pueden tener valores raw (crudos)")
                    Text("• Pueden tener métodos y propiedades computadas")
                    Text("• Pueden conformar a protocolos (como CaseIterable)")
                    Text("• Son tipos de datos por valor")
                }
            }
            .padding()
        }
    }
}
