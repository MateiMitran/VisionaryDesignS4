//
//  ARFurnitureApp.swift
//  ARFurniture
//
//  Created by Mitran Matei on 31/05/2022.
//

import SwiftUI

@main
struct ARFurnitureApp: App {
    @StateObject var placementSettings = PlacementSettings()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
        }
    }
}
