//
//  ControlView.swift
//  ARFurniture
//
//  Created by Mitran Matei on 31/05/2022.
//

import SwiftUI


struct ControlView: View {
    
    @Binding var isControlsVisible: Bool
    @Binding var showBrowse: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        VStack {
            ControlVisibilityToggleButton(isControlsVisible: $isControlsVisible)
            
            Spacer()
            
            if isControlsVisible {
                ControlButtonBar(showBrowse: $showBrowse, showSettings: $showSettings)
        }
    }
}
}



struct ControlVisibilityToggleButton: View {
    
    @Binding var isControlsVisible : Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            ZStack {
                
                Color.black.opacity(0.25)
                
                Button(action: {
                    print("Control Visibility Button pressed")
                    self.isControlsVisible.toggle()
                }) {
                    Image(systemName: self.isControlsVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
                
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
        }
        .padding(.top,45)
        .padding(.trailing, 20)
    }
}

struct ControlButtonBar : View {
    
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        HStack {
            MostRecentlyPlacedButton().hidden(self.placementSettings.recentlyPlaced.isEmpty)
            
            Spacer()
            
            ControlButton(systemIconName: "square.grid.2x2") {
                print("Browse")
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse, content: {
                
                BrowseView(showBrowse: $showBrowse)
            })
            
            Spacer()
            
            ControlButton(systemIconName: "slider.horizontal.3") {
                print("Settings pressed")
                self.showSettings.toggle()
            }.sheet(isPresented: $showSettings) {
                SettingsView(showSettings: $showSettings)
            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButton: View {
    
    let systemIconName : String
    let action : () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size:35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width:50,height:50)
    }
    
    
}


struct MostRecentlyPlacedButton: View {
    
    @EnvironmentObject var placementSettings: PlacementSettings
    
    
    var body: some View {
        Button(action: {
            print("Most recently pressed")
            self.placementSettings.selectedModel = self.placementSettings.recentlyPlaced.last
        }) {
            if let mostRecentlyPlacedModel = self.placementSettings.recentlyPlaced.last {
                Image(uiImage: mostRecentlyPlacedModel.thumbnail)
                    .resizable()
                    .frame(width:46)
                    .aspectRatio(1/1,contentMode: .fit)
            } else {
                Image(systemName: "clock.fill")
                    .font(.system(size:35))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(width:50, height:50)
        .background(Color.white)
        .cornerRadius(8.0)
    }
}
