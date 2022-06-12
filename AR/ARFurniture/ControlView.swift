//
//  ControlView.swift
//  ARFurniture
//
//  Created by Mitran Matei on 31/05/2022.
//

import SwiftUI

enum ControlModes: String, CaseIterable {
    case browse,scene
}


struct ControlView: View {
    
    @Binding var selectedControlMode: Int
    @Binding var isControlsVisible: Bool
    @Binding var showBrowse: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        VStack {
            ControlVisibilityToggleButton(isControlsVisible: $isControlsVisible)
            
            Spacer()
            
            if isControlsVisible {
                
                ControlModePicker(selectedControlMode: $selectedControlMode)
                ControlButtonBar(showBrowse: $showBrowse, showSetttings: $showSettings, selectedControlMode: selectedControlMode)
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
struct ControlModePicker: View {
    @Binding var selectedControlMode: Int
    let controlModes = ControlModes.allCases
    
    init(selectedControlMode: Binding<Int>) {
        self._selectedControlMode = selectedControlMode
        
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .clear
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(displayP3Red: 1.0,
            green: 0.827, blue: 0, alpha:1)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.black.opacity(0.25))
        
    }
    
    var body: some View {
        Picker(selection: $selectedControlMode, label: Text("Select a Control mode")) {
            ForEach(0..<controlModes.count) {index in
                Text(self.controlModes[index].rawValue.uppercased()).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(maxWidth: 400)
        .padding(.horizontal, 10)
    }
}




struct ControlButtonBar : View {
    @Binding var showBrowse: Bool
    @Binding var showSetttings: Bool
    
    var selectedControlMode: Int
    
    var body: some View {
        HStack(alignment: .center) {
            if selectedControlMode == 1 {
                SceneButtons()
            } else {
                BrowseButtons(showBrowse: $showBrowse, showSettings: $showSetttings)
            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
    
}

struct BrowseButtons: View {
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
                    .environmentObject(placementSettings)
            })
            
            Spacer()
            
            ControlButton(systemIconName: "slider.horizontal.3") {
                print("Settings pressed")
                self.showSettings.toggle()
            }.sheet(isPresented: $showSettings) {
                SettingsView(showSettings: $showSettings)
            }
        }
    }
}



struct SceneButtons: View {
    @EnvironmentObject var sceneManager: SceneManager
    
    var body: some View {
        ControlButton(systemIconName: "icloud.and.arrow.up") {
            self.sceneManager.shouldSaveSceneToFilesystem = true
        }
        
        Spacer()
        
        ControlButton(systemIconName:"icloud.and.arrow.down") {
            self.sceneManager.shouldLoadSceneFromFilesystem = true
        }
        .hidden(self.sceneManager.scenePersistenceData == nil)
        
        Spacer()
        
        ControlButton(systemIconName:"trash") {
            print("Clear scene pressed")
            
            for anchorEntity in self.sceneManager.anchorEntities {
                print("Removing anchorEntity with id: \(String(describing: anchorEntity.anchorIdentifier))")
                anchorEntity.removeFromParent()
            }
        }
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
