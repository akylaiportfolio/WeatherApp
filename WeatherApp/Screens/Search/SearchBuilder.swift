//
//  SearchBuilder.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class SearchBuilder {
    
    static func create() -> SearchController {
        let controller = SearchController()
        let repository = SearchRepository()
        
        let presenter = SearchPresenter(delegate: controller, repository: repository)
        
        controller.presenter = presenter
        
        return controller
    }
}
