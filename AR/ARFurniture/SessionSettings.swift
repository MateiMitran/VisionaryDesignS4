//
//  SessionSettings.swift
//  ARFurniture
//
//  Created by Mitran Matei on 07/06/2022.
//

import SwiftUI

class SessionSettings: ObservableObject {
    
    @Published var isPeopleOcclusionEnabled: Bool = false
    @Published var isObjectOcclusionEnabled: Bool = false
    @Published var isLidarDebugEnabled: Bool = false
    @Published var isMultiuserEnabled: Bool = false
}
