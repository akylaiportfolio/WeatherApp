//
//  SplashRepository.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class SplashRepository {
    
    private let dataBase = DataBase.shered
    
    func isEmptyCities() -> Bool {
        return !(dataBase.get().count > 0)
    }
}
