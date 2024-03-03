//
//  CitiesRepository.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class CitiesEditRepository {
    
    private let dataBase = DataBase.shered
    
    func getSave() -> [SearchModel] {
        return dataBase.get()
    }
    
    func removeCity(_ model: SearchModel) {
        dataBase.remove(model)
    }
}
