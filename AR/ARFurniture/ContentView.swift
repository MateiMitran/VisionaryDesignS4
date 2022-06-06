//
//  ContentView.swift
//  ARFurniture
//
//  Created by Mitran Matei on 31/05/2022.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @EnvironmentObject var placementSettings: PlacementSettings
    @State private var isControlsVisible: Bool = true
    @State private var showBrowse: Bool = false
     
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ARViewContainer()
            
            if self.placementSettings.selectedModel == nil {
            ControlView(isControlsVisible: $isControlsVisible, showBrowse: $showBrowse)
            } else {
                PlacementView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct ARViewContainer: UIViewRepresentable {
                            
    @EnvironmentObject var placementSettings: PlacementSettings
    
    func makeUIView(context: Context) ->
        CustomARView {
            let arView = CustomARView(frame: .zero)
            
            self.placementSettings.sceneObserver = arView.scene.subscribe(to:
               SceneEvents.Update.self, { (event) in
                
                self.updateScene(for: arView)
            
            })
            
            return arView
        }
        
        func updateUIView(_ uiView: CustomARView,
                          context: Context) {}
    
    private func updateScene(for arView: CustomARView) {
        
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity
            = confirmedModel.modelEntity {
            self.place(modelEntity, in: arView)
            
            self.placementSettings.confirmedModel = nil
        }
        
        }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        let clonedEntity = modelEntity.clone(recursive: true)
        
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation,.rotation], for: clonedEntity)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        arView.scene.addAnchor(anchorEntity)
        
        print("Added model entity")
    }
    
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlacementSettings())
    }
}
