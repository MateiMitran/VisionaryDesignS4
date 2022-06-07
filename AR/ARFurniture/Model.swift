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
    case couch
    case bed
    case decor
    
    var label: String {
        get {
            switch self {
            case .table:
                return "Tables"
            case .chair:
                return "Chairs"
            case .couch:
                return "Couches"
            case .bed:
                return "Beds"
            case .decor:
                return "Decor"
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
    
    private var cancellable: AnyCancellable?
    
    
    init(name:String, category:ModelCategory, scaleComponesation: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName:"photo")!
        self.scaleCompensation = scaleComponesation
    }
    
    
    func asyncLoadModelEntity() {
        let filename = self.name + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error): print("Unable to load modelEntity for \(filename).Error: \(error.localizedDescription)")
                case.finished:
                    break
                }
                                                
            }, receiveValue: { modelEntity in
                    self.modelEntity = modelEntity
                    
                    self.modelEntity?.scale *= self.scaleCompensation
                    print("modelEntity for \(self.name) has been loaded.")
            })
    }
}

struct Models {
    var all: [Model] = []
    
    init() {
        
        //tables
        let coffeeTable = Model(name:"Coffee_Table",category: .table, scaleComponesation: 30/100)
        let simpleDiningTable = Model(name:"Simple_dining_table",category: .table, scaleComponesation: 25/100)
        
        //chairs
        let basketSwingChair = Model(name:"Basket_Swing_Chair",category: .chair, scaleComponesation: 40/100)
        let officeChair = Model(name:"Office_chair",category: .chair, scaleComponesation: 75/100)
        let oldChair = Model(name:"Old_Chair",category: .chair, scaleComponesation: 75/100)
        
        //couches
        let blackLeatherCouch = Model(name:"Black_Leather_Couch",category: .couch, scaleComponesation: 50/100)
        let grayLShapedCouch = Model(name:"Gray_L-Shaped_Couch",category: .couch, scaleComponesation: 50/100)
        let modernCouch = Model(name:"Modern_Couch",category: .couch, scaleComponesation: 50/100)
        
        //beds
        let bedMilana = Model(name:"Bed_Milana",category: .bed, scaleComponesation: 35/100)
        let bedSicilia = Model(name:"Bed_Sicilia",category: .bed, scaleComponesation: 50/100)
        let modernBed = Model(name:"Modern_Bed",category: .bed, scaleComponesation: 50/100)
        
        //decor
        let modernTableSet = Model(name:"Modern_Table_Set",category: .decor, scaleComponesation: 45/100)
        
        self.all += [coffeeTable,simpleDiningTable, basketSwingChair, officeChair, oldChair, blackLeatherCouch, grayLShapedCouch, modernCouch, bedMilana, bedSicilia, modernBed, modernTableSet]
    }
    
    func get(category:ModelCategory) -> [Model]{
        return all.filter({$0.category == category})
    }
}
