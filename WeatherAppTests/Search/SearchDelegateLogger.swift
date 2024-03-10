//
//  SearchDelegateLogger.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class SearchDelegateLogger: SearchDelegate {
    
    var showResultSearchLog: [SearchModel]? = nil
    var showPopularLog: [SearchModel]? = nil
    
    func showResultSearch(model: [SearchModel]) {
        self.showResultSearchLog = model
    }
    
    func showPopular(model: [SearchModel]) {
        self.showPopularLog = model
    }
}
