//
//  PlacementSettings.swift
//  ARFurniture
//
//  Created by Mitran Matei on 06/06/2022.
//

import SwiftUI
import RealityKit
import Combine
import ARKit

struct ModelAnchor {
    var model: Model
    var anchor: ARAnchor?
}

class PlacementSettings: ObservableObject {
    
    
    // when the user selects a model in browseVIEW, this property is set
    @Published var selectedModel: Model? {
        willSet(newValue) {
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    
   
    
    
    
    @Published var recentlyPlaced: [Model] = []
    
    var modelsConfirmedForPlacement: [ModelAnchor] = []
    
    
    var sceneObserver: Cancellable?
    
    
}
