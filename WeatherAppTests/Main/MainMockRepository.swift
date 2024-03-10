//
//  MainMockRepository.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class MainMockRepository: MainRepository {
    
    private var mockModel: [SearchModel]
    
    init(mockModel: [SearchModel]) {
        self.mockModel = mockModel
    }
    
    func getSave() -> [SearchModel] {
        return mockModel
    }
}
