//
//  CitiesEditDelegateLogger.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class CitiesEditDelegateLogger: CitiesEditDelegate {
    
    var modelsLog: [SearchModel]? = nil
    
    func showSaveCitys(models: [SearchModel]) {
        self.modelsLog = models
    }
}
