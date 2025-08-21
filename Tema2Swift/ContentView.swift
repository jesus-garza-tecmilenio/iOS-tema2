//
//  ContentView.swift
//  Tema2Swift
//
//  Created by JESUS GARZA on 20/08/25.
//

import SwiftUI

// Vista principal de la app educativa de Swift
// Muestra un selector de subtemas y navega entre vistas de conceptos básicos
struct ContentView: View {
    // Estado para el subtema seleccionado en la navegación principal
    @State private var temaSeleccionado: Subtemas = .tiposDatos
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Selector de subtemas para navegar entre conceptos
                Picker("Selecciona un tema", selection: $temaSeleccionado) {
                    ForEach(Subtemas.allCases, id: \ .self) { tema in
                        Text(tema.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                // Muestra la vista correspondiente al subtema seleccionado
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        // Navegación entre vistas según el subtema seleccionado
                        switch temaSeleccionado {
                        case .tiposDatos:
                            TiposDatosView() // Tipos básicos: Int, Double, String, Bool
                        case .asignacionValores:
                            AsignacionValoresView() // Ejemplos de asignación y tipo
                        case .colecciones:
                            ColeccionesView() // Arrays y Diccionarios
                        case .condicionesCiclos:
                            CondicionesCiclosView() // if, else, ciclos
                        case .funciones:
                            FuncionesView() // Definición y uso de funciones
                        case .enumeraciones:
                            EnumeracionesView(temaSeleccionado: temaSeleccionado) // Uso de enum
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Conceptos de Swift") // Título principal
        }
    }
}

#Preview {
    ContentView()
}
