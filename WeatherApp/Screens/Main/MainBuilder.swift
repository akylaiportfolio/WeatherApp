//
//  MainBuilder.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class MainBuilder {
    
    static func create(selectCity: SearchModel? = nil) -> MainController {
        let controller = MainController()
        let repository = MainRepository()
        
        let presenter = MainPresenter(delegate: controller, repository: repository)
        
        controller.presenter = presenter
        
        presenter.selectCity(selectCity: selectCity)
        
        return controller
    }
}
