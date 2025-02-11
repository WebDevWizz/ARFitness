//
//  ContentView.swift
//  ARFitness
//
//  Created by Riccardo Ciullini on 11/02/25.
//

import SwiftUI
import ARKit
import RealityKit

struct ContentView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

//Struct that integrate ARView in SwuiftUI
struct ARViewContainer: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> ARViewController {
            return ARViewController()
        }
        
    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {}
}

#Preview {
    ContentView()
}
