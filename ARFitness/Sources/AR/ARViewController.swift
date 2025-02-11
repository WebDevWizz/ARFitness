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
    var selectedTool: ModelEntity? //Keep track of gym tool
    
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
    
    //Setup AR session:
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
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        //Take the tap position
        let location = gesture.location(in: arView)
        
        //Tap's logic:
        if arView.entity(at: location) is
            ModelEntity {
            showExerciseInfo()
        } else {
            placeTool(at: location)
        }
    }
    
    private func placeTool(at location: CGPoint) {
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
    }
    
    
    private func showExerciseInfo() {
        let exercise = ExerciseInfo(name: "Curl con manubri", description: "Esercizio efficace per i bicipiti. Mantieni la schiena dritta e i gomiti vicino al corpo", category: "Bicipiti", sets: 3, reps: 12)
        
        let infoView = UIHostingController(rootView: ExerciseInfoView(exercise: exercise).frame(width: 300))
        
        infoView.modalPresentationStyle = UIModalPresentationStyle.popover
        infoView.popoverPresentationController?.sourceView = arView
        infoView.popoverPresentationController?.sourceRect = CGRect(x: arView.center.x, y: arView.center.y,                    width: 0, height: 0)
        
        //Animazione del pop-up:
        present(infoView, animated: true)
    }
}
