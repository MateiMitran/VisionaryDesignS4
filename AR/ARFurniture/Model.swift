//
//  Model.swift
//  ARFurniture
//
//  Created by Mitran Matei on 03/06/2022.
//

import SwiftUI
import RealityKit
import Combine


enum ModelCategory: CaseIterable  {
    
    case table
    case chair
    case decor
    case light
    
    
    var label: String {
        get {
            switch self {
            case .table:
                return "Tables"
            case .chair:
                return "Chairs"
            case .decor:
                return "Decor"
            case .light:
                return "Lights"
            }
        }
    }
}

class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    
    init(name:String, category:ModelCategory, scaleComponesation: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName:"photo")!
        self.scaleCompensation = scaleComponesation
    }
    
}

struct Models {
    var all: [Model] = []
    
    init() {
        let diningTable = Model(name:"dining_table",category: .table, scaleComponesation: 0.32/100)
        let familyTable = Model(name:"family_table",category: .table, scaleComponesation: 0.32/100)
        let teaTable = Model(name:"tea_table",category: .table, scaleComponesation: 0.32/100)
        self.all += [diningTable,familyTable, teaTable]
    }
    
    func get(category:ModelCategory) -> [Model]{
        return all.filter({$0.category == category})
    }
}
