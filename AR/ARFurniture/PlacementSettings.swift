//
//  PlacementSettings.swift
//  ARFurniture
//
//  Created by Mitran Matei on 06/06/2022.
//

import SwiftUI
import RealityKit
import Combine


class PlacementSettings: ObservableObject {
    
    
    // when the user selects a model in browseVIEW, this property is set
    @Published var selectedModel: Model? {
        willSet(newValue) {
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    
    @Published var confirmedModel: Model? {
        willSet(newValue) {
            guard let model = newValue else {
                print("clearing confirmedModel")
                return
            }
            
            print ("Setting confirmedModel to \(model.name)")
        }
    }
    
    var sceneObserver: Cancellable?
    
    
}
