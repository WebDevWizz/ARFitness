//
//  ExerciseInfoView.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 24/02/25.
//

import SwiftUI

struct ExerciseInfoView: View {
    let equipment: GymEquipment  // Invece di ExerciseInfo
    
    var body: some View {
        VStack(spacing: 16) {
            Text(equipment.name)
                .font(.title)
                .bold()
            
            Text(equipment.description)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 32) {
                VStack {
                    Text("\(equipment.sets)")
                        .font(.title2)
                    Text("Serie")
                }
                
                VStack {
                    Text("\(equipment.reps)")
                        .font(.title2)
                    Text("Ripetizioni")
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    ExerciseInfoView(equipment: GymEquipment(name: "default name", description: "default description", sets: 3, reps: 3, modelType: .dumbbell))
}
