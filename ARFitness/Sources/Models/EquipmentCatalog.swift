//
//  EquipmentCatalog.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 14/02/25.
//

//MARK: This file contains all the predefined equipment

import Foundation

class EquipmentCatalog: ObservableObject {
    static let shared = EquipmentCatalog() //Per usare questa classe in altri file
    
    @Published var equipment: [GymEquipment] = [
        GymEquipment(name: "Manubrio 5kg", description: "Perfetto per curl bicipiti e shoulder press. Mantieni la schiena dritta durante l'esecuzione.", sets: 3, reps: 12, modelType: .dumbbell),
        
        GymEquipment(name: "Kettlebell 8kg", description: "La kettlebell da 8 kg è un attrezzo per l'allenamento funzionale e di forza, ampiamente utilizzato in diverse discipline fitness come il cross-training, il functional training e il kettlebell sport. Ideale per swing e goblet squat. Mantieni il core attivo durante il movimento.", sets: 4, reps: 15, modelType: .kettlebell),
        
        GymEquipment(name: "Elastico", description: "Ottimo per esercizi di mobilità e riscaldamento. Controlla il movimento in entrambe le direzioni.", sets: 3, reps: 20, modelType: .resistanceBand),
        
        GymEquipment(name: "Bilanciere Pettorali", description: "Un bilanciere per i pettorali è un attrezzo utilizzato principalmente per allenare i muscoli del petto, ma coinvolge anche tricipiti, spalle e altri stabilizzatori. È composto da una barra dritta o leggermente curva, in acciaio o materiali leggeri, con una lunghezza standard di circa 1,8-2,2 metri. ", sets: 3, reps: 12, modelType: .bilanciere),
        
        GymEquipment(name: "Manubrio 10kg", description: "Mi serve solo per verificare l'ordinamento nella lista di visualizzazione", sets: 3, reps: 12, modelType: .dumbbell)
    ]
}

var sharedData = EquipmentCatalog()
