//
//  EquipmentSelectionView.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 24/02/25.
//


//MARK: THIS FILE CONTAINS THE VIEW TO SELECT THE EQUIPMENTS AFTER THE USER TAP ON BUTTON


import SwiftUI

struct EquipmentSelectionView: View {
    let position: CGPoint
    let onSelect: (GymEquipment) -> Void
    @Environment(\.dismiss) private var dismiss
    
    @State var search = ""
    @ObservedObject var myData = sharedData
    
    var filteredEquipments: [GymEquipment] { //MARK: ORDINATI PER CATEGORIA!
        if search.isEmpty {
            return myData.equipment.sorted(by: sortByCategory)
        } else {
            return myData.equipment
                .filter { equip in
                    equip.name.localizedCaseInsensitiveContains(search)
                    
                    //TODO: implementare anche la ricerca per categoria
                }
                .sorted(by: sortByCategory)
        }
    }
    
    
    //MARK: FUNZIONE PER L'ORDINAMENTO
    let categoryOrder: [EquipmentType] = [.dumbbell, .kettlebell, .resistanceBand, .bilanciere]
    func sortByCategory(_ a: GymEquipment, _ b: GymEquipment) -> Bool {
        guard let indexA = categoryOrder.firstIndex(of: a.modelType),
              let indexB = categoryOrder.firstIndex(of: b.modelType) else {
            return false
        }
        return indexA < indexB
    }
    
    
    var body: some View {
        NavigationStack {
            // MARK: List of gym equipments
            List(filteredEquipments) { equipment in
                Button(action: {
                    onSelect(equipment)
                    dismiss()
                }) {
                    HStack {
                        Text(equipment.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                                            
                        Text(equipment.category) // Mostra la categoria
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Seleziona un attrezzo")
            .searchable(text: $search, prompt: "Search")
        }
    }
}

#Preview {
    EquipmentSelectionView(
        position: CGPoint(x: 100, y: 100), //Default values
        onSelect: { _ in } // Closure of test
    )
}
