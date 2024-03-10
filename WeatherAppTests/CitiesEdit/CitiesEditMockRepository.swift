//
//  CitiesEditMockRepository.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class CitiesEditMockRepository: CitiesEditRepository {
    
    var mock: [SearchModel]
    
    init(mock: [SearchModel]) {
        self.mock = mock
    }
    
    func getSave() -> [SearchModel] {
        return mock
    }
    
    func removeCity(_ model: SearchModel) {
        var indexCheck = 0
        
        mock.enumerated().forEach { (index, item) in
            if item.name == model.name {
                indexCheck = index
            }
        }
        
        mock.remove(at: indexCheck)
    }
}
