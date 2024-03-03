//
//  SearchRepository.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class SearchRepository {
   
    private let api = ApiClient.shered
    
    private let dataBase = DataBase.shered
    
    func search(name: String, result: @escaping (Result<[SearchModel], DecoderError>) -> Void) {
        api.searchCity(name: name, result)
    }
    
    func save(_ model: SearchModel) {
        dataBase.put(model)
    }
    
    func getSave() -> [SearchModel] {
        return dataBase.get()
    }
    
    func getPopular() -> [SearchModel] {
        return [
            SearchModel(
                name: "Bishkek",
                lat: 42.8765615,
                lon: 74.6070079,
                country: "KG"
            ),
            SearchModel(
                name: "Osh",
                lat: 40.5361899,
                lon: 72.8033618,
                country: "KG"
            ),
            SearchModel(
                name: "Talas",
                lat: 42.5233807,
                lon: 72.2373853,
                country: "KG"
            ),
            SearchModel(
                name: "Issyk-Kul",
                lat: 42.6012952,
                lon: 78.1481889,
                country: "KG"
            ),
        ]
    }
}
