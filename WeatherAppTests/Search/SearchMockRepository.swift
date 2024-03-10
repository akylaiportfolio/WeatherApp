//
//  SearchMockRepository.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class SearchMockRepository: SearchRepository {
    
    func search(name: String, result: @escaping (Result<[SearchModel], DecoderError>) -> Void) {
        if name == "Bish" {
            result(
                .success(
                    [
                        SearchModel(name: "Bishkek", lat: 23, lon: 43, country: "KG"),
                        SearchModel(name: "Bishk", lat: 23, lon: 453, country: "KG"),
                        SearchModel(name: "Bishkiet", lat: 23, lon: 43, country: "KG"),
                        SearchModel(name: "Bishkat", lat: 234, lon: 43, country: "KG"),
                        SearchModel(name: "Bishkut", lat: 233, lon: 443, country: "KG"),
                        SearchModel(name: "Bishmints", lat: 243, lon: 43, country: "KG"),
                    ]
                )
            )
        } else {
            result(.success([]))
        }
    }
    
    var saveModel: [SearchModel] = []
    
    func save(_ model: SearchModel) {
        saveModel.append(model)
    }
    
    func getSave() -> [SearchModel] {
        return saveModel
    }
    
    func getPopular() -> [SearchModel] {
        return [
            SearchModel(name: "Bishkek", lat: 23, lon: 43, country: "KG"),
            SearchModel(name: "Osh", lat: 23, lon: 453, country: "KG"),
            SearchModel(name: "Talas", lat: 23, lon: 43, country: "KG"),
        ]
    }
}
