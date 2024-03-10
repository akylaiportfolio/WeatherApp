//
//  SplashMockRepository.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class SplashMockRepository: SplashRepository {
    
    var isEmptyCitiesMock: Bool
    
    init(isEmptyCitiesMock: Bool) {
        self.isEmptyCitiesMock = isEmptyCitiesMock
    }
    
    func isEmptyCities() -> Bool {
        return isEmptyCitiesMock
    }
}
