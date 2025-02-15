//
//  ExerciseInfoView.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 11/02/25.
//

// Vista delle info esercizio

import SwiftUI

struct ExerciseInfoView: View {
    let equipment: GymEquipment
    
    var body: some View{
        VStack{
            VStack(spacing: 25) {
                    Text(equipment.name)
                        .font(.title)
                        .bold()
                        
                    Text(exercise.description)
                        .multilineTextAlignment(.center)
                        
                    HStack(spacing: 35) {
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
}

#Preview {
    ExerciseInfoView(equipment: ExerciseInfo(name: "Panca Piana", description: "Esercizio per il petto", category: "Petto", sets: 3, reps: 10))
}
