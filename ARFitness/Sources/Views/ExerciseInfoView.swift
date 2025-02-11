//
//  ExerciseInfoView.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 11/02/25.
//

// Vista delle info esercizio

import SwiftUI

struct ExerciseInfoView: View {
    let exercise: ExerciseInfo
    
    var body: some View{
        VStack{
            VStack(spacing: 16) {
                    Text(exercise.name)
                        .font(.title)
                        .bold()
                        
                    Text(exercise.description)
                        .multilineTextAlignment(.center)
                        
                    HStack(spacing: 32) {
                        VStack {
                            Text("\(exercise.sets)")
                                .font(.title2)
                                Text("Serie")
                            }
                            
                        VStack {
                            Text("\(exercise.reps)")
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
    ExerciseInfoView(exercise: ExerciseInfo(name: "Panca Piana", description: "Esercizio per il petto", category: "Petto", sets: 3, reps: 10))
}
