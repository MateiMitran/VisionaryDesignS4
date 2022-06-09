//
//  Model.swift
//  ARFurniture
//
//  Created by Mitran Matei on 03/06/2022.
//

import SwiftUI
import RealityKit
import Combine


enum ModelCategory: String  {
    
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
    
    
    static let allValues = [ ModelCategory.table, ModelCategory.chair, ModelCategory.couch, ModelCategory.bed, ModelCategory.decor]
}

class Model: ObservableObject,Identifiable {
    
    var id: String = UUID().uuidString
    var name: String
    var category: ModelCategory
   @Published var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    
    init(name:String, category:ModelCategory, scaleComponesation: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(systemName:"photo")!
        self.scaleCompensation = scaleComponesation
        
        
        FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "thumbnails/\(self.name).png") { localUrl in
            do {
                let imageData = try Data(contentsOf: localUrl)
                self.thumbnail = UIImage(data: imageData) ?? self.thumbnail
            } catch {
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
    
    
    func asyncLoadModelEntity() {
        FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "models/\(self.name).usdz") { localUrl in
            self.cancellable = ModelEntity.loadModelAsync(contentsOf: localUrl)
                .sink(receiveCompletion: { loadCompletion in
                    switch loadCompletion {
                    case .failure(let error): print("Unable to load modelEntity for \(self.name).Error: \(error.localizedDescription)")
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
}

