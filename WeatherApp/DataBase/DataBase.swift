//
//  DataBase.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 3/3/24.
//

import Foundation

class DataBase {
    
    static let shered = DataBase()
    
    func remove(_ model: SearchModel) {
        let data = UserDefaults.standard.data(forKey: "SaveSearchModel")
        
        if let data = data {
            var models = try? JSONDecoder().decode([SearchModel].self, from: data)

            if let list = models {
                for item in list.enumerated() {
                    if item.element.name == model.name {
                        models?.remove(at: item.offset)
                    
                        break
                    }
                }
            }
            
            if let models = models, let data = try? JSONEncoder().encode(models) {
                UserDefaults.standard.setValue(data, forKey: "SaveSearchModel")
            }
        }
    }
    
    func put(_ model: SearchModel) {
        let data = UserDefaults.standard.data(forKey: "SaveSearchModel")
        
        if let data = data {
            var models = try? JSONDecoder().decode([SearchModel].self, from: data)
            models?.append(model)
            
            if let models = models, let data = try? JSONEncoder().encode(models) {
                UserDefaults.standard.setValue(data, forKey: "SaveSearchModel")
            }
        } else {
            if let models = [model] as? [SearchModel], let data = try? JSONEncoder().encode(models) {
                UserDefaults.standard.setValue(data, forKey: "SaveSearchModel")
            }
        }
    }
    
    func get() -> [SearchModel] {
        let data = UserDefaults.standard.data(forKey: "SaveSearchModel")
        
        if let data = data {
            return (try? JSONDecoder().decode([SearchModel].self, from: data)) ?? []
        }
        
        return []
    }
}
