//
//  View+Extensions.swift
//  ARFurniture
//
//  Created by Mitran Matei on 07/06/2022.
//

import SwiftUI


extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
