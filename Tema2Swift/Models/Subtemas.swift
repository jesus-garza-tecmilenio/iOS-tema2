import Foundation

// Enumeración que representa los subtemas principales del curso de Swift
// Útil para navegación y organización de la app
enum Subtemas: String, CaseIterable {
    case tiposDatos = "Tipos de Datos"          // Int, Double, String, Bool
    case asignacionValores = "Asignación de Valores" // Ejemplos de asignación y tipo
    case colecciones = "Colecciones"            // Arrays y Diccionarios
    case condicionesCiclos = "Condiciones y Ciclos" // if, else, for, while
    case funciones = "Funciones"                // Definición y uso de funciones
    case enumeraciones = "Enumeraciones"        // Uso de enum en Swift
}
