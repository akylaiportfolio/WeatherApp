//
//  SplashBuilder.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class SplashBuilder {
    
    static func create() -> SplashController {
        let controller = SplashController()
        let repository = SplashRepository()
        
        let presenter = SplashPresenter(delegate: controller, repository: repository)
        
        controller.presenter = presenter
        
        return controller
    }
}
