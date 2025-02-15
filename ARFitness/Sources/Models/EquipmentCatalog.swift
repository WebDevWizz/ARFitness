//
//  EquipmentCatalog.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 14/02/25.
//

//MARK: This file contains all the predefined equipment

import Foundation

class EquipmentCatalog {
    static let shared = EquipmentCatalog() //Per usare questa classe in altri file
    
    let equipment: [GymEquipment] = [
        GymEquipment(name: "Manubrio 5kg", description: "Perfetto per curl bicipiti e shoulder press. Mantieni la schiena dritta durante l'esecuzione.", sets: 3, reps: 12, modelType: .dumbbell),
        
        GymEquipment(name: "Kettlebell 8kg", description: "Ideale per swing e goblet squat. Mantieni il core attivo durante il movimento.", sets: 4, reps: 15, modelType: .kettlebell),
        
        GymEquipment(name: "Elastico", description: "Ottimo per esercizi di mobilità e riscaldamento. Controlla il movimento in entrambe le direzioni.", sets: 3, reps: 20, modelType: .resistanceBand)
    ]
}
