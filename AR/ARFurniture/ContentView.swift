//
//  ContentView.swift
//  ARFurniture
//
//  Created by Mitran Matei on 31/05/2022.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State private var isControlsVisible: Bool = true
    @State private var showBrowse: Bool = false
     
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ARViewContainer()
            ControlView(isControlsVisible: $isControlsVisible, showBrowse: $showBrowse)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct ARViewContainer:
    UIViewRepresentable {
    
    func makeUIView(context: Context) ->
        ARView {
            let arView = ARView(frame: .zero)
            return arView
        }
        
        func updateUIView(_ uiView: ARView,
                          context: Context) {}
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
