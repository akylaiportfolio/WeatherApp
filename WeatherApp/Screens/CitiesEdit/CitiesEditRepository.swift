//
//  CitiesRepository.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

protocol CitiesEditRepository {
    func getSave() -> [SearchModel]
    
    func removeCity(_ model: SearchModel)
}

class CitiesEditRepositoryImpl: CitiesEditRepository {
    
    private let dataBase = DataBase.shered
    
    func getSave() -> [SearchModel] {
        return dataBase.get()
    }
    
    func removeCity(_ model: SearchModel) {
        dataBase.remove(model)
    }
}
