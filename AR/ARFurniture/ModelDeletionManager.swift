//
//  ModelDeletionManager.swift
//  ARFurniture
//
//  Created by Mitran Matei on 12/06/2022.
//

import SwiftUI
import RealityKit

class ModelDeletionManager: ObservableObject {
    @Published var entitySelectedForDeletion: ModelEntity? = nil {
        willSet(newValue) {
            if self.entitySelectedForDeletion == nil, let newlySelectedModelEntity = newValue {
                print("Selecting new entitySelectedForDeletion, no prior selection")
                let component = ModelDebugOptionsComponent(visualizationMode: .lightingDiffuse)
                newlySelectedModelEntity.modelDebugOptions = component
            } else if let previouslySelectedModelEntity = self.entitySelectedForDeletion, let
                        newlySelectedModelEntity = newValue {
                print("Selecting new entitySelectedForDeletion, had a prior selection")
                previouslySelectedModelEntity.modelDebugOptions = nil
                let component = ModelDebugOptionsComponent(visualizationMode: .lightingDiffuse)
                newlySelectedModelEntity.modelDebugOptions = component
            } else if newValue == nil {
                print("Clearing entitySelectedForDeletion")
                self.entitySelectedForDeletion?.modelDebugOptions = nil
            }
        }
    }
}
