//
//  CitiesBuilder.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class CitiesEditBuilder {
    
    static func create() -> CitiesEditController {
        let controller = CitiesEditController()
        let repository = CitiesEditRepositoryImpl()
        
        let presenter = CitiesEditPresenter(delegate: controller, repository: repository)
        
        controller.presenter = presenter
        
        return controller
    }
}
