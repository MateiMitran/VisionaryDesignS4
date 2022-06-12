//
//  PlacementView.swift
//  ARFurniture
//
//  Created by Mitran Matei on 06/06/2022.
//

import SwiftUI

struct PlacementView: View {
    @EnvironmentObject  var placementSettings: PlacementSettings
    
    
    var body: some View {
        HStack {
            
            Spacer()
            
            PlacementButton(systemIconName: "heart.fill") {
                print("Cancel placement button pressed")
                self.placementSettings.selectedModel = nil
            }
            
            Spacer()
            
            PlacementButton(systemIconName: "checkmark.circle.fill") {
                print("Confirmed placement button pressed")
                
                let modelAnchor = ModelAnchor(model: self.placementSettings.selectedModel!, anchor:nil)
                self.placementSettings.modelsConfirmedForPlacement.append(modelAnchor)
                self.placementSettings.selectedModel = nil
            }
            
            Spacer()
        }
        .padding(.bottom, 30)
    }
}




struct PlacementButton: View {
    
    let systemIconName: String
    let action:() -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size:50,weight:.light,design:.default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width:75, height:75)
    }
}
