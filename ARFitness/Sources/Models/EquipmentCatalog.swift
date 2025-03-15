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
        GymEquipment(name: "Manubrio 5kg", description: "I manubri sono attrezzi versatili per l'allenamento della forza, ideali per esercizi come curl bicipiti, shoulder press e affondi. \nPerfetti per allenamenti mirati su braccia, spalle e gambe. Mantieni la schiena dritta durante l'esecuzione.", sets: 3, reps: 12, modelType: .dumbbell),
        
        GymEquipment(name: "Kettlebell 8kg", description: "La kettlebell da 8 kg è un attrezzo per l'allenamento funzionale e di forza, ampiamente utilizzato in diverse discipline fitness come il cross-training, il functional training e il kettlebell sport. Ideale per swing e goblet squat. \nMantieni il core attivo durante il movimento.", sets: 4, reps: 15, modelType: .kettlebell),
        
        GymEquipment(name: "Elastico", description: "Ottimo per esercizi di mobilità e riscaldamento. Controlla il movimento in entrambe le direzioni.", sets: 3, reps: 20, modelType: .resistanceBand),
        
        GymEquipment(name: "Bilanciere Pettorali", description: "Un bilanciere per i pettorali è un attrezzo utilizzato principalmente per allenare i muscoli del petto, ma coinvolge anche tricipiti, spalle e altri stabilizzatori. È composto da una barra dritta o leggermente curva, in acciaio o materiali leggeri, con una lunghezza standard di circa 1,8-2,2 metri. ", sets: 3, reps: 12, modelType: .bilanciere),
        
        GymEquipment(name: "Tapis Roulant", description: "Il tapis roulant è un attrezzo cardio versatile, ideale per camminate, jogging o corsa indoor. Offre velocità e inclinazione regolabili, con display per monitorare distanza, tempo e calorie bruciate. \nPerfetto per migliorare la resistenza cardiovascolare e bruciare calorie. Mantieni una postura corretta durante l'uso.", sets: 1, reps: 20, modelType: .tapisRoulant),
        
        GymEquipment(name: "Cyclette", description: "La cyclette è un attrezzo cardio ideale per migliorare la resistenza e bruciare calorie. Offre regolazione della resistenza e display per monitorare distanza, tempo e frequenza cardiaca. \nPerfetta per allenamenti a basso impatto, adatta a tutti i livelli di fitness. Mantieni una postura eretta durante l'uso.", sets: 1, reps: 30, modelType: .exerciseBike),
        
        GymEquipment(name: "Ellittica", description: "L'ellittica è un attrezzo cardio che combina movimenti di corsa, camminata e salita, riducendo l'impatto sulle articolazioni. Offre resistenza e inclinazione regolabili, con display per monitorare i progressi. \nIdeale per allenamenti completi e a basso impatto. Coinvolge sia la parte superiore che inferiore del corpo.", sets: 1, reps: 25, modelType: .elliptical),
        
        GymEquipment(name: "Vogatore", description: "Il vogatore è un attrezzo cardio e di forza che simula il movimento della voga, coinvolgendo gambe, braccia, schiena e core. Offre resistenza regolabile e display per monitorare distanza, tempo e calorie bruciate. \nIdeale per allenamenti completi e a basso impatto. Mantieni una postura corretta e un movimento fluido.", sets: 1, reps: 20, modelType: .rower),
        
        GymEquipment(name: "Stepper", description: "Lo stepper simula il movimento di salita delle scale, migliorando resistenza e tonificando gambe e glutei. Offre resistenza regolabile e display per monitorare tempo e calorie bruciate. \nPerfetto per allenamenti cardio a basso impatto. Mantieni il core attivo durante l'uso.", sets: 1, reps: 30, modelType: .stepper),
        
        GymEquipment(name: "Spin Bike", description: "La spin bike è una cyclette robusta progettata per allenamenti intensi di ciclismo indoor. Offre resistenza regolabile e una posizione di guida simile a quella di una bici da corsa. \nIdeale per sessioni HIIT o endurance. Mantieni una postura corretta e regola il sellino per un comfort ottimale.", sets: 1, reps: 30, modelType: .spinBike)
    ]
}

var sharedData = EquipmentCatalog()
