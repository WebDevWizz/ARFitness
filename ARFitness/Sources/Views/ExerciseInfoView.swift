//
//  ExerciseInfoView.swift
//  ARFitness
//

import SwiftUI

struct ExerciseInfoView: View {
    let equipment: GymEquipment
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Usa un colore di sistema per lo sfondo
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Info card con Sets e Reps
                        HStack(spacing: 20) {
                            // Sets card
                            VStack(alignment: .center) {
                                Text("Sets")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Text("\(equipment.sets)")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.primary)
                            }
                            .frame(minWidth: 120)
                            .padding(.vertical, 16)
                            .padding(.horizontal)
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                            
                            // Reps card - CORRETTO
                            VStack(alignment: .center) {
                                Text("Reps")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Text("\(equipment.reps)")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.primary)
                            }
                            .frame(minWidth: 120)
                            .padding(.vertical, 16)
                            .padding(.horizontal)
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                        }
                        .padding(.horizontal)
                        
                        // Description card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            // Testo con fallback se è vuoto
                            Text(equipment.description.isEmpty ? "No description available" : equipment.description)
                                .font(.body)
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(nil)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 5)
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                .navigationTitle(equipment.name)
            }
        }
    }
}

// Anteprima per SwiftUI Canvas
#Preview {
    ExerciseInfoView(equipment: GymEquipment(name: "Kettlebell 8kg", description: "A kettlebell is a cast iron or cast steel ball with a handle attached to the top. It is used to perform exercises that combine cardiovascular, strength and flexibility training.", sets: 3, reps: 12, modelType: .dumbbell))
}
