//
//  MainDekegateLogger.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class MainDelegateLogger: MainDelegate {
    
    var indexLog: Int? = nil
    var modelsLog: [SearchModel]? = nil

    func showPage(index: Int) {
        self.indexLog = index
    }
    
    func showSaveCitys(models: [SearchModel]) {
        self.modelsLog = models
    }
}
