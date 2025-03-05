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
    
    
    var body: some View {
        NavigationStack {
            //MARK: List of gym equipments
            List(EquipmentCatalog.shared.equipment) { equipment in
                Button(action: {
                    onSelect(equipment)
                    dismiss()
                }) {
                    HStack {
                        Text(equipment.name)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Seleziona un attrezzo")
        }
    }
}

#Preview {
    EquipmentSelectionView(
        position: CGPoint(x: 100, y: 100), //Default values
        onSelect: { _ in } // Closure of test
    )
}
