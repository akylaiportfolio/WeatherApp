//
//  MainRepository.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

protocol MainRepository {
    func getSave() -> [SearchModel]
}

class MainRepositoryImpl: MainRepository {
    
    private let dataBase = DataBase.shered
    
    func getSave() -> [SearchModel] {
        return dataBase.get()
    }
}
