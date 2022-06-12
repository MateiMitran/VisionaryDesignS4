//
//  ScenePersistenceHelper.swift
//  ARFurniture
//
//  Created by Mitran Matei on 11/06/2022.
//

import Foundation
import RealityKit
import ARKit

class ScenePersistenceHelper {
    class func saveScene(for arView: CustomARView, at persistenceUrl: URL) {
        arView.session.getCurrentWorldMap {worldMap, error in
            
            guard let map = worldMap else {
                print("Persistence Error: unable to get world map")
                return
            }
            
            do {
                let sceneData = try NSKeyedArchiver.archivedData(withRootObject: map, requiringSecureCoding: true)
                
                try sceneData.write(to: persistenceUrl, options: [.atomic])
            } catch {
                print ("Persistence Error: Can't save scene to local filesystem: \(error.localizedDescription)")
            }
        }
    }
    
    class func loadScene(for arView: CustomARView, with scenePersistenceData: Data) {
        print("Load scene from local files")
        
        let worldMap: ARWorldMap =  {
            do {
                guard let worldMap = try NSKeyedUnarchiver.unarchivedObject(ofClass: ARWorldMap.self, from: scenePersistenceData) else {
                    fatalError("Persistence Error: No ARWorldMap in archive")
                }
                
                return worldMap
            } catch {
                fatalError("Persistence Error: Unable to unarchive ARWorldMap from scenePersistenceData")
            }
        }()
        
        
        let newConfig = arView.defaultConfiguration
        newConfig.initialWorldMap = worldMap
        arView.session.run(newConfig, options: [.resetTracking,.removeExistingAnchors])
    }
}
