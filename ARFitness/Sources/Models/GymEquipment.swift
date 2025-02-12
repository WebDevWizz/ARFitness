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


enum EquipmentType{
    case dumbbell
    case kettlebell
    case resistanceBand
    
    //MARK: Add here other types...
    
    //MARK: 3D GEOMETRY FOR EVERY TYPE OF GYM'S EQUIPMENT
    func createEntity() -> ModelEntity {
        
    }
}
