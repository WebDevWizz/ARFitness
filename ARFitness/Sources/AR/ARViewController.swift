//
//  ARViewController.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 11/02/25.
//

// Gestione di tutta la logica AR (AR e fotocamera)

import UIKit
import SwiftUI
import RealityKit
import ARKit


class ARViewController: UIViewController, ARSessionDelegate {
    var arView: ARView!
    //var selectedTool: ModelEntity? //Keep track of gym tool
    //Ora mi serve in realtà l'insieme di attrezzi:
    private var equipmentEntities: [UUID: (entity: ModelEntity, equipment: GymEquipment)] = [:]
    
    /* STANDARD FUNCTIONS FOR THE AR AMBIENT*/
    //View Initialization
    override func loadView(){
        arView = ARView(frame: .zero)
        view = arView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupAR()
        setupGestures()
    }
    
    //MARK: Setup AR session:
    private func setupAR() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // Recognizes horizontal surfaces (ex: table, floor)
        
        arView.session.delegate = self
        arView.session.run(config)
        
    }
    
    //Setup Gestures in AR
    private func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap)) //Recognize the gesture when function 'handleTap' is called
        
        arView.addGestureRecognizer(tap)
    }
    
    /*@objc func handleTap(_ gesture: UITapGestureRecognizer) {
        //Take the tap position
        let location = gesture.location(in: arView)
        
        //Tap's logic:
        if arView.entity(at: location) is
            ModelEntity {
            showExerciseInfo()
        } else {
            placeTool(at: location)
        }
    }*/
    
    //MARK: New HandleTap function:
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: arView)
        
        //Define gesture:
        //If user tap an existing equip.:
        if let entity = arView.entity(at: location) as? ModelEntity,
           let equipmentInfo = equipmentEntities.first(where: { $0.value.entity == entity}) {
            showExerciseInfo(for: equipmentInfo.value.equipment)
           } else {
               //User is tapping a surface => show the selector to choose a gym equip:
               showEquipmentSelector(at: location)
           }
    }
    
    
    //MARK: FUNCTION TO PLACE THE VIRTUAL EQUIPMENT IN THE AR VIEW:
    private func placeEquipment(_ equipment: GymEquipment, at location: CGPoint)
    {
        //Raycast to find the position:
        guard let raycastResult = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal).first else { return }
        
        //MARK: entity + anchor + adding entity and anchor to the scene
        let entity = equipment.modelType.createEntity()
        let anchor = AnchorEntity(world: raycastResult.worldTransform)
        anchor.addChild(entity)
        arView.scene.addAnchor(anchor)
        
        //Save
        equipmentEntities[equipment.id] = (entity, equipment)
    }
    
    
    
    
    private func showEquipmentSelector(at position: CGPoint) {
        let selectionView = UIHostingController(
                rootView: EquipmentSelectionView(position: position) { [weak self] equipment in
                        self?.placeEquipment(equipment, at: position)
                }
        )
        
        selectionView.modalPresentationStyle = .popover
        selectionView.preferredContentSize = CGSizeMake(300, 400)
        
        //Logic:
        if let popover = selectionView.popoverPresentationController {
            popover.sourceView = arView
            popover.sourceRect = CGRect(origin: position, size: .zero)
        }
        
        present(selectionView, animated: true)
    }
    /* private func placeTool(at location: CGPoint) {
        //Use raycast to find the point where place the tool:
        guard let raycastResult = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal).first
            
        else {return}
        
        //Object Virtual creation:
        let mesh = MeshResource.generateBox(size: 0.2)
        let material = SimpleMaterial(color: .gray, isMetallic: true)
        let tool = ModelEntity(mesh: mesh, materials: [material])
        
        //ANCHOR:
        let anchor = AnchorEntity(world: raycastResult.worldTransform)
        anchor.addChild(tool)
        
        //Adding anchor to the view:
        arView.scene.addAnchor(anchor)
        
        selectedTool = tool
    }*/
    
    
    
    
    
    //A function that shows the info about an exercise after user tap on it
    private func showExerciseInfo(for equipment: GymEquipment) {
        let infoView = UIHostingController(
            rootView: ExerciseInfoView(equipment: equipment).frame(width: 300))
        
        infoView.modalPresentationStyle = .popover
        infoView.popoverPresentationController?.sourceView = arView
        infoView.popoverPresentationController?.sourceRect = CGRect(
            x: arView.center.x,
            y: arView.center.y,
            width: 0,
            height: 0
        )
        
        present(infoView, animated: true)
    }
}
