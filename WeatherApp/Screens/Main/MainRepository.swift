//
//  MainRepository.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class MainRepository {
    
    private let dataBase = DataBase.shered
    
    func getSave() -> [SearchModel] {
        return dataBase.get()
    }
}
