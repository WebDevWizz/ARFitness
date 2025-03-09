//
//  GymEquipment.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 12/02/25.
//

import Foundation
import RealityKit

struct GymEquipment: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let sets: Int
    let reps: Int
    
    let modelType: EquipmentType
}

extension GymEquipment { //In modo da associare ogni attrezzo ad una specifica categoria (MARK: DA AGGIORNARE OGNI VOLTA!)
    var category: String {
        switch modelType {
        case .dumbbell:
            return "Manubri"
        case .kettlebell:
            return "Kettlebell"
        case .resistanceBand:
            return "Fasce di resistenza"
        case .bilanciere:
            return "Bilanciere"
        }
    }
}


enum EquipmentType{
    case dumbbell
    case kettlebell
    case resistanceBand
    case bilanciere //MARK: DA AGGIUNGERE LA CREAZIONE DELL'OGGETTO VIRTUALE (elimina questo Mark quando l'hai fatto 🚨)
    
    //MARK: Add here other types...
    
    //MARK: 3D GEOMETRY FOR EVERY TYPE OF GYM'S EQUIPMENT
    func createEntity() -> ModelEntity {
        let mesh: MeshResource
        let material = SimpleMaterial(color: .gray, isMetallic: true)
        
        //MARK: Using a Switch for every equipment: CUSTOM FORMS
        switch self {
        case .dumbbell:
            mesh = MeshResource.generateBox(size: 0.2)
            
        case .kettlebell:
            mesh = MeshResource.generateSphere(radius: 0.15)
        
        case .resistanceBand:
            mesh = MeshResource.generateBox(size: [0.3, 0.05, 0.05])
        
        case .bilanciere:
            mesh = MeshResource.generateBox(size: [0.5, 0.07, 0.06])
        }
        
        return ModelEntity(mesh: mesh, materials: [material])
    }
}
