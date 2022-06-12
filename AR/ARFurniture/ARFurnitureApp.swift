//
//  ARFurnitureApp.swift
//  ARFurniture
//
//  Created by Mitran Matei on 31/05/2022.
//

import SwiftUI
import Firebase

@main
struct ARFurnitureApp: App {
    @StateObject var placementSettings = PlacementSettings()
    @StateObject var sessionSettings = SessionSettings()
    @StateObject var sceneManager = SceneManager()
    @StateObject var modelsViewModel = ModelsViewModel()
    @StateObject var modelDeletionManager = ModelDeletionManager()
    init() {
        FirebaseApp.configure()
        
        Auth.auth().signInAnonymously { authResult, error in
            guard let user = authResult?.user else {
                print("FAILED ANONYMOUS AUTHENTIFICATION")
                return
            }
            
            let uid = user.uid
            print("Firebase: anonymous uuser authentication with uid: \(uid).")
            
        }
    }
    var body: some Scene {
        WindowGroup {
            Landing()
                .environmentObject(placementSettings)
                .environmentObject(sessionSettings)
                .environmentObject(sceneManager)
                .environmentObject(modelsViewModel)
                .environmentObject(modelDeletionManager)
        }
    }
}
