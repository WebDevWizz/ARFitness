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
        NavigationStack{

            ZStack{
                Color("BackGround")
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Sets:").font(.title2).bold()
                            Spacer().frame(height: 8) // Aggiunge spazio verticale
                            Text("\(equipment.sets)")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .frame(width: 200, height: 200)
                        
                        Spacer(minLength: 40) // Aggiunge più spazio tra i due quadrati


                        
                        VStack(alignment: .leading) {
                            Text("Reps:").font(.title2).bold()
                            Spacer().frame(height: 8) // Aggiunge spazio verticale
                            Text("\(equipment.reps)")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .frame(width: 200, height: 200)
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description").font(.title2).bold()
                        Text(equipment.description)
                            .multilineTextAlignment(.leading) // Evita che il testo si centri in modo strano
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20) // Per non attaccarlo ai bordi
                    Spacer() //Per alzare tutto il contenuto
                }
                .navigationTitle(equipment.name)
                .padding()
            }
        }
    }
}

#Preview {
    ExerciseInfoView(equipment: GymEquipment(name: "default name", description: "default description", sets: 3, reps: 3, modelType: .dumbbell))
}
